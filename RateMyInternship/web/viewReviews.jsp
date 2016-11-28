<%-- 
    Document   : viewReviews
    Created on : Nov 26, 2016, 12:16:08 PM
    Author     : kevinamrein
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />
        <link rel="stylesheet" type="text/css" href="css/styles.css" />
        <link rel="stylesheet" type="text/css" href="css/reviewStyle.css" />
        <title>All Reviews</title>
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

        <script type="text/javascript" src="js/jquery.min.js"></script>
        <script type="text/javascript" src="js/bootstrap.min.js"></script>

        <!-- Header Goes Above-->

        <%
            // TODO: Figure out whether the all review data will be sent from
            // a servlet or through the response from an HTTP Request
        %>
        <!-- This will all have to be added dynamically based on the amt of reviews -->
        <div class="row companyName">
            <div class="col-lg-10">
                <h1>Company Name</h1>
                <br />
                <h4 class="reviewAvgLabel">Average Review <%// JSP TO GET AVG review here%></h4>
            </div>
        </div>

        <div class="row review">
                <div class="col-lg-10">
                    <h3>Software Engineer Intern</h3>
                    <h4 class="authorTitle">By: Kevin Amrein</h4>
                </div>
                <div class="reviewComment">
                    The review is gonna go here
                </div>
        </div>











        <!-- Footer Goes Below-->
    </body>
</html>
