<%-- 
    Document   : application
    Created on : Jun 6, 2022, 6:47:22 PM
    Author     : Tranduc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<%
    String email = (String) session.getAttribute("accEmail");
    if (email == null) {
%>
<script>
    window.alert("You need to login first !!");
    window.location.href = "login.jsp";
</script>
%>
<%
} else {
    int role = (int) session.getAttribute("role");
    if (role == 0 || role == 1) {
%>
<script>
    window.alert("You don't have permission to access this site !!!");
    window.location.href = "JobListController";
</script>
%><%
} else {
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/style.css"  />
        <link rel="stylesheet" href="css/application.css"  />
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
        <title>Application</title>
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
                <a class="navbar-brand mr-auto" href="JobListController"><img src="img/logo.png" height="30" width="41"></a>
                <div class="collapse navbar-collapse" id="Navbar">
                    <ul class="navbar-nav">
                        <li class="nav-item active">
                            <a class="nav-link" href="CompanyHomePageController">
                                <span class="fa fa-home fa-lg"></span>
                                Home
                            </a>
                        </li>                      
                        <li class="nav-item">
                            <a class="nav-link" href="StudentListCompanyController">
                                <span class="fa-solid fa-users"></span>
                                Students
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="ApplicationForCompanyController">
                                <span class="fa-solid fa-users"></span>
                                Application
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="CompanyProfileController">
                                <span class="fa fa-building-o fa-lg"></span>
                                Company Profile
                            </a>
                        </li>    
                        <li class="nav-item">
                            <a class="nav-link" href="#">
                                <span class="fa fa-graduation-cap fa-lg"></span>
                                OJT Results
                            </a>
                        </li>
                    </ul>
                </div>
                <span class="navbar-text ml-auto">
                    <a href="mainController?action=logout">
                        <span class="fa fa-sign-in"></span> Logout</a>
                </span>
            </div>
        </nav>

        <div class="container-xl px-4 mt-4" style="padding-top: 50px; padding-bottom: 300px;">
            <!-- Account page navigation-->

            <div class="row">
                <div class="col-lg-12">
                    <div class="main-box clearfix">
                        <div class="table-responsive">

                            <table class="table user-list">
                                <thead>
                                    <tr>
                                        <th><span>Student ID</span></th>
                                        <th><span>Student Name</span></th>
                                        <th><span>Apply Date</span></th>
                                        <th class="text-center"><span>Status</span></th>
                                        <th><span>Semester</span></th>
                                        <th><span>Job Name</span></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${requestScope.appList}" var="app">   
                                        <c:forEach items="${requestScope.jobList}" var="job">  
                                            <c:forEach items="${requestScope.stuList}" var="stu">                                                                                                   
                                                <c:forEach items="${requestScope.accList}" var="acc">
                                                    <c:if test="${app.getJobID() eq job.getJobID()}">
                                                        <c:if test="${app.getStuID() eq stu.getStudentID()}">
                                                            <c:if test="${acc.getAccId() eq stu.getAccID()}">                                                                                                                                                                                                                                         
                                                                <tr>
                                                                    <td>
                                                                        <img src="${acc.getAvatar()}" style="height: 50px; width: 50px;">
                                                                        <span>${stu.getStudentID()}</span>
                                                                    </td>
                                                                    <td>

                                                                        <span><a href="#" class="user-link" style="padding-top: 11px;">${acc.getName()}</a></span>
                                                                    </td>
                                                                    <td>
                                                                        ${app.getApplyDate()}
                                                                    </td>
                                                                    <td class="text-center">
                                                                        <c:if test="${app.getStatus() eq 3}"><h5><span class="badge badge-danger">Rejected</span></h5></c:if>
                                                                        <c:if test="${app.getStatus() eq 2}"><h5><span class="badge badge-warning">Pending</span></h5></c:if>
                                                                        <c:if test="${app.getStatus() eq 1}"><h5><span class="badge badge-success">Accepted</span></h5></c:if>


                                                                        </td>
                                                                        <td>
                                                                            Spring 2022
                                                                        </td>
                                                                        <td style="width: 20%;">${job.getJobName()}</td>
                                                                    <td class="text-center">
                                                                        <c:if test="${app.getStu_confirm()==1 && app.getCom_conirm()==0}">
                                                                        <form method="POST" action="VerifyOJTApplicationController?appID=${app.getApplyID()}">
                                                                            
                                                                                <h4><button class="badge badge-success" type="submit" name="action" value="Accept"><i class="fa-solid fa-check"></i></button>
                                                                                    <button class="badge badge-danger" type="submit" name="action" value="Reject"><i class="fa-solid fa-ban"></i></button></h4>
                                                                                    
                                                                            </form>
                                                                        </c:if>
                                                                    </td>
                                                                </tr>
                                                            </c:if>
                                                        </c:if> 
                                                    </c:if>
                                                </c:forEach>
                                            </c:forEach>
                                        </c:forEach>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
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
<%}
    }
%>
