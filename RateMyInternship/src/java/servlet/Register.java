/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.regex.Pattern;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import database.*;
import dataObjects.*;
import javax.servlet.RequestDispatcher;

/**
 *
 * @author carswesp
 */
@WebServlet(name = "Register", urlPatterns = {"/register"})
public class Register extends HttpServlet {

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String output = "";
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String confirm = request.getParameter("confirm");
        String email = request.getParameter("email");
        String firstname = request.getParameter("firstname");
        String lastname = request.getParameter("lastname");
        String city = request.getParameter("city");
        String state = request.getParameter("state");
        int security_index = Integer.parseInt(request.getParameter("question"));
        String answer = request.getParameter("answer");
        
        String hashedPassword = null;
        
        // Check if user is not already registered
        User user = Query.getUserCreds(username);
        if (user != null) {
            output = "Error: An account is already registered with that username";
        } else {
            if (!password.equals(confirm)) {
                output = "Error: Please confirm your password with the same password";
            } else {
                hashedPassword = Utilities.hashPassword(password);
                output = Query.insertUser(username, hashedPassword, email, firstname, lastname, city, state, security_index, answer);
            }
        }
        
        // If there was an error, print error, else, redirect.
        if (output.contains("Error")) {
            response.sendRedirect(request.getContextPath() + "/register.jsp?error=" + output);
        } else {
            user = Query.getUserCreds(username);
            request.getSession(true).setAttribute("signed_in", true);
            request.getSession().setAttribute("username", username);
            request.getSession().setAttribute("user_id", user.getUserId());
            response.sendRedirect(request.getContextPath() + "/index.jsp"); 
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
