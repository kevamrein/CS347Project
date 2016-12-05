/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import dataObjects.User;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import database.Query;
import java.util.regex.Pattern;
import javax.servlet.http.HttpSession;

/**
 *
 * @author zlsha
 */
@WebServlet(name = "EditProfile", urlPatterns = {"/edit-profile"})
public class EditProfile extends HttpServlet {

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
        HttpSession session = request.getSession();
        String output = "";
        
        response.setContentType("text/text");
        
        String userId = session.getAttribute("user_id").toString();
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String oldPassword = request.getParameter("old_password");
        String newPassword = request.getParameter("new_password");
        String firstName = request.getParameter("first_name");
        String lastName = request.getParameter("last_name");
        String city = request.getParameter("city");
        String state = request.getParameter("state");
        
        // Create user class
        User user = new User(userId, username, "", email, firstName, lastName, city, state);
        
        if (!Pattern.matches("^[a-z][a-z0-9]*$", username)) {
            output = "Error: Please enter a valid username";
        }
        
        if (!output.contains("Error")) {
            // Edit account information, excluding password
            output = Query.editUserAccount(user);
            
            // Edit the password only if password is available
            if (oldPassword.length() != 0 && newPassword.length() != 0) {
                if (!Pattern.matches("^[a-z0-9!@#$*]*$", newPassword)) {
                    output = "Error: Please enter a valid password";
                } else {
                    output = Query.editUserPassword(userId, oldPassword, newPassword);
                }
            }
        }
        
        // If there is an error, print error. If no error, send success message
        if (output.contains("Error")) {
            try (PrintWriter out = response.getWriter()) {
                out.println(output);
            }
        } else {
            try (PrintWriter out = response.getWriter()) {
                out.println("Successfully updated user information!");
            }
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "This servlet allows a user to edit their profile";
    }// </editor-fold>

}
