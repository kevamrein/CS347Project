/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import dataObjects.User;
import database.Query;
import database.Utilities;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.regex.Pattern;
import javax.servlet.RequestDispatcher;

/**
 *
 * @author kevinamrein
 */
@WebServlet(name = "Login", urlPatterns = {"/login"})
public class Login extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        
        String username = request.getParameter("username");
        String ref = request.getParameter("ref");
        String password = request.getParameter("password");
        String output = "";
        User user = null;

            // Check if hashed password matches password in database
            user = Query.getUserCreds(username);
            String pass = Utilities.hashPassword(password);
            
            if (user == null) {
                output = "Error: Unable to find user";
            } else if (!user.getPassword().equals(Utilities.hashPassword(password))) {
                output = "Error: Passwords do not match";
            }
        
        
        if (output.contains("Error")) {
            response.sendRedirect(request.getContextPath() + "/login.jsp?error=" + output);
        } else {
            request.getSession(true).setAttribute("signed_in", true);
            request.getSession().setAttribute("username", username);
            request.getSession().setAttribute("user_id", user.getUserId());

            if (ref.length() > 0) {
                response.sendRedirect(request.getContextPath() + "/" + ref + ".jsp");
            } else {
                response.sendRedirect(request.getContextPath() + "/index.jsp");
            }
        }
    }
}
