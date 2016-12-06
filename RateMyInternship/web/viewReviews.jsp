<%-- 
    Document   : viewReviews
    Created on : Nov 26, 2016, 12:16:08 PM
    Author     : kevinamrein
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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />
        <link rel="stylesheet" type="text/css" href="css/styles.css" />
        <link rel="stylesheet" type="text/css" href="css/reviewStyle.css" />
        <title>All Reviews</title>
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

        <!-- Header Goes Above-->

        <%
            //Query.insertUser("test2", "pw", "kevin@dukes.com", "Kevin", "Amrein", "Harrisonburg", "VA");
            //Organization org = new Organization("Apple", "The best company ever", 4);
            //Query.addOrganization(org);
            //ArrayList<Organization> orgs = Query.getOrganizations();
            //Organization org = orgs.get(0);
            //Internship i = new Internship(org, "Software Engineer Intern", "Where you do stuff", 
            //"3.0", "Freshman");
            //Query.addInternship(i);

            String organizationId = request.getParameter("orgId");
            organizationId = organizationId.substring(0, organizationId.length() - 1);
            Organization org = Query.getOrganization(organizationId);
            ArrayList<Review> reviews = Query.getReviews(org);
        %>
        <div class="row companyName">
            <div class="col-lg-10">
                <h1><%=org.getName()%></h1>
                <br />
                <h4 class="reviewAvgLabel">Average Review: <%=String.format("%.1f / 5", org.getRating())%></h4>
            </div>
        </div>
        <div class="allreviews">
            <%
                for (Review r : reviews) {
            %>
            <!-- This will all have to be added dynamically based on the amt of reviews -->

            <div class="row review">
                <div class="col-lg-10">
                    <h3><%=r.getInternship().getName()%></h3>
                    <h4 class="authorTitle">By: <%=String.format("%s %s", r.getUser().getFirstName(), r.getUser().getLastName())%></h4>
                </div>
                <div class="col-md-6">
                    <div class="reviewComment">
                        <p><%=r.getComment()%><p>
                    </div>
                </div>
                <div class="col-md-6 offset-md-6 individualReviewScore">
                    <h5>Review of Internship: <%=String.format("%d / 5", r.getRating())%></h5>
                </div>

            </div>
            <%}%>
        </div>
        <!-- Footer Goes Below-->
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
    </body>
</html>
