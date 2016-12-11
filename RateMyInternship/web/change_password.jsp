<%-- 
    Document   : forget_password
    Created on : Dec 8, 2016, 5:13:50 PM
    Author     : samcarswell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="database.Query, dataObjects.User, dataObjects.Organization, java.util.ArrayList, java.util.ResourceBundle"%>
<!DOCTYPE html>
<html>
    <%
        String user_id = "";
        boolean loggedIn = false;
        ResourceBundle bundle = ResourceBundle.getBundle("bundle.messages", request.getLocale());

        if (session.getAttribute("user_id") != null) {
            user_id = session.getAttribute("user_id").toString();
        }

        User user = user = Query.getUser(user_id);
        ArrayList<String> questions = Query.getQuestions();

    %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
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
                            <input type="text" name="query" class="form-control header-search" placeholder="<%= bundle.getString("Search")%>" />
                        </div>
                        <button type="submit" class="btn btn-default header-search-btn"><%= bundle.getString("Search")%></button>
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
        <%if (!request.isSecure()) {%>
        <div id="myModal" class="modal">

            <!-- Modal content -->
            <div class="modal-content">
                <p style="text-align: center">Must Use Secure HTTPS Protocol To View This Page</p>
                <div class="body-cols">
                    <button type=reset id="homebtn" class="btn-default btn" onclick="goHome()">Home Page</button>
                    <button type=reset id = "securebtn" class="btn-default btn" onclick="goSecure()">Visit Secured Page</button>
                </div>
            </div>

        </div>
        <%}%>
        <div class="body-container">
            <div class="body-header">
                <h1 style="text-align: center; color: whitesmoke"><%= bundle.getString("ChangePassword")%></h1>
                <hr />
            </div>
            <br />
            <div class="body-content white-box">
                <h3 style="margin-left: -0.6em;"><%= bundle.getString("ChangePassword") + ":"%></h3>
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
                                <label for="answer" class="cols-sm-2 control-label"><%= bundle.getString("Answer") + ":"%></label>
                                <div class="cols-sm-10">
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="fa fa-lock fa" aria-hidden="true"></i></span>
                                        <input type="text" class="form-control" name="answer" placeholder="<%= bundle.getString("EnterYourAnswer")%>" value="" />
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="password" class="cols-sm-2 control-label"><%= bundle.getString("NewPassword") + ":"%></label>
                                <div class="cols-sm-10">
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="fa fa-lock fa" aria-hidden="true"></i></span>
                                        <input type="password" class="form-control" name="password" placeholder="<%= bundle.getString("EnterYourPassword")%>" value="" />
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="confirm" class="cols-sm-2 control-label"><%= bundle.getString("ConfirmPassword") + ":"%></label>
                                <div class="cols-sm-10">
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="fa fa-lock fa" aria-hidden="true"></i></span>
                                        <input type="password" class="form-control" name="confirm" placeholder="<%= bundle.getString("ConfirmPassword")%>" value="" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <input type="hidden" class="form-control" name="submit" value="Submit" />
                    <div class="form-group" style="margin-left: -1em;;">
                        <button type="submit" class="btn btn-primary"><%= bundle.getString("Submit")%></button>
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
        <script type="text/javascript">
                        function goHome() {
                            location.href = "/team11-RateMyInternship/index.jsp";
                        }

                        function goSecure() {
                            <% if (!request.getServerName().contains("grove")) { %>
                                location.href = "https://localhost:8443/RateMyInternship/my_account.jsp";
                                <%} else {%>
                                    location.href = "https://grove.cs.jmu.edu/team11-RateMyInternship/my_account.jsp";
                                    <%}%>
                            }
        </script>
    </body>
</html>
