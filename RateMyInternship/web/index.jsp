<%-- 
    Document   : index.jsp
    Created on : Nov 28, 2016, 5:32:33 PM
    Author     : shameszl
--%>
<%@page import="database.Query, dataObjects.Organization, java.util.ArrayList"%>
<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
      "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
    <%
        Boolean loggedIn = false;
        
        if (session.getAttribute("signed_in") != null) {
            loggedIn = (Boolean)session.getAttribute("signed_in");
        }
        
        ArrayList<Organization> orgs = Query.getOrganizationsInOrder("average_rating", "ASC");
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
                            <input type="text" name="query" class="form-control header-search" placeholder="Search" />
                        </div>
                        <button type="submit" class="btn btn-default header-search-btn">Search</button>
                    </form>
                    <ul class="nav navbar-nav navbar-right">
                        <%
                            if (loggedIn) {
                                out.println("<li><a href='index.jsp'>Home</a></li>");
                                out.println("<li><a href='my_account.jsp'>My Account</a></li>");
                                out.println("<li><a href='" + request.getContextPath() + "/signout'>Sign out</a></li>");
                            } else {
                                out.println("<li><a href='login.jsp'>Sign in</a></li>");
                                out.println("<li><a href='register.jsp'>Sign up</a></li>");
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
                        Find an Internship
                    </div>
                    <div class="item-content">
                        <i class="fa fa-search" aria-hidden="true"></i>
                    </div>
                </a>
                <a class="item"href="make_review.jsp">
                    <div class="item-header">
                        Rate an Internship
                    </div>
                    <div class="item-content">
                        <i class="fa fa-star" aria-hidden="true"></i>
                    </div>
                </a>
                <a class="item"href="make_review.jsp">
                    <div class="item-header">
                        Review an Internship
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
            <h2 class="top-internships">Top Internships</h2>
            <br />
            <%
                if (orgs != null && orgs.size() != 0) {
                    int max = 4;
                    
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
                                <img height="300px" src="http://www.theswissgroup.com/wp-content/uploads/2015/11/Building-Placeholder-teal.jpg" />
                            </div>
                            <div class="caption">

                                <div class="org-name"><%= orgs.get(i).getName() %></div>
                                <div class="org-tag"><%= orgs.get(i).getTagline() %></div>

                                <a href="make_review.jsp" class="btn btn-default btn-xs pull-right" role="button">
                                    <%= Math.floor(orgs.get(i).getRating()) %> <i class="fa fa-star"></i>
                                </a> 
                                <a style="background-color: #6A509B; border: solid 2px #7F68A8;" href="<%= "internshipHomePage.jsp?id=" + orgs.get(i).getId() %>" class="btn btn-info btn-xs" role="button">View</a> 
                                <a href="make_review.jsp" class="btn btn-default btn-xs" role="button">Review</a>
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
                <div>
                    <a href="#">Privacy</a> / 
                    <a href="#">About</a> /
                    <a href="#">Copyright</a>
                </div> 
            </div>
        </footer>
        
        <script type="text/javascript" src="js/jquery.min.js"></script>
        <script type="text/javascript" src="js/bootstrap.min.js"></script>
    </body>
</html>
