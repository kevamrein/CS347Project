/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;
import database.*;
import dataObjects.*;
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
@WebServlet(name = "ChangePassword", urlPatterns = {"/ChangePassword"})
public class ChangePassword extends HttpServlet {

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
        String answer = request.getParameter("answer");
        String password = request.getParameter("password");
        String confirm = request.getParameter("confirm");
        String user_id;
        String output = "";
        
        user_id = request.getSession().getAttribute("user_id").toString();
        User user = Query.getUser(user_id);
        
        if (!user.getAnswer().equals(answer))
        {
            output = "Error: Answer does not match.";
        } else if (!Utilities.isValidPassword(password))
        {
            output = "Error: Password contains invalid characters";
        } else if (!password.equals(confirm))
        {
            output = "Error: Passwords do not match";
        } else
        {
            output = Query.editUserPassword(user_id, user.getPassword(), Utilities.hashPassword(password));
            if (!output.contains("Error"))
            {
                request.getSession(true).setAttribute("signed_in", true);
                request.getSession().setAttribute("username", user.getUsername());
                request.getSession().setAttribute("user_id", user.getUserId());
                response.sendRedirect(request.getContextPath() + "/index.jsp");
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
        return "Short description";
    }// </editor-fold>

}
