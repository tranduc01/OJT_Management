<%-- 
    Document   : job
    Created on : Jun 8, 2022, 11:08:21 PM
    Author     : Tranduc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/style.css"  />
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">

        <!-- jQuery library -->
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>

        <!-- Popper JS -->
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

        <!-- Latest compiled JavaScript -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

        <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css'>
        <script src="https://kit.fontawesome.com/12c372e324.js" crossorigin="anonymous"></script>
        <link rel="shortcut icon" href="img/FPT-logoo.jpg">

        <title>Jobs</title>
    </head>
    <body>

        <div id="preloader">
            <img src="img/loader.gif"/>
        </div>
        <nav class="navbar navbar-dark navbar-expand-md">
            <div class="container">
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#Navbar">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <a class="navbar-brand mr-auto" href="JobListByPageController"><img src="img/logo.png" height="30" width="41"></a>
                <div class="collapse navbar-collapse" id="Navbar">
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <a class="nav-link" href="JobListByPageController">
                                <span class="fa fa-home fa-lg"></span>
                                Home
                            </a>
                        </li>
                        <li class="nav-item active">
                            <a class="nav-link" href="JobsPageController">
                                <span class="fa fa-briefcase fa-lg"></span>
                                Jobs
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="about.jsp">
                                <span class="fas fa-graduation-cap"></span>
                                About
                            </a>
                        </li>
                    </ul>
                </div>
                <% String email = (String) session.getAttribute("accEmail");

                    if (email != null) {
                        int role = (int) session.getAttribute("role");
                        String link = "";

                        if (role == 0) {
                            link = "mainController?action=AdminPage";

                        } else if (role == 1) {
                            link = "student_profile.jsp";

                        } else {
                            link = "company_page.jsp";

                        }
                %> 

                <span class="navbar-text ml-auto">
                    <a  href="<%= link%> ">
                        <span class="fa fa-user-o fa-lg"></span> ${sessionScope.name}               
                    </a>
                </span>
                <span class="navbar-text ml-auto">
                    <a href="mainController?action=logout"><span class="fa fa-sign-out"></span> Logout</a>
                </span>
                <%
                } else {
                %>
                <span class="navbar-text ml-auto">
                    <a href="login.jsp">
                        <span class="fa fa-sign-in"></span> Login</a>
                </span>
                <%
                    }
                %>



            </div>
        </nav>

        <div class="jumbotron">
            <!--<form class="search-container">
                <input class="search-item" type="text" placeholder="Search company.." name="search">
                <button class="search-item" type="submit"><i class="fa fa-search"></i></button>
            </form>-->


            <h3>Jobs for you</h3>

            <c:forEach var="job" items="${requestScope.jobList}">
                <c:forEach var="com" items="${requestScope.companyList}">
                    <c:forEach var="acc" items="${requestScope.accList}">
                        <c:if test="${job.getComID() eq com.getComID()}">
                            <c:if test="${com.getAccID() eq acc.getAccId()}">
                                <div class="job-container">
                                    <div class="card" style="width:90%; height:240px; border-radius: 10px;">
                                        <div class="card-body row">
                                            <div class="col-3"><a href="mainController?action=jobDetails&jobid=${job.getJobID()}"><img src="${acc.getAvatar()}" style="width:80%; height: 90%;"></a></div>
                                            <div class="col-md">
                                                <p class="title" style="font-weight: bold;">${acc.getName()}</p>
                                                <p>${job.getJobName()}</p>
                                                <p><i class="fa fa-map-marker"></i> ${com.getComAddress()}</p>
                                                <p>$${job.getJobSalary()}</p>
                                            </div>
                                        </div>
                                    </div>
                                </div> 
                            </c:if>
                        </c:if>
                    </c:forEach>
                </c:forEach>
            </c:forEach>                
        </div>
        <footer>
            <%@include file="footer.jsp" %>
        </footer>
        <script>
            var loader = document.getElementById("preloader");
            window.addEventListener("load", function () {
                loader.style.display = "none";
            });
        </script>
    </body>
</html>
