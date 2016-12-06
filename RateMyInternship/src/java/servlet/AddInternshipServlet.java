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
import database.*;

/**
 *
 * @author kevinamrein
 */
@WebServlet(name = "AddInternshipServlet", urlPatterns = {"/addInternship"})
public class AddInternshipServlet extends HttpServlet {

 
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
        String name = request.getParameter("internName");
        String description = request.getParameter("internDescription");
        String minGPA = request.getParameter("minimumGPA");
        String minClassStanding = request.getParameter("minStanding");
        Organization org = MakeReviewServlet.organization;
        
        if (minGPA == null || minGPA.equals("")) {
            minGPA = "None";
        } else {
            try {
                Double.parseDouble(minGPA);
            } catch (Exception e) {
                minGPA = "None";
            }
        }
        
        if (minClassStanding == null || minClassStanding.equals("None")) {
            minClassStanding = "None";
        }
        Internship newIntern = new Internship(org, name, description, minGPA, minClassStanding);
        Query.addInternship(newIntern);
    }

}
