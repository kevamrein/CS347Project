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
            response.sendRedirect("login.jsp?ref=make_review");
            return;
        }

        String error = "";
        
        if (request.getParameter("error") != null) {
            error = request.getParameter("error");
        }
    %>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Make Review </title>
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />
        <link rel="stylesheet" type="text/css" href="css/styles.css" />
        <link rel="stylesheet" type="text/css" href="css/reviewStyle.css" />
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
                        <%  if (loggedIn) {
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
                <h1 style="text-align: center; color: whitesmoke">Create Review</h1>
                <hr />
            </div>
            <br />
            <% if (error.length() > 0) { %>
                <div class="alert alert-warning">
                    <%= error %>
                </div>
            <% } %>
            <div class="body-content white-box">
                <h3 style="margin-left: -0.6em;">Choose an Organization:</h3>
                <div class="body-cols">
                    <form method="POST" action="makeReview">
                        <div id="company_dropdown_input">
                            Company Name: 
                            <select id="orglist">
                                <%
                                    ArrayList<Organization> orgs = Query.getOrganizations();
                                    String option = "";
                                    option = String.format("<option id=\"%s\"value=\"%s\">%s</option>",
                                            "defaultOrg", "default", "Select an Organization");
                                    out.println(option);
                                    option = String.format("<option id=\"%s\"value=\"%s\">%s</option>",
                                            "neworg", "neworg", "Add New Organization");
                                    out.println(option);
                                    for (Organization org : orgs) {
                                        option = String.format("<option id=\"%s\"value=\"%s\">%s</option>",
                                                org.getId(), org.getName(), org.getName());
                                        out.println(option);
                                    }

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
                                        option = String.format("<option id=\"%s\"value=\"%s\">%s</option>",
                                                "newintern", "newintern", "Add New Internship");
                                        out.println(option);
                                        for (Internship i : internships) {
                                            option = String.format("<option id=\"%s\"value=\"%s\">%s</option>",
                                                    i.getId(), i.getName(), i.getName());
                                            out.println(option);
                                        }
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
                                    button = String.format("<br \\>%d: <input type=\"radio\" name=\"overall_rating\" value=%d>", i, i);
                                    out.println(button);
                                }
                            %>
                        </div>
                        <br />
                        <div id="reviewArea">
                            Review:
                            <br />
                            <textarea maxlength="1000" name="review" style="height:100px;width:200px;overflow:scroll;"/></textarea>
                        </div>

                        <input id="submitbutton" class="btn" type="submit" value="Submit" />
                    </form>
                    <div>
                        <div class="addOrganization">
                            <form id="addOrgForm" method="POST" action="addOrg">
                                <p>Organization Name: <input type="text" name="orgName" /></p>
                                <p>Organization Tagline: <input type="text" name="tagline" /></p>
                                <p><input type="submit" class="btn addSubmit" value="Submit" /></p>
                            </form>
                        </div>
                        <div class="addInternship">
                            <form id="addInternForm">
                                <p>Internship Name: <input id="internName" type="text" name="orgName" /></p>
                                <p>Description:</p>
                                <p><textarea maxlength="1000" id="description" name="description" style="height:100px;width:200px;overflow:scroll;"/></textarea></p>
                                <p>Minimum GPA Requirement (optional): <input id="minGPA" type="text" name="minGPA" /></p>
                                <p>Minimum Class Standing: 
                                    <select id="classStanding" name="classStanding">
                                        <option id="none" value="None">None</option>
                                        <option id="freshman" value="Freshman">Freshman</option>
                                        <option id="sophomore" value="Sophomore">Sophomore</option>
                                        <option id="junior" value="Junior">Junior</option>
                                        <option id="senior" value="Senior">Senior</option>
                                    </select>
                                </p>
                                <p><input type="submit" class="btn addSubmit" value="Submit" /></p>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
                    
        <script type="text/javascript" src="js/jquery.min.js"></script>
        <script type="text/javascript" src="js/bootstrap.min.js"></script>
        <script type="text/javascript">
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
                        $("#internship_dropdown_input").hide();
                        $("#overallRadioButtons").hide();
                        $("#reviewArea").hide();
                        $("#submitbutton").hide();
                    } else if (selectedId != "defaultOrg") {
                        $.post("makeReview", {orgId: selectedId, operation: "setOrg"})
                                .done(function () {
                                    $(".addInternship").hide();
                                    $(".addOrganization").hide();
                                    $("#overallRadioButtons").hide();
                                    $("#reviewArea").hide();
                                    $("#submitbutton").hide();
                                    $("#internship_dropdown_input").load(location.href + " #internship_dropdown_input");
                                    $("#internship_dropdown_input").show();
                                });
                    } else {
                        $(".addInternship").hide();
                        $(".addOrganization").hide();
                        $("#overallRadioButtons").hide();
                        $("#reviewArea").hide();
                        $("#submitbutton").hide();
                        $("#internship_dropdown_input").hide();
                    }
                });

                $("body").on("change", "#internList", function () {
                    var selectedIntern = $("#internList option:selected").attr("id");
                    if (selectedIntern == "newintern") {
                        $(".addInternship").show();
                        $(".addOrganization").hide();
                        $("#overallRadioButtons").hide();
                        $("#reviewArea").hide();
                        $("#submitbutton").hide();
                    } else if (selectedIntern != "defaultIntern") {
                        $(".addInternship").hide();
                        $(".addOrganization").hide();
                        $("#overallRadioButtons").show();
                        $("#reviewArea").show();
                        $("#submitbutton").show();
                        $.post("makeReview", {internId: selectedIntern, operation: "setIntern"});
                    } else {
                        $(".addInternship").hide();
                        $(".addOrganization").hide();
                        $("#overallRadioButtons").hide();
                        $("#reviewArea").hide();
                        $("#submitbutton").hide();
                    }
                });
                $("#addInternForm").submit(function (event) {
                    event.preventDefault();
                    var name = $("#internName").val();
                    var description = $("#description").val();
                    var minGPA = $("#minGPA").val();
                    var minClass = $("#classStanding").val();
                    $.post("addInternship", {internName: name, internDescription: description, minimumGPA: minGPA, minStanding: minClass})
                            .done(function () {
                                $(".addInternship").hide();
                                $("#internship_dropdown_input").load(location.href + " #internship_dropdown_input");
                            });

                });
            });
        </script>
    </body>
</html>
