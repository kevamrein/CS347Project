<%-- 
    Document   : new_review
    Created on : Nov 28, 2016, 5:32:33 PM
    Author     : carswesp
--%>

<%@page import="servlet.MakeReviewServlet"%>
<%@page contentType="text/html" pageEncoding="UTF-8" import="dataObjects.*, database.*, java.util.*"%>
<!DOCTYPE html>
<html>
    <%
        //Boolean loggedIn = true;
        
        Boolean loggedIn = false;

        if (session.getAttribute("signed_in") != null) {
            loggedIn = (Boolean) session.getAttribute("signed_in");
        }

        if (!loggedIn) {
            response.sendRedirect("login.jsp");
            return;
        }
         
    %>

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
                                out.println("<li><a href='signout.jsp'>Sign out</a></li>");
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
        <div class="row">
            <div class="col-lg-5">
                <form  method="POST" action="makeReview">
                    <div id="company_dropdown_input">
                        Company Name: 
                        <select id="orglist">
                            <%
                                ArrayList<Organization> orgs = Query.getOrganizations();
                                String option = "";
                                option = String.format("<option id=\"%s\"value=\"%s\">%s</option>",
                                        "defaultOrg", "default", "Select an Organization");
                                out.println(option);
                                for (Organization org : orgs) {
                                    option = String.format("<option id=\"%s\"value=\"%s\">%s</option>",
                                            org.getId(), org.getName(), org.getName());
                                    out.println(option);
                                }
                                option = String.format("<option id=\"%s\"value=\"%s\">%s</option>",
                                        "neworg", "neworg", "Add New Organization");
                                out.println(option);
                            %>
                        </select>
                    </div>
                    <br />
                    <!-- Internship Entry-->
                    <div id="internship_dropdown_input">
                        <%
                            if (MakeReviewServlet.organization != null) {
                                out.println("Internship Role: ");
                        %>
                        <select id="internList">
                            <%
                                    ArrayList<Internship> internships = Query.getInternships(MakeReviewServlet.organization);

                                    option = String.format("<option id=\"%s\"value=\"%s\">%s</option>",
                                            "defaultIntern", "default", "Select an Internship");
                                    out.println(option);
                                    for (Internship i : internships) {
                                        option = String.format("<option id=\"%s\"value=\"%s\">%s</option>",
                                                i.getId(), i.getName(), i.getName());
                                        out.println(option);
                                    }
                                    option = String.format("<option id=\"%s\"value=\"%s\">%s</option>",
                                            "newintern", "newintern", "Add New Internship");
                                    out.println(option);
                                }
                            %>
                        </select>
                    </div>
                    <br />
                    <div id="overallRadioButtons">
                        Overall Rating:
                        <%
                            String button;
                            for (int i = 1; i <= 5; i++) {
                                button = String.format("%d <input type=\"radio\" name=\"overall_rating\" value=%d>", i, i);
                                out.println(button);
                            }
                        %>
                    </div>
                    <br />
                    <div id="reviewArea">
                        Review:
                        </br>
                        <textarea maxlength="1000" name="review" style="height:100px;width:200px;overflow:scroll;"/></textarea>
                    </div>

                    <input id="submitbutton" type="submit" value="Submit"/>

                </form>
            </div>
            <div class="col-lg-5">
                <div class="addOrganization">
                    <p>HELLO MY NAME IS ORG </p>
                </div>
                <div class="addInternship">
                    <p>HELLO MY NAME IS INTERN</p>
                </div>
            </div>

        </div>


        <script>
            $(document).ready(function () {
                $(".addInternship").hide();
                $(".addOrganization").hide();
                $("#internship_dropdown_input").hide();
                $("#overallRadioButtons").hide();
                $("#reviewArea").hide();
                $("#submitbutton").hide();

                $("#orglist").change(function () {
                    var selectedId = $("#orglist option:selected").attr("id");
                    if (selectedId == "neworg") {
                        $(".addOrganization").show();
                    } else if (selectedId != "defaultOrg") {
                        $.post("makeReview", {orgId: selectedId, operation: "setOrg"})
                                .done(function () {
                                    $("#internship_dropdown_input").load(location.href + " #internship_dropdown_input");
                                    $("#internship_dropdown_input").show();
                                });
                    }
                });

                $("body").on("change", "#internList", function () {
                    var selectedIntern = $("#internList option:selected").attr("id");
                    if (selectedIntern == "newintern") {
                        $(".addInternship").show();
                    } else if (selectedIntern != "defaultIntern") {
                        $("#overallRadioButtons").show();
                        $("#reviewArea").show();
                        $("#submitbutton").show();
                        $.post("makeReview", {internId: selectedIntern, operation: "setIntern"});
                    }
                });
            });
        </script>
    </body>
</html>
