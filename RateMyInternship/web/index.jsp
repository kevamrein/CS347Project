<%-- 
    Document   : index.jsp
    Created on : Nov 28, 2016, 5:32:33 PM
    Author     : shameszl
--%>
<%@page import="database.Query, dataObjects.Organization, java.util.ArrayList, java.util.ResourceBundle, java.text.DecimalFormat"%>
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
        
        ArrayList<Organization> orgs = Query.getOrganizationsInOrder("average_rating", "DESC");
    %>
    
    <head>
        <title>Rate My Internship - Home</title>
        
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />
        <link rel="stylesheet" type="text/css" href="css/font-awesome.min.css" />
        <link rel="stylesheet" type="text/css" href="css/styles.css" />
    </head>
    <body>
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
        
        <div class="top-container">
            <%
                if (orgs != null && orgs.size() != 0) {
            %>
            <div class="items">
                <a class="item" href="search.jsp">
                    <div class="item-header">
                        <%= bundle.getString("FindAnInternship") %>
                    </div>
                    <div class="item-content">
                        <i class="fa fa-search" aria-hidden="true"></i>
                    </div>
                </a>
                <a class="item"href="make_review.jsp">
                    <div class="item-header">
                        <%= bundle.getString("RateAnInternship") %>
                    </div>
                    <div class="item-content">
                        <i class="fa fa-star" aria-hidden="true"></i>
                    </div>
                </a>
                <a class="item"href="make_review.jsp">
                    <div class="item-header">
                        <%= bundle.getString("ReviewAnInternship") %>
                    </div>
                    <div class="item-content">
                        <i class="fa fa-comments" aria-hidden="true"></i>
                    </div>
                </a>
            </div>
            <%
                }
            %>
        </div>
                
        <div class="body-container">
            <h2 class="top-internships"><%= bundle.getString("TopInternships") %></h2>
            <br />
            <%
                if (orgs != null && orgs.size() != 0) {
                    int max = 10;
                    
                    if (orgs.size() < 4) {
                        max = orgs.size();
                    }
            %>
                <div class="internships">
                    <%
                       for (int i = 0; i < max; i++) {
                    %>
                        <div class="productbox">
                            <div class="imgthumb img-responsive">
                                <img height="300px" src="http://www.theswissgroup.com/wp-content/uploads/2015/11/Building-Placeholder-violet.jpg" />
                            </div>
                            <div class="caption">

                                <div class="org-name"><%= orgs.get(i).getName() %></div>
                                <div class="org-tag"><%= orgs.get(i).getTagline() %></div>

                                <a href="make_review.jsp" class="btn btn-default btn-xs pull-right" role="button">
                                    <%= String.format( "%.1f", orgs.get(i).getRating()) %> <i class="fa fa-star"></i>
                                </a> 
                                <a style="background-color: #6A509B; border: solid 2px #7F68A8;" href="<%= "internshipHomePage.jsp?id=" + orgs.get(i).getId() %>" class="btn btn-info btn-xs" role="button"><%= bundle.getString("View") %></a> 
                                <a href="make_review.jsp" class="btn btn-default btn-xs" role="button"><%= bundle.getString("Review") %></a>
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
    </body>
</html>
