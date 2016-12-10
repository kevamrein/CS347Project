/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dataObjects.*;
import database.Query;
import java.util.*;
import javax.servlet.RequestDispatcher;

/**
 *
 * @author kevinamrein
 */
@WebServlet(name = "MakeReviewServlet", urlPatterns = {"/makeReview"})
public class MakeReviewServlet extends HttpServlet {

    public static Organization organization = null;
    public static Internship internship = null;

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
        String op = request.getParameter("operation");
        if (op == null || op == "") {
            User user = Query.getUserCreds((String) request.getSession().getAttribute("username"));
            String reviewNum = request.getParameter("overall_rating");
            String comment = request.getParameter("review");
            int rating = 3;
            if (reviewNum != null) {
                try {
                    rating = Integer.parseInt(reviewNum);
                } catch (NumberFormatException e) {
                    rating = 3;
                }
            }

            if (comment == null) {
                comment = "";
            }
            Review newReview = new Review(internship, user, rating, comment);
            Query.addReview(newReview);
            response.sendRedirect(request.getContextPath() + "/internshipHomePage.jsp?id=" + organization.getId());
        } else {
            String id;
            switch (op) {
                case "setOrg":
                    id = request.getParameter("orgId");
                    if (id == null || id.equals("")) {
                        organization = null;
                    } else {
                        organization = Query.getOrganization(id);
                    }
                    break;
                case "setIntern":
                    id = request.getParameter("internId");
                    if (id == null || id.equals("")) {
                        internship = null;
                    } else {
                        internship = Query.getInternship(id, organization);
                    }
                    break;
                default:
                    break;
            }

        }
    }
}
