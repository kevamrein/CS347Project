<%-- 
    Document   : forget_password
    Created on : Dec 8, 2016, 5:13:50 PM
    Author     : samcarswell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE html 
    PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
    <%
        String error = "";
        
        if (request.getParameter("error") != null) {
            error = request.getParameter("error");
        }
    %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Rate My Internship - Password Recovery</title>
         
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />
        <link rel="stylesheet" type="text/css" href="css/font-awesome.min.css" />
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
                            <input type="text" name="query" class="form-control header-search" placeholder="Search" />
                        </div>
                        <button type="submit" class="btn btn-default header-search-btn">Search</button>
                    </form>
                    <ul class="nav navbar-nav navbar-right">
                         <%
                                out.println("<li><a href='login.jsp'>Sign in</a></li>");
                                out.println("<li><a href='register.jsp'>Sign up</a></li>");
                        %>
                    </ul>
                </div>
            </div>
        </nav>
                    
        <div class="body-container">
            <div class="body-header">
                <h1 style="text-align: center; color: whitesmoke">Forgot Password</h1>
                <hr />
            </div>
            <br />
            <% if (error.length() > 0) { %>
                <div class="alert alert-warning">
                    <%= error %>
                </div>
            <% } %>
            <div class="body-content white-box">
                <h3 style="margin-left: -0.6em;">Password Recovery:</h3>
                <form class="form-horizontal" role="form" name="forgot-form" method="post" onsubmit="return validateForm()" action="forgot_password">
                    <div class="body-cols">
                        <div class="body-rows">
                            <div class="form-group">
                                <div class="body-cols">
                                    <label for="username" class="cols-sm-2 control-label">Username:</label>
                                    <div class="error" id="usernameerr"></div>
                                </div>
                                <div class="cols-sm-10">
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="fa fa-user fa" aria-hidden="true"></i></span>
                                        <input type="text" class="form-control" name="username" placeholder="Enter a Username" />
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="body-cols">
                                    <label for="email" class="cols-sm-2 control-label">Email:</label>
                                    <div class="error" id="emailerr"></div>
                                </div>
                                <div class="cols-sm-10">
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="fa fa-envelope fa" aria-hidden="true"></i></span>
                                        <input type="email" class="form-control" name="email" placeholder="Enter your Email" value="" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <input type="hidden" class="form-control" name="submit" value="Submit" />
                    <div class="form-group" style="margin-left: -1em;">
                        <button type="submit" class="btn btn-primary">Submit</button>
                    </div>
                </form>
            </div>
        </div>
   
                        
        <script type="text/javascript" src="js/jquery.min.js"></script>
        <script type="text/javascript" src="js/bootstrap.min.js"></script>
        <script>
            function validateForm() {
                var form = document.forms["forgot-form"];
                var output = true;
                
                document.getElementById("usernameerr").innerHTML = "";
                document.getElementById("emailerr").innerHTML = "";
                
                if (form["username"].value.trim().length === 0) {
                    document.getElementById("usernameerr").innerHTML = "A Username is required";
                    output = false;
                } else if (form["username"].value.trim().length > 20) {
                    document.getElementById("usernameerr").innerHTML = "Your Username is too long";
                    output = false;
                }
                
                if (form["email"].value.trim().length === 0) {
                    document.getElementById("emailerr").innerHTML = "A Email is required";
                    output = false;
                } else if (form["email"].value.trim().length > 50) {
                    document.getElementById("emailerr").innerHTML = "Your Email is too long";
                    output = false;
                }

                return output;
            }
        </script>
    </body>
</html>
