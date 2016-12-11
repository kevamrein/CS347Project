/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import database.Query;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author zlsha
 */
@WebServlet(name = "DeleteReview", urlPatterns = {"/deleteReview"})
public class DeleteReview extends HttpServlet {

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
        
        String user_id = (String)request.getSession().getAttribute("user_id");
        String orgId = (String)request.getParameter("org");
        String review_id = (String)request.getParameter("review_id");
        String ref = (String)request.getParameter("ref");
        Query.deleteReview(user_id, review_id);

        response.sendRedirect(request.getContextPath() + "/" + ref + ".jsp?orgId=" + orgId);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Tthis servlet is used for deleting user reviews";
    }// </editor-fold>

}
