<%-- 
    Document   : search
    Created on : Nov 28, 2016, 7:23:02 PM
    Author     : Austin VErshel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="database.*, dataObjects.*, java.util.*"%>
<!DOCTYPE html>
<html>
    <%
        Boolean loggedIn = false;
        
        if (session.getAttribute("signed_in") != null) {
            loggedIn = (Boolean)session.getAttribute("signed_in");
        }
    %>
    
    <head>
        <title>Rate My Internship - Home</title>

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

        <script type="text/javascript" src="js/jquery.min.js"></script>
        <script type="text/javascript" src="js/bootstrap.min.js"></script>

        <%
            //Query.insertUser("test2", "pw", "kevin@dukes.com", "Kevin", "Amrein", "Harrisonburg", "VA");
            //Organization org = new Organization("Apple", "The best company ever", 4);
            //Query.addOrganization(org);
            ArrayList<Organization> orgs = Query.getOrganizations();
            if (request.getParameter("query") == null) {
                for (Organization org : orgs) {%>
        <div class="post" >
            <div class = "postcontent">

                <h1 align="center"><a href="internshipHomePage.jsp?id=<%=org.getId()%>"><%=org.getName()%></a><h1>
                        <div class = "rating">
                            <h3 align = "right" ><%=org.getRating()%></h3>
                        </div>

                        </div>    <center>  <p align="center"><%=org.getTagline()%></p></center>
                        <br>

                        </div>
                        </div>
                        <br>
                        <% }
                        } else {
                            for (Organization org : orgs) {
                                if (org.getName().toLowerCase().contains(request.getParameter("query").toLowerCase())) {%>
                        <div class="post" >
                            <div class = "postcontent">

                                <h1 align="center"><a href="internshipHomePage.jsp?id=<%=org.getId()%>"><%=org.getName()%></a><h1>
                                        <div class = "rating">
                                            <h3 align = "right" ><%=String.format("%.2f", org.getRating())%></h3>
                                        </div>

                                        </div>    <center>  <p align="center"><%=org.getTagline()%></p></center>
                                        <br>

                                        </div>
                                        </div>
                                        <br>
                                        <% }
                                                }
                                            }%>




                                        <style>
                                            .post{
                                                border-bottom:1px black solid;
                                            }

                                            .post .rating{
                                                padding-right:12%;
                                            }

                                            p{
                                                font-size: 14pt;
                                                width: 629px;
                                            }
                                        </style>

                                        </body>
                                        </html>
