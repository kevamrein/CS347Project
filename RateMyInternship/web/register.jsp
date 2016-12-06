<%-- 
    Document   : new_review
    Created on : Nov 28, 2016, 5:32:33 PM
    Author     : carswesp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%
        Boolean loggedIn = false;
        
        if (session.getAttribute("signed_in") != null) {
            loggedIn = (Boolean)session.getAttribute("signed_in");
        }
        
        if (loggedIn) {
            response.sendRedirect("index.jsp");
            return;
        }
    %>
    
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
        
        <div class="register-container">
            <div class="panel-heading">
                <div class="panel-title text-center">
                    <h1 class="title">Registration</h1>
                    <hr />
                </div>
            </div> 
        
            <form class="form-horizontal" method="POST" action="register">
                <div class="main-login main-center">
                    <div>
                        <div class="form-group">
                            <label for="username" class="cols-sm-2 control-label">Username:</label>
                            <div class="cols-sm-10">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-user fa" aria-hidden="true"></i></span>
                                    <input type="text" class="form-control" name="username" placeholder="Enter your Username"/>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="firstname" class="cols-sm-2 control-label">First Name:</label>
                            <div class="cols-sm-10">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-address-card-o fa" aria-hidden="true"></i></span>
                                    <input type="text" class="form-control" name="firstname"  placeholder="Enter your First Name"/>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="lastname" class="cols-sm-2 control-label">Last Name:</label>
                            <div class="cols-sm-10">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-address-card-o fa" aria-hidden="true"></i></span>
                                    <input type="text" class="form-control" name="lastname"  placeholder="Enter your Last Name"/>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="city" class="cols-sm-2 control-label">City:</label>
                            <div class="cols-sm-10">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-map-marker fa" aria-hidden="true"></i></span>
                                    <input type="text" class="form-control" name="city"  placeholder="Enter your City"/>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div>
                        <div class="form-group">
                            <label for="state" class="cols-sm-2 control-label">State:</label>
                            <div class="cols-sm-10">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-map fa" aria-hidden="true"></i></span>
                                    <input type="text" class="form-control" name="state"  placeholder="Enter your State Initials"/>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="email" class="cols-sm-2 control-label">Email:</label>
                            <div class="cols-sm-10">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-envelope fa" aria-hidden="true"></i></span>
                                    <input type="email" class="form-control" name="email"  placeholder="Enter your Email"/>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="password" class="cols-sm-2 control-label">Password:</label>
                            <div class="cols-sm-10">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
                                    <input type="password" class="form-control" name="password" id="password"  placeholder="Enter your Password"/>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="confirm" class="cols-sm-2 control-label">Confirm Password:</label>
                            <div class="cols-sm-10">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
                                    <input type="password" class="form-control" name="confirm" id="confirm"  placeholder="Confirm your Password"/>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="form-group" style="margin: 0 auto; margin-top: 10px;">
                    <button type="submit" class="btn btn-primary btn-md btn-block login-button">Register</button>
                </div>
            </form>
        </div>
                    
        <script type="text/javascript" src="js/jquery.min.js"></script>
        <script type="text/javascript" src="js/bootstrap.min.js"></script>
    </body>
</html>
