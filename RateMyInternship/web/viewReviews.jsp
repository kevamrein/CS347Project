<%-- 
    Document   : viewReviews
    Created on : Nov 26, 2016, 12:16:08 PM
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
        Organization org = null;
        ArrayList<Review> reviews = null;
        String organizationId = request.getParameter("orgId");
        
        if (session.getAttribute("signed_in") != null) {
            loggedIn = (Boolean)session.getAttribute("signed_in");
        }

        if (organizationId != null) {
            organizationId = organizationId.substring(0, organizationId.length());
            org = Query.getOrganization(organizationId);
            reviews = Query.getReviews(org);
        }
    %>
    
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />
        <link rel="stylesheet" type="text/css" href="css/font-awesome.min.css" />
        <link rel="stylesheet" type="text/css" href="css/styles.css" />
        <link rel="stylesheet" type="text/css" href="css/reviewStyle.css" />
        <title>Rate My Internship - All Reviews</title>
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
                <h1 style="text-align: center; color: whitesmoke"><%= bundle.getString("AllReviews") %></h1>
                <hr />
                <div class="body-cols" style="width: 400px; margin: 0 auto;">
                    <div>
                        <h3 style="text-align: center; color: whitesmoke"><%= org.getName() %></h3>
                        <h4 style="text-align: center; color: whitesmoke"><%= bundle.getString("AvgReview") + ":" %> <%= String.format( "%.1f", org.getRating()) %> / 5</h4>
                    </div>
                    <div>
                        <a href="make_review.jsp" style="margin-top: 1.5em; background-color: #6A509B" class="btn btn-social"><%= bundle.getString("MakeReview") %></a>
                    </div>
                </div>
            </div>
            <br />
            <%
                if (request.getParameter("orgId") != null && reviews != null) {
            %>
                <div class="results">
                    <%
                        for (int i = 0; i < reviews.size(); i++) {
                    %>
                        <div class="result">
                            <% if (reviews.get(i).getUser().getUsername().equals(session.getAttribute("username"))) { %>
                                <form action="deleteReview" method="post" onsubmit="return areYouSure()">
                                    <input type="hidden" name="org" value="<%= request.getParameter("orgId") %>" />
                                    <input type="hidden" name="ref" value="viewReviews" />
                                    <input type="hidden" name="review_id" value="<%= reviews.get(i).getReviewId() %>" />
                                    <button type="submit" class="fa fa-2x fa-times hover-only"></button>
                                </form>
                            <% } %>
                            <div class="body-cols">
                                <div class="body-rows" style="max-width: 580px;">
                                    <div class="body-cols flex-start">
                                        <h2 class="result-header"><%= reviews.get(i).getInternship().getName() %></a></h2>
                                        <h5 class="result-subheader">by: <%= reviews.get(i).getUser().getFirstName() + " " + reviews.get(i).getUser().getLastName() %></a></h5>
                                    </div>
                                    
                                    <p><%= reviews.get(i).getComment() %></p>
                                </div>
                                <div class="review-rating">
                                    <h3><%= bundle.getString("Review") + ":" %> <%= reviews.get(i).getRating() %> / 5</h3>
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
        <script>
            function areYouSure() {
                if (confirm("Are you sure you want to delete your comment?")) {
                    return true;
                } else {
                    return false;
                }
            }
        </script>
    </body>
</html>
