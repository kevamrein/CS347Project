<%-- 
    Document   : internshipHomePage
    Created on : Nov 29, 2016, 2:50:46 PM
    Author     : kevinamrein
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
        
        if (session.getAttribute("signed_in") != null) {
            loggedIn = (Boolean)session.getAttribute("signed_in");
        }
        
        Organization org = Query.getOrganization(request.getParameter("id"));
        ArrayList<Internship> internships = Query.getInternships(org);
    %>
    
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <!-- Make this dynamic so the name of the company goes here -->
        <title>Rate My Internship - Business Home Page</title>
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />
        <link rel="stylesheet" type="text/css" href="css/font-awesome.min.css" />
        <link rel="stylesheet" type="text/css" href="css/styles.css" />
        <link rel="stylesheet" type="text/css" href="css/reviewStyle.css" />
        <script type="text/javascript" src="js/jquery.min.js"></script>
        <script type="text/javascript" src="js/bootstrap.min.js"></script>
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
                <h1 style="text-align: center; color: whitesmoke"><%= bundle.getString("InternshipProfile") %></h1>
                <hr />
            </div>
            <div class="row internship-profile">
                <div class="col-md-3 col-sm-3">           
                    <div class="user-wrapper">
                        <div class="description">
                            <h1 style="margin-left: -3px;"><%= org.getName() %></h1>
                            <p style="width: 195px;"><%= org.getTagline()%></p>
                            <hr style="width: 150px;" />   
                        </div>
                        
                        <div class="body-rows" style="margin-left: 40px;">
                            <a href="viewReviews.jsp?orgId=<%= org.getId() %>" style="background-color: #c32f10;;" class="btn btn-social"><%= bundle.getString("ViewReviews") %></a> 
                            <a href="make_review.jsp" style="background-color: #c32f10; margin-bottom: 2em;" class="btn btn-social"><%= bundle.getString("MakeReview") %></a>
                        </div>
                    </div>
                </div>
                
                <div class="col-md-9 col-sm-9  user-wrapper">
                    <div class="description" style="margin-top: 10px;">
                         <h3><%= bundle.getString("Internships") + ":" %></h3>
                    <hr class="custom-hr" />
                    <%
                        for (int i = 0; i < internships.size(); i++) {
                    %>
                        <div class="row internship-card">
                            <h4><strong><%= internships.get(i).getName() %></strong></h4>
                            <p><%= internships.get(i).getDescription() %></p>
                            <p><%= bundle.getString("MinimumGPA") + ":" %> <%= internships.get(i).getGpaRequirement() %></p>
                            <p><%= bundle.getString("MinimumClass") + ":" %> <%= internships.get(i).getMinClassStanding() %></p>
                        </div>
                    <%
                        }
                    %>
                    
                    </div>
                </div>
            </div>     
        </div>
        
        <!-- Footer Goes Below-->
        <footer class="footer">
            <div class="container">
                <p class="text-muted">Rate My Internship</p>
            </div>
        </footer>
    </body>
</html>
