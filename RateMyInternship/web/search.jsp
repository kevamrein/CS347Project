<%-- 
    Document   : search
    Created on : Nov 28, 2016, 7:23:02 PM
    Author     : Austin Vershel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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


        <br>
<%
    String[] compName = new String[3];
    String[] compSummary = new String[3];
    String[] compRating = new String[3];

    
    compName[0] = "Northrup Gruman";
    compSummary[0] = "A defense contractor.  This company Contracts defense.  defensively.";
    compRating[0] = "3.2/5";

    
    
    compName[1] = "Accenture";
        compSummary[1] = "Accenture is a place.  people work here.  accenture is a place people work.";
    compRating[1] = "3.0/5";
    
    compName[2] = "IBM";
    compSummary[2] = "Consulting, contracting, and computers.  This company handles computers, contracting and consulting.";
    compRating[2] = "2.1/5";
    
    
    for(int i = 0; i < compName.length; i+=1) { %>
  <div class="post" >
    <div class = "postcontent">

      <h1 align="center"><a href="internshipHomePage.jsp?id=79"><%=compName[i]%></a><h1>
        <div class = "rating">
  <h3 align = "right" ><%=compRating[i]%></h3>
</div>

  </div>    <center>  <p align="center"><%=compSummary[i]%></p></center>
        <br>

      </div>
    </div>
    <br>
<% } %>

    


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
