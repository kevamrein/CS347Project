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

/**
 *
 * @author samcarswell
 */
@WebServlet(name = "forgot_password", urlPatterns = {"/forgot_password"})
public class ForgotPassword extends HttpServlet {

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
        response.setContentType("text;charset=UTF-8");
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String output = "";
        
        User user = Query.getUserCreds(username);
        
        if (user == null) {
            output = "Error: User does not exist.";
        } else if (!user.getEmail().equals(email)) {
            output = "Error: Email does not match.";
        }
        
        if (output.contains("Error")) {
            response.sendRedirect(request.getContextPath() + "/forgot_password.jsp?error=" + output);
        } else {
            request.getSession(true).setAttribute("user_id", user.getUserId());
            response.sendRedirect(request.getContextPath() + "/change_password.jsp");
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Servlet for Forget Password Page";
    }// </editor-fold>

}
