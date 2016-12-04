<%-- 
    Document   : my_account
    Created on : Nov 28, 2016, 5:32:33 PM
    Author     : shameszl
--%>
<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
      "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
    <%
        Boolean loggedIn = false;
        int user_id = -1;
        
        
        if (session.getAttribute("signed_in") != null) {
            loggedIn = (Boolean)session.getAttribute("signed_in");
            user_id = (int)session.getAttribute("user_id");
        }
        
        // Switch this once setup with database
        if (loggedIn || user_id != -1) {
            response.sendRedirect("login.jsp");
        } else {
            // Get user info
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
                    <a class="navbar-brand" href="#">RATE MY INTERNSHIP</a>
                </div>

                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <form class="navbar-form navbar-left" role="search" method="get" action="search.jsp">
                        <div class="form-group">
                            <input type="text" name="query" class="form-control header-search" placeholder="Search" />
                        </div>
                        <button type="submit" class="btn btn-default header-search-btn">Search</button>
                    </form>
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="index.jsp">Home</a></li>
                        <li><a href="signout.jsp">Sign out</a></li>
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
                            <input class="form-control" type="text" value="" readOnly />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-3 control-label">Username:</label>
                        <div class="col-lg-8">
                            <input class="form-control" type="text" value="" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-3 control-label">Password:</label>
                        <div class="col-lg-8">
                            <input class="form-control" type="password" value="" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-3 control-label">Email:</label>
                        <div class="col-lg-8">
                            <input class="form-control" type="email" value="" />
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
