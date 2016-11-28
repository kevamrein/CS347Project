<%-- 
    Document   : new_review
    Created on : Nov 28, 2016, 5:32:33 PM
    Author     : carswesp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
    	<form method="GET" name="sign_up"/>
    	Username: <input type="text" name="username"/>
    	</br>
    	Email: <input type="text" name="email"/>
    	</br>
    	Password: <input type="password" type="password1"/>
    	</br>
    	Confirm Password: <input type="password" type=password2"/>
    	</br>
    	<input type="submit" value="Submit"/>
    	</form>
    </body>
</html>
