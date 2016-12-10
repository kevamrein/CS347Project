<%-- 
    Document   : new_review
    Created on : Nov 28, 2016, 5:32:33 PM
    Author     : carswesp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList, database.Query"%>
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
        
        String error = "";
        
        if (request.getParameter("error") != null) {
            error = request.getParameter("error");
        }
        
         ArrayList<String> questions = Query.getQuestions();
        
        
    %>
    
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
                <h1 style="text-align: center; color: whitesmoke">Registration</h1>
                <hr />
            </div>
            <br />
            <% if (error.length() > 0) { %>
                <div class="alert alert-warning">
                    <%= error %>
                </div>
            <% } %>
            <div class="body-content white-box">
                <h3 style="margin-left: -0.6em;">Enter your desired account details:</h3>
                <form class="form-horizontal" name="register-form" method="post" onsubmit="return validateForm()" action="register" novalidate>
                    <div class="body-cols">
                        <div class="body-rows" style="margin-right: 2em;">
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
                                        <span class="input-group-addon"><i class="fa fa-envelope-o fa" aria-hidden="true"></i></span>
                                        <input type="email" class="form-control" name="email" placeholder="Enter an Email" />
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="body-cols">
                                    <label for="firstname" class="cols-sm-2 control-label">First Name:</label>
                                    <div class="error" id="firstnameerr"></div>
                                </div>
                                <div class="cols-sm-10">
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="fa fa-user-circle-o fa" aria-hidden="true"></i></span>
                                        <input type="text" class="form-control" name="firstname" placeholder="Enter your First Name" />
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="body-cols">
                                    <label for="lastname" class="cols-sm-2 control-label">Last Name:</label>
                                    <div class="error" id="lastnameerr"></div>
                                </div>
                                <div class="cols-sm-10">
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="fa fa-user-circle-o fa" aria-hidden="true"></i></span>
                                        <input type="text" class="form-control" name="lastname" placeholder="Enter your Last Name" />
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="body-cols">
                                    <label for="question" class="cols-sm-2 control-label">Security Question:</label>
                                    <div class="error" id="questionerr"></div>
                                </div>
                                <div class="cols-sm-10">
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="fa fa-lock fa" aria-hidden="true"></i></span>
                                        <select class="form-control" name="questions" placeholder="Select a Question">
                                            <% for (int i = 0; i < questions.size(); i++)
                                            {
                                                out.println("<option value=\"" + i + "\">" + questions.get(i) + "</option>");
                                            } %>
                                        </select>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="body-rows" style="margin-left: 1em;">
                            <div class="form-group">
                                <div class="body-cols">
                                    <label for="city" class="cols-sm-2 control-label">City:</label>
                                    <div class="error" id="cityerr"></div>
                                </div>
                                <div class="cols-sm-10">
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="fa fa-map-marker fa" aria-hidden="true"></i></span>
                                        <input type="text" class="form-control" name="city" placeholder="Enter your City" />
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="body-cols">
                                    <label for="state" class="cols-sm-2 control-label">State:</label>
                                    <div class="error" id="stateerr"></div>
                                </div>
                                <div class="cols-sm-10">
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="fa fa-map fa" aria-hidden="true"></i></span>
                                        <input type="text" class="form-control" name="state" placeholder="Enter your State" />
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
                                        <input type="password" class="form-control" name="password" placeholder="Enter a Password" />
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="body-cols">
                                    <label for="confirm" class="cols-sm-2 control-label">Confirm Password:</label>
                                    <div class="error" id="confirmerr"></div>
                                </div>
                                <div class="cols-sm-10">
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="fa fa-lock fa" aria-hidden="true"></i></span>
                                        <input type="password" class="form-control" name="confirm" placeholder="Enter a Password" />
                                    </div>
                                </div>
                            </div>
                             <div class="form-group">
                                <div class="body-cols">
                                    <label for="answer" class="cols-sm-2 control-label">Answer to Question:</label>
                                    <div class="error" id="answererr"></div>
                                </div>
                                <div class="cols-sm-10">
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="fa fa-lock fa" aria-hidden="true"></i></span>
                                        <input type="text" class="form-control" name="answer" placeholder="Enter your Answer" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-group" style="margin-left: -1em;;">
                        <button type="submit" class="btn btn-primary">Register</button>
                    </div>
                </form>        
            </div>
        </div>
                
        <script type="text/javascript" src="js/jquery.min.js"></script>
        <script type="text/javascript" src="js/bootstrap.min.js"></script>
        
        <script>
            function validateForm() {
                var form = document.forms["register-form"];
                var output = true;
                
                document.getElementById("usernameerr").innerHTML = "";
                document.getElementById("emailerr").innerHTML = "";
                document.getElementById("firstnameerr").innerHTML = "";
                document.getElementById("lastnameerr").innerHTML = "";
                document.getElementById("questionerr").innerHTML = "";
                document.getElementById("cityerr").innerHTML = "";
                document.getElementById("stateerr").innerHTML = "";
                document.getElementById("passworderr").innerHTML = "";
                document.getElementById("confirmerr").innerHTML = "";
                document.getElementById("answererr").innerHTML = "";
                
                
                
                if (form["username"].value.trim().length === 0) {
                    document.getElementById("usernameerr").innerHTML = "A Username is required";
                    output = false;
                } else if (form["username"].value.trim().length > 20) {
                    document.getElementById("usernameerr").innerHTML = "Your Username is too long";
                    output = false;
                }
                
                if (form["email"].value.trim().length === 0) {
                    document.getElementById("emailerr").innerHTML = "An Email is required";
                    output = false;
                } else if (form["email"].value.trim().length > 50) {
                    document.getElementById("emailerr").innerHTML = "Your Email is too long";
                    output = false;
                } else if (form["email"].value.trim().indexOf("@") == -1) {
                    document.getElementById("emailerr").innerHTML = "Your Email is invalid";
                    output = false;
                }
                
                if (form["firstname"].value.trim().length === 0) {
                    document.getElementById("firstnameerr").innerHTML = "A First Name is required";
                    output = false;
                } else if (form["firstname"].value.trim().length > 30) {
                    document.getElementById("firstnameerr").innerHTML = "Your First Name is too long";
                    output = false;
                }
                
                if (form["lastname"].value.trim().length === 0) {
                    document.getElementById("lastnameerr").innerHTML = "A Last Name is required";
                    output = false;
                } else if (form["lastname"].value.trim().length > 30) {
                    document.getElementById("lastnameerr").innerHTML = "Your Last Name is too long";
                    output = false;
                }
                
                if (form["question"].value.trim().length === 0) {
                    document.getElementById("questionerr").innerHTML = "A Question is required";
                    output = false;
                } else if (form["question"].value.trim().length > 2) {
                    document.getElementById("questionerr").innerHTML = "Choose a valid question";
                    output = false;
                }
                
                if (form["city"].value.trim().length === 0) {
                    document.getElementById("cityerr").innerHTML = "A City is required";
                    output = false;
                } else if (form["city"].value.trim().length > 50) {
                    document.getElementById("cityerr").innerHTML = "Your City is too long";
                    output = false;
                }
                
                if (form["state"].value.trim().length === 0) {
                    document.getElementById("stateerr").innerHTML = "A State is required";
                    output = false;
                } else if (form["state"].value.trim().length !== 2) {
                    document.getElementById("stateerr").innerHTML = "Your State must be 2 letters";
                    output = false;
                }
                
                if (form["password"].value.trim() !== form["confirm"].value.trim()) {
                    document.getElementById("confirmerr").innerHTML = "Does not match password";
                    output = false;
                }
                
                if (form["password"].value.trim().length === 0) {
                    document.getElementById("passworderr").innerHTML = "A Password is required";
                    output = false;
                } else if (form["password"].value.trim().length > 32) {
                    document.getElementById("passworderr").innerHTML = "Your password is too long";
                    output = false;
                }
                
                if (form["confirm"].value.trim().length === 0) {
                    document.getElementById("confirmerr").innerHTML = "A Confirmation is required";
                    output = false;
                }
                
                if (form["answer"].value.trim().length === 0) {
                    document.getElementById("answererr").innerHTML = "An Answer is required";
                    output = false;
                } else if (form["answer"].value.trim().length > 30) {
                    document.getElementById("answererr").innerHTML = "Your Answer is too long";
                    output = false;
                }

                return output;
            }
        </script>
    </body>
</html>
