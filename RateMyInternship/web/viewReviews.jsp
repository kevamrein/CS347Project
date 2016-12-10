<%-- 
    Document   : viewReviews
    Created on : Nov 26, 2016, 12:16:08 PM
    Author     : kevinamrein
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="database.*, dataObjects.*, java.util.*"%>
<!DOCTYPE html>
<html>
    <%
        Boolean loggedIn = false;
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
        <link rel="stylesheet" type="text/css" href="css/styles.css" />
        <link rel="stylesheet" type="text/css" href="css/reviewStyle.css" />
        <title>All Reviews</title>
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
                    
        <div class="body-container">
            <div class="body-header">
                <h1 style="text-align: center; color: whitesmoke">All Reviews</h1>
                <hr />
                <h3 style="text-align: center; color: whitesmoke"><%= org.getName() %></h3>
                <h4 style="text-align: center; color: whitesmoke">Avg. Review: <%= org.getRating() %> / 5</h4>
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
                            <div class="body-cols">
                                <div class="body-rows" style="max-width: 580px;">
                                    <div class="body-cols flex-start">
                                        <h2 class="result-header"><%= reviews.get(i).getInternship().getName() %></a></h2>
                                        <h5 class="result-subheader">by: <%= reviews.get(i).getUser().getFirstName() + " " + reviews.get(i).getUser().getLastName() %></a></h5>
                                    </div>
                                    
                                    <p><%= reviews.get(i).getComment() %></p>
                                </div>
                                <div class="review-rating">
                                    <h3>Review: <%= reviews.get(i).getRating() %> / 5</h3>
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

        <script type="text/javascript" src="js/jquery.min.js"></script>
        <script type="text/javascript" src="js/bootstrap.min.js"></script>

        <!-- Footer Goes Below-->
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
    </body>
</html>
