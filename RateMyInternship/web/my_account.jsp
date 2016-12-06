<%-- 
    Document   : my_account
    Created on : Nov 28, 2016, 5:32:33 PM
    Author     : shameszl
--%>
<%@page import="database.Query"%>
<%@page import="dataObjects.User"%>

<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
      "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
    <%
        Boolean loggedIn = false;
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
            response.sendRedirect("login.jsp");
            return;
        } else {      
            user = Query.getUser(user_id);
        }
    %>
    
    <head>
        <title>Rate My Internship - My Account</title>
        
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />
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
        <div class="body-content">
            <div class="account-container">
                <h1>Edit Profile</h1>
                <hr />
                <h3>Personal info</h3>            

                <form class="form-horizontal" role="form" method="post" action="/edit-profile">
                    <div class="form-group">
                        <label class="col-lg-3 control-label">User ID:</label>
                        <div class="col-lg-8">
                            <input class="form-control" name="user_id" type="text" value="<%=user.getUserId()%>" readOnly />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-3 control-label">Username:</label>
                        <div class="col-lg-8">
                            <input class="form-control" name="username" type="text" value="<%=user.getUsername()%>" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-3 control-label">Email:</label>
                        <div class="col-lg-8">
                            <input class="form-control" name="email" type="email" value="<%=user.getEmail()%>" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-3 control-label">First Name:</label>
                        <div class="col-lg-8">
                            <input class="form-control" name="first_name" type="text" value="<%=user.getFirstName()%>" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-3 control-label">Last Name:</label>
                        <div class="col-lg-8">
                            <input class="form-control" name="last_name" type="text" value="<%=user.getLastName()%>" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-3 control-label">City:</label>
                        <div class="col-lg-8">
                            <input class="form-control" name="city" type="text" value="<%=user.getCity()%>" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-3 control-label">State:</label>
                        <div class="col-lg-8">
                            <input class="form-control" name="state" type="text" value="<%=user.getState()%>" />
                        </div>
                    </div>
                    <br />
                    <h3>Edit Password</h3> 
                    <div class="form-group">             
                        <label class="col-lg-3 control-label">Old Password:</label>
                        <div class="col-lg-8">
                            <input class="form-control" name="old_password" type="password" value="" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-3 control-label">New Password:</label>
                        <div class="col-lg-8">
                            <input class="form-control" name="new_password" type="password" value="" />
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-md-3 control-label"></label>
                        <div class="col-md-8">
                            <button type="submit" class="btn btn-primary">Save Changes</button>
                            <span></span>
                            <a type="reset" class="btn btn-default">Cancel</a>
                        </div>
                    </div>
                </form>
                <hr />
            </div>
        </div>
        
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
        
        <script type="text/javascript" src="js/jquery.min.js"></script>
        <script type="text/javascript" src="js/bootstrap.min.js"></script>
    </body>
</html>
