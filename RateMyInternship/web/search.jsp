<%-- 
    Document   : search
    Created on : Nov 28, 2016, 7:23:02 PM
    Author     : Austin VErshel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="database.*, dataObjects.*, java.util.*"%>
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE html 
    PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
    <%
        boolean loggedIn = false;
        ResourceBundle bundle = ResourceBundle.getBundle("bundle.messages", request.getLocale());
        ArrayList<Organization> orgs = null;

        if (session.getAttribute("signed_in") != null) {
            loggedIn = (Boolean) session.getAttribute("signed_in");
        }
        
        if (request.getParameter("query") != null) {
           orgs = Query.getOrganizationsBy("organization_name", request.getParameter("query"));
        }
    %>

    <head>
        <title>Rate My Internship - Search</title>

        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />
        <link rel="stylesheet" type="text/css" href="css/styles.css" />
    </head>
    <body class="body-background">
        <nav class="navbar navbar-default">
            <div class="container-fluid">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="index.jsp">RATE MY INTERNSHIP</a>
                </div>

                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <form class="navbar-form navbar-left" role="search" method="get" action="search.jsp">
                        <div class="form-group">
                            <input type="text" name="query" class="form-control header-search" placeholder="<%= bundle.getString("Search") %>" />
                        </div>
                        <button type="submit" class="btn btn-default header-search-btn"><%= bundle.getString("Search") %></button>
                    </form>
                    <ul class="nav navbar-nav navbar-right">
                        <%
                            if (loggedIn) {
                                out.println("<li><a href='index.jsp'>" + bundle.getString("Home") + "</a></li>");
                                out.println("<li><a href='my_account.jsp'>" + bundle.getString("MyAccount") + "</a></li>");
                                out.println("<li><a href='" + request.getContextPath() + "/signout'>" + bundle.getString("SignOut") + "</a></li>");
                            } else {
                                out.println("<li><a href='login.jsp'>" + bundle.getString("SignIn") + "</a></li>");
                                out.println("<li><a href='register.jsp'>" + bundle.getString("SignUp") + "</a></li>");
                            }
                        %>
                    </ul>
                </div>
            </div>
        </nav>
                    
        <div class="body-container">
            <div class="body-header">
                <h1 style="text-align: center; color: whitesmoke">
                    <%= (orgs == null || orgs.size() == 0) ? bundle.getString("NoResults") : bundle.getString("Results") %>
                </h1>
                <hr />
            </div>
            <%
                if (request.getParameter("query") != null && orgs != null) {
            %>
                <div class="results">
                    <%
                        for (int i = 0; i < orgs.size(); i++) {
                    %>
                        <div class="result">
                            <div class="body-cols">
                                <div class="body-rows" style="max-width: 585px;">
                                    <h2 class="result-header"><a href="internshipHomePage.jsp?id=<%= orgs.get(i).getId() %>"><%= orgs.get(i).getName() %></a></h2>
                                    <p><%= orgs.get(i).getTagline() %></p>
                                </div>
                                <div class="body-rows rating">
                                    <h3><%= String.format( "%.2f", orgs.get(i).getRating()) %>/5</h3>
                                    <a type="button"class="btn-sm btn-primary" style="width: 100px;" href="viewReviews.jsp?orgId=<%= orgs.get(i).getId() %>"><%= bundle.getString("ViewReviews") %></a>
                                </div>
                            </div>
                        </div>
                    <%
                        }   
                    %>
                </div>
            <%
                }
            %>
        </div>
        
        <footer class="footer">
            <div class="container">
                <p class="text-muted">Rate My Internship</p>
            </div>
        </footer>

        <script type="text/javascript" src="js/jquery.min.js"></script>
        <script type="text/javascript" src="js/bootstrap.min.js"></script>
        </style>
    </body>
</html>
