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
        PrintWriter out = response.getWriter();
        response.setContentType("text/html");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        if ((!Pattern.matches("^[a-z][a-z0-9]*$", username))
                || (!Pattern.matches("^[a-z0-9!@#$*]*$", password))) {
            response.sendRedirect(request.getContextPath() + "/index.jsp");
        } else {
            //response.sendRedirect(request.getContextPath() + "/index.jsp");
            Boolean signedIn = new Boolean(true);
            request.getSession(true).setAttribute("signed_in", signedIn);
            request.getSession().setAttribute("username", username);
            String nextJSP = "/index.jsp";
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(nextJSP);
            dispatcher.forward(request, response);
        }
    }
}
