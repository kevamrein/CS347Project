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
            response.sendRedirect("login.jsp?ref=my_account");
            return;
        } else {      
            user = Query.getUser(user_id);
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
                <h1 style="text-align: center; color: whitesmoke">Edit Profile</h1>
                <hr />
            </div>
            <br />
            <div class="body-content white-box">
                <h3 style="text-align: center;">Personal info</h3>
                <form class="form-horizontal" role="form" method="post" action="<%= request.getContextPath() + "/edit-profile"%>">
                    <div class="body-cols">
                        <div class="body-rows" style="margin-right: 2em;">
                            <div class="form-group">
                                <label for="userid" class="cols-sm-2 control-label">User ID:</label>
                                <div class="cols-sm-10">
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="fa fa-id-card-o fa" aria-hidden="true"></i></span>
                                        <input type="text" class="form-control" name="userid" value="<%=user.getUserId()%>" readonly/>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="username" class="cols-sm-2 control-label">Username:</label>
                                <div class="cols-sm-10">
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="fa fa-user fa" aria-hidden="true"></i></span>
                                        <input type="text" class="form-control" name="username" value="<%=user.getUsername()%>"/>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="email" class="cols-sm-2 control-label">Email:</label>
                                <div class="cols-sm-10">
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="fa fa-envelope-o fa" aria-hidden="true"></i></span>
                                        <input type="email" class="form-control" name="email" value="<%=user.getEmail()%>"/>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="firstname" class="cols-sm-2 control-label">First Name:</label>
                                <div class="cols-sm-10">
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="fa fa-user-circle-o fa" aria-hidden="true"></i></span>
                                        <input type="text" class="form-control" name="firstname" value="<%=user.getFirstName()%>"/>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="lastname" class="cols-sm-2 control-label">Last Name:</label>
                                <div class="cols-sm-10">
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="fa fa-user-circle-o fa" aria-hidden="true"></i></span>
                                        <input type="text" class="form-control" name="lastname" value="<%=user.getLastName()%>"/>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="body-rows" style="margin-left: 1em;">
                            <div class="form-group">
                                <label for="city" class="cols-sm-2 control-label">City:</label>
                                <div class="cols-sm-10">
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="fa fa-map-marker fa" aria-hidden="true"></i></span>
                                        <input type="text" class="form-control" name="city" value="<%=user.getCity()%>"/>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="state" class="cols-sm-2 control-label">State:</label>
                                <div class="cols-sm-10">
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="fa fa-map fa" aria-hidden="true"></i></span>
                                        <input type="text" class="form-control" name="state" value="<%=user.getState()%>"/>
                                    </div>
                                </div>
                            </div>
                            <br />
                            <h3 style="text-align: center;">Edit Password</h3> 
                            <div class="form-group">
                                <label for="oldpassword" class="cols-sm-2 control-label">Old Password:</label>
                                <div class="cols-sm-10">
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="fa fa-lock fa" aria-hidden="true"></i></span>
                                        <input type="password" class="form-control" name="oldpassword" value=""/>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="newpassword" class="cols-sm-2 control-label">New Password:</label>
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
                        <button type="submit" class="btn btn-primary">Save Changes</button>
                        <span></span>
                        <a type="reset" class="btn btn-default">Cancel</a>
                    </div>
                </form>
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
