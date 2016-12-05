<%-- 
    Document   : internshipHomePage
    Created on : Nov 29, 2016, 2:50:46 PM
    Author     : kevinamrein
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="database.*, dataObjects.*, java.util.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- Make this dynamic so the name of the company goes here -->
        <title>Business Home Page</title>
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />
        <link rel="stylesheet" type="text/css" href="css/styles.css" />
        <link rel="stylesheet" type="text/css" href="css/reviewStyle.css" />
        <script type="text/javascript" src="js/jquery.min.js"></script>
        <script type="text/javascript" src="js/bootstrap.min.js"></script>
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
                    <a class="navbar-brand" href="#">RATE MY INTERNSHIP</a>
                </div>

                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <form class="navbar-form navbar-left" role="search">
                        <div class="form-group">
                            <input type="text" class="form-control header-search" placeholder="Search">
                        </div>
                        <button type="submit" class="btn btn-default header-search-btn">Search</button>
                    </form>
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="#">Sign in</a></li>
                        <li><a href="#">Sign up</a></li>
                    </ul>
                </div>
            </div>
        </nav>
        <!-- Header Above -->
        <%
            Organization org = Query.getOrganization(request.getParameter("id"));
        %>
        <div class="row companyName">
            <div class="col-lg-10">
                <h1><%=org.getName()%></h1>
                <br />
                <h4 class="reviewAvgLabel"><%=org.getTagline()%></h4>
            </div>
        </div>
        <form method="GET" action="getReviews">
            <input type="hidden" name="orgId" value=<%=request.getParameter("id")%>/>
            <button type="submit" class="reviewsButton btn">View All Reviews</button>
        </form>

            
            
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
