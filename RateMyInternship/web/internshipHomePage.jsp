<%-- 
    Document   : internshipHomePage
    Created on : Nov 29, 2016, 2:50:46 PM
    Author     : kevinamrein
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="database.*, dataObjects.*, java.util.*"%>
<!DOCTYPE html>
<html>
    <%
        Boolean loggedIn = false;
        
        if (session.getAttribute("signed_in") != null) {
            loggedIn = (Boolean)session.getAttribute("signed_in");
        }
        
        Organization org = Query.getOrganization(request.getParameter("id"));
        ArrayList<Internship> internships = Query.getInternships(org);
    %>
    
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- Make this dynamic so the name of the company goes here -->
        <title>Business Home Page</title>
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
                <h1 style="text-align: center; color: whitesmoke">Internship Profile</h1>
                <hr />
            </div>
            <div class="row internship-profile">
                <div class="col-md-3 col-sm-3">
                                       
                    <div class="user-wrapper">
                        <div class="description">
                            <h1 style="margin-left: -3px;"><%= org.getName() %></h1>
                            <p style="width: 200px;"><%= org.getTagline()%></p>
                            <hr style="width: 150px;" />   
                        </div>
                            <a href="viewReviews.jsp?orgId=<%= org.getId() %>" style="margin-left: 55px; margin-top: -20px; background-color: #c32f10;;" class="btn btn-social">Reviews</a> 
                     </div>
                </div>
                
                <div class="col-md-9 col-sm-9  user-wrapper">
                    <div class="description" style="margin-top: 10px;">
                         <h3>Internships:</h3>
                    <hr class="custom-hr" />
                    <%
                        for (int i = 0; i < internships.size(); i++) {
                    %>
                        <div class="row internship-card">
                            <h4><strong><%= internships.get(i).getName() %></strong></h4>
                            <p><%= internships.get(i).getDescription() %></p>
                            <p>Minimum GPA: <%= internships.get(i).getGpaRequirement() %></p>
                            <p>Minimum Class: <%= internships.get(i).getMinClassStanding() %></p>
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
                <div>
                    <a href="#">Privacy</a> / 
                    <a href="#">About</a> /
                    <a href="#">Copyright</a>
                </div> 
            </div>
        </footer>
    </body>
</html>
