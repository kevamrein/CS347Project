<%-- 
    Document   : my_account
    Created on : Nov 28, 2016, 5:32:33 PM
    Author     : shameszl
--%>
<%@page import="database.Query, java.util.ResourceBundle, dataObjects.User"%>

<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE html 
    PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
    <%
        boolean loggedIn = false;
        ResourceBundle bundle = ResourceBundle.getBundle("bundle.messages", request.getLocale());
        String user_id = null;
        User user = null;
        
        
        if (session.getAttribute("signed_in") != null) {
            loggedIn = (Boolean)session.getAttribute("signed_in");
            
            if (session.getAttribute("user_id") != null) {
                user_id = session.getAttribute("user_id").toString();
            }   
        }
        
        // Switch this once setup with database
        if (!loggedIn || user_id == null) {
            response.sendRedirect("login.jsp?ref=my_account");
            return;
        } else {      
            user = Query.getUser(user_id);
        }
        
        String error = "";
        
        if (request.getParameter("error") != null) {
            error = request.getParameter("error");
        }
    %>
    
    <head>
        <title>Rate My Internship - My Account</title>
        
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
                <h1 style="text-align: center; color: whitesmoke"><%= bundle.getString("EditProfile") %></h1>
                <hr />
            </div>
            <br />
            <% if (error.length() > 0) { %>
                <div class="alert alert-warning">
                    <%= error %>
                </div>
            <% } %>
            <div class="body-content white-box">
                <h3 style="text-align: center;"><%= bundle.getString("PersonalInfo") %></h3>
                <form class="form-horizontal" name="account-form" role="form" method="post" onsubmit="return validateForm()" action="<%= request.getContextPath() + "/edit-profile"%>">
                    <div class="body-cols">
                        <div class="body-rows" style="margin-right: 2em;">
                            <div class="form-group">
                                <label for="userid" class="cols-sm-2 control-label"><%= bundle.getString("UserID") + ":" %></label>
                                <div class="cols-sm-10">
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="fa fa-id-card-o fa" aria-hidden="true"></i></span>
                                        <input type="text" class="form-control" name="userid" value="<%=(user == null) ? "" : user.getUserId()%>" readonly/>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="body-cols">
                                    <label for="username" class="cols-sm-2 control-label"><%= bundle.getString("Username") + ":" %></label>
                                    <div class="error" id="usernameerr"></div>
                                </div>
                                <div class="cols-sm-10">
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="fa fa-user fa" aria-hidden="true"></i></span>
                                        <input type="text" class="form-control" name="username" value="<%=(user == null) ? "" : user.getUsername()%>"/>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="body-cols">
                                    <label for="email" class="cols-sm-2 control-label"><%= bundle.getString("Email") + ":" %></label>
                                    <div class="error" id="emailerr"></div>
                                </div>
                                <div class="cols-sm-10">
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="fa fa-envelope-o fa" aria-hidden="true"></i></span>
                                        <input type="email" class="form-control" name="email" value="<%=(user == null) ? "" : user.getEmail()%>"/>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="body-cols">
                                    <label for="firstname" class="cols-sm-2 control-label"><%= bundle.getString("FirstName") + ":" %></label>
                                    <div class="error" id="firstnameerr"></div>
                                </div>
                                <div class="cols-sm-10">
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="fa fa-user-circle-o fa" aria-hidden="true"></i></span>
                                        <input type="text" class="form-control" name="firstname" value="<%=(user == null) ? "" : user.getFirstName()%>"/>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="body-cols">
                                    <label for="lastname" class="cols-sm-2 control-label"><%= bundle.getString("LastName") + ":" %></label>
                                    <div class="error" id="lastnameerr"></div>
                                </div>
                                <div class="cols-sm-10">
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="fa fa-user-circle-o fa" aria-hidden="true"></i></span>
                                        <input type="text" class="form-control" name="lastname" value="<%=(user == null) ? "" : user.getLastName()%>"/>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="body-rows" style="margin-left: 1em;">
                            <div class="form-group">
                                <div class="body-cols">
                                    <label for="city" class="cols-sm-2 control-label"><%= bundle.getString("City") + ":" %></label>
                                    <div class="error" id="cityerr"></div>
                                </div>
                                <div class="cols-sm-10">
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="fa fa-map-marker fa" aria-hidden="true"></i></span>
                                        <input type="text" class="form-control" name="city" value="<%=(user == null) ? "" : user.getCity()%>"/>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="body-cols">
                                    <label for="state" class="cols-sm-2 control-label"><%= bundle.getString("State") + ":" %></label>
                                    <div class="error" id="stateerr"></div>
                                </div>
                                <div class="cols-sm-10">
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="fa fa-map fa" aria-hidden="true"></i></span>
                                        <input type="text" class="form-control" name="state" value="<%=(user == null) ? "" : user.getState()%>"/>
                                    </div>
                                </div>
                            </div>
                            <br />
                            <h3 style="text-align: center;"><%= bundle.getString("EditPassword") %></h3> 
                            <div class="form-group">
                                <div class="body-cols">
                                    <label for="oldpassword" class="cols-sm-2 control-label"><%= bundle.getString("OldPassword") + ":" %></label>
                                    <div class="error" id="oldpassworderr"></div>
                                </div>
                                <div class="cols-sm-10">
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="fa fa-lock fa" aria-hidden="true"></i></span>
                                        <input type="password" class="form-control" name="oldpassword" value=""/>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="body-cols">
                                    <label for="newpassword" class="cols-sm-2 control-label"><%= bundle.getString("NewPassword") + ":" %></label>
                                    <div class="error" id="newpassworderr"></div>
                                </div>
                                <div class="cols-sm-10">
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="fa fa-lock fa" aria-hidden="true"></i></span>
                                        <input type="password" class="form-control" name="newpassword" value=""/>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-group" style="margin-left: -1em;;">
                        <button type="submit" class="btn btn-primary"><%= bundle.getString("SaveChanges") %></button>&nbsp;&nbsp;
                        <a type="reset" href="my_account.jsp" class="btn btn-default"><%= bundle.getString("Cancel") %></a>
                        <a type="reset" href="/RateMyInternship/deleteAccount" class="btn btn-default"><%= bundle.getString("DeleteAccount") %></a>
                        
                    </div>
                </form>
            </div>
        </div>
        
        <footer class="footer">
            <div class="container">
                <p class="text-muted">Rate My Internship</p>
            </div>
        </footer>
        
        <script type="text/javascript" src="js/jquery.min.js"></script>
        <script type="text/javascript" src="js/bootstrap.min.js"></script>
        <script>
            function validateForm() {
                var form = document.forms["account-form"];
                var output = true;
                
                document.getElementById("usernameerr").innerHTML = "";
                document.getElementById("emailerr").innerHTML = "";
                document.getElementById("firstnameerr").innerHTML = "";
                document.getElementById("lastnameerr").innerHTML = "";
                document.getElementById("cityerr").innerHTML = "";
                document.getElementById("stateerr").innerHTML = "";
                document.getElementById("oldpassworderr").innerHTML = "";
                document.getElementById("newpassworderr").innerHTML = "";
                
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
                
                if (form["oldpassword"].value.trim().length > 32) {
                    document.getElementById("oldpassworderr").innerHTML = "Your password is too long";
                    output = false;
                }

                return output;
            }
        </script>
    </body>
</html>
