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
        String username = request.getParameter("username");
        String password = request.getParameter("password1");
        String email = request.getParameter("email");
        String firstname = request.getParameter("firstname");
        String lastname = request.getParameter("lastname");
        String city = request.getParameter("city");
        String state = request.getParameter("state");
        /* Password and Username match regex */
        /*if ((!Pattern.matches("^[a-z][a-z0-9]*$", username)) ||
                (!Pattern.matches("^[a-z0-9!@#$*]*$", password)))
        {
            response.sendRedirect(request.getContextPath() + "/index.jsp");
        }*/
        
        /* Username already exists */
        if (Query.getUserCreds(username) != null)
        {
           response.sendRedirect(request.getContextPath() + "/index.jsp"); 
        }
        
        String hashedPassword = Utilities.hashPassword(password);

        Query.insertUser(username, hashedPassword, email, firstname, lastname, city, state);
        response.sendRedirect(request.getContextPath() + "/login.jsp"); 
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
