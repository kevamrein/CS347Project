<%-- 
    Document   : login
    Created on : Nov 28, 2016, 5:22:08 PM
    Author     : carswesp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%
        Boolean loggedIn = false;
        String ref = "";
        
        if (session.getAttribute("signed_in") != null) {
            loggedIn = (Boolean)session.getAttribute("signed_in");
        }
        
        if (loggedIn) {
            response.sendRedirect("index.jsp");
            return;
        } else {
            if (request.getParameter("ref") != null) {
                ref = request.getParameter("ref");
            }
        }
    %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Rate My Internship - Login</title>
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
                <h1 style="text-align: center; color: whitesmoke">Login</h1>
                <hr />
            </div>
            <br />
            <div class="body-content white-box">
                <h3 style="margin-left: -0.6em;">Enter your login credentials:</h3>
                <form class="form-horizontal" name="login-form" role="form" method="post" onsubmit="return validateForm()" action="login">
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
                                    <label for="password" class="cols-sm-2 control-label">Password:</label>
                                    <div class="error" id="passworderr"></div>
                                </div>
                                <div class="cols-sm-10">
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="fa fa-lock fa" aria-hidden="true"></i></span>
                                        <input type="password" class="form-control" name="password" placeholder="Enter your Password" value="" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <input type="hidden" class="form-control" name="ref" value="<%= ref %>" />
                    <div class="form-group" style="margin-left: -1em;;">
                        <button type="submit" class="btn btn-primary">Login</button>
                    
                    
                    <input type="hidden" class="form-control" name="ref" value="<%= ref %>" />
                    <button type="button"class="btn btn-primary" onclick="window.location.href='forget_password.jsp'">Forget Password</button>
                    </div>
                </form>
            </div>
        </div>
        
        <script type="text/javascript" src="js/jquery.min.js"></script>
        <script type="text/javascript" src="js/bootstrap.min.js"></script>
        <script>
            function validateForm() {
                var form = document.forms["login-form"];
                var output = true;
                
                document.getElementById("usernameerr").innerHTML = "";
                document.getElementById("passworderr").innerHTML = "";
                
                if (form["username"].value.trim().length === 0) {
                    document.getElementById("usernameerr").innerHTML = "A Username is required";
                    output = false;
                } else if (form["username"].value.trim().length > 20) {
                    document.getElementById("usernameerr").innerHTML = "Your Username is too long";
                    output = false;
                }
                
                if (form["password"].value.trim().length === 0) {
                    document.getElementById("passworderr").innerHTML = "A Password is required";
                    output = false;
                } else if (form["password"].value.trim().length > 32) {
                    document.getElementById("passworderr").innerHTML = "Your password is too long";
                    output = false;
                }

                return output;
            }
        </script>
    </body>
</html>
