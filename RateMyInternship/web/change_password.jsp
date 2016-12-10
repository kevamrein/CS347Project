<%-- 
    Document   : forget_password
    Created on : Dec 8, 2016, 5:13:50 PM
    Author     : samcarswell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="database.Query, dataObjects.User, dataObjects.Organization, java.util.ArrayList"%>
<!DOCTYPE html>
<html>
    <%
        String user_id = "";
        
        if (session.getAttribute("user_id") != null) {
                user_id = session.getAttribute("user_id").toString();
                
            } 

        User user = user = Query.getUser(user_id); 
        ArrayList<String> questions = Query.getQuestions();
          
     %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Rate My Internship - Change Password</title>
         
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
                <h1 style="text-align: center; color: whitesmoke">Change Password</h1>
                <hr />
            </div>
            <br />
            <div class="body-content white-box">
                <h3 style="margin-left: -0.6em;">Change Password: </h3>
                <form class="form-horizontal" role="form" method="post" action="change_password">
                    <div class="body-cols">
                        <div class="body-rows">
                            <div class="form-group">
                                <label for="question" class="cols-sm-2 control-label"></label>
                                <div class="cols-sm-10">
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="fa fa-user fa" aria-hidden="true"></i></span>
                                        <label class="form-control"><%= questions.get(user.getSecurityIndex())%></label>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="answer" class="cols-sm-2 control-label">Answer:</label>
                                <div class="cols-sm-10">
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="fa fa-lock fa" aria-hidden="true"></i></span>
                                        <input type="text" class="form-control" name="answer" placeholder="Enter your Answer" value="" />
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="password" class="cols-sm-2 control-label">New Password:</label>
                                <div class="cols-sm-10">
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="fa fa-lock fa" aria-hidden="true"></i></span>
                                        <input type="password" class="form-control" name="password" placeholder="Enter your Password" value="" />
                                    </div>
                                </div>
                            </div>
                                <div class="form-group">
                                <label for="confirm" class="cols-sm-2 control-label">Confirm Password:</label>
                                <div class="cols-sm-10">
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="fa fa-lock fa" aria-hidden="true"></i></span>
                                        <input type="password" class="form-control" name="confirm" placeholder="Confirm Password" value="" />
                                    </div>
                                </div>
                                </div>
                        </div>
                    </div>
                    <input type="hidden" class="form-control" name="submit" value="Submit" />
                    <div class="form-group" style="margin-left: -1em;;">
                        <button type="submit" class="btn btn-primary">Submit</button>
                    </div>
                </form>
            </div>
        </div>
   
                        
        <script type="text/javascript" src="js/jquery.min.js"></script>
        <script type="text/javascript" src="js/bootstrap.min.js"></script>
         </body>
</html>
