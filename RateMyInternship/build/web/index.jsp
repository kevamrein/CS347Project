<!--
    author: Group 1-1
    class: CS 347
    assignment: Semester Project
-->
<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
      "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
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
        
        <div class="top-container">
            <div class="items">
                <div class="item">
                    <div class="item-header">
                        Find an Internship
                    </div>
                    <div class="item-content">
                        <img src="img/search.png" />
                    </div>
                </div>
                <div class="item">
                    <div class="item-header">
                        Rate an Internship
                    </div>
                    <div class="item-content">
                        <img src="img/star.png" />
                    </div>
                </div>
                <div class="item">
                    <div class="item-header">
                        Review an Internship
                    </div>
                    <div class="item-content">
                        <img src="img/review.png" />
                    </div>
                </div>
            </div>
        </div>
                
        <div class="body-container">
            <h2 class="top-internships">Top Internships</h2>
            <div class="internships">
                <div class="internship"></div>
                <div class="internship"></div>
                <div class="internship"></div>
                <div class="internship"></div>
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