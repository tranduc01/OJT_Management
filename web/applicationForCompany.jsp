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

        <nav class="navbar navbar-dark navbar-expand-md fixed-top">
            <div class="container">
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#Navbar">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <a class="navbar-brand mr-auto" href="JobListByPageController"><img src="img/logo.png" height="30" width="41"></a>
                <div class="collapse navbar-collapse" id="Navbar">
                    <ul class="navbar-nav">
                        <li class="nav-item ">
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
                        <li class="nav-item active">
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
                    <ul class="navbar-nav navbar-nav-right ml-auto align-items-center">
                        <li class="nav-item dropdown">
                            <a class="nav-link count-indicator dropdown-toggle" id="notificationDropdown" href="#" data-toggle="dropdown">
                                <i class="fa-regular fa-bell mx-0"></i>
                                <span class="count"></span>
                            </a>
                            <div class="dropdown-menu dropdown-menu-right navbar-dropdown preview-list" aria-labelledby="notificationDropdown">
                                <p class="mb-0 font-weight-normal float-left dropdown-header">Notifications</p>
                                <c:forEach items="${requestScope.appList1}" var="app">   
                                    <c:forEach items="${requestScope.jobList1}" var="job">  
                                        <c:forEach items="${requestScope.comList1}" var="com">                                                                                                   
                                            <c:forEach items="${requestScope.accList1}" var="acc">
                                                <c:if test="${app.getJobID() eq job.getJobID()}">
                                                    <c:if test="${job.getComID() eq com.getComID()}">
                                                        <c:if test="${acc.getAccId() eq com.getAccID()}">   
                                                            <a class="dropdown-item preview-item" href="mainController?action=GetApplication">
                                                                <div class="preview-thumbnail">
                                                                    <div class="preview-icon">
                                                                        <img src="${acc.getAvatar()}" style="object-fit: cover;
                                                                             overflow: hidden;
                                                                             height: 100%;
                                                                             width: 80px;
                                                                             padding-right: 20px;"/>
                                                                    </div>
                                                                </div>
                                                                <div class="preview-item-content">
                                                                    <h5 class="preview-subject font-weight-normal">${acc.getName()}</h5>
                                                                    <h6 class="preview-subject font-weight-normal">${job.getJobName()}</h6>

                                                                    <p class="font-weight-light small-text mb-0 text-muted">
                                                                        ${app.getApplyDate()}
                                                                    </p>
                                                                </div>
                                                            </a>
                                                        </c:if>
                                                    </c:if>
                                                </c:if>
                                            </c:forEach>
                                        </c:forEach>
                                    </c:forEach>
                                </c:forEach>
                            </div>
                        </li>
                        <li class="nav-item nav-profile dropdown">
                            <a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown" id="profileDropdown">
                                <img src="${sessionScope.acc.getAvatar()}" style="width: 40px;
                                     height: 40px;
                                     border-radius: 100%;"/>
                            </a>
                            <div class="dropdown-menu dropdown-menu-right navbar-dropdown" aria-labelledby="profileDropdown">

                                <a class="dropdown-item" href="mainController?action=logout">
                                    <i class="fa fa-power-off" style="color: #f27229;"></i>
                                    Logout
                                </a>
                            </div>
                        </li>       
                    </ul>
                </div>          
            </div> 
        </nav>

        <div class="container-xl px-4 mt-4" style="padding-top: 50px; padding-bottom: 300px;">
            <!-- Account page navigation-->

            <div class="row">
                <div class="col-lg-12">
                    <div class="main-box clearfix">
                        <div class="table-responsive">

                            <table class="table user-list">
                                <thead style="text-align: center;">
                                    <tr>
                                        <th><span>Student ID</span></th>
                                        <th><span>Student Name</span></th>
                                        <th><span>Apply Date</span></th>
                                        <th class="text-center"><span>Status</span></th>
                                        <th><span>Semester</span></th>
                                        <th><span>Job Name</span></th>
                                    </tr>
                                </thead>
                                <tbody style="text-align: center;">
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
                                                                        <h6 style="padding-top: 15px;">${stu.getStudentID()}</h6>
                                                                    </td>
                                                                    <td>
                                                                        <h6><a href="#" class="user-link" style="margin: 0;">${acc.getName()}</a></h6>
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
                                                                                    <button class="badge badge-danger" type="submit" name="action" value="Reject" onclick="return check();"><i class="fa-solid fa-ban"></i></button></h4>
                                                                                    
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

        
<script>
            function check() {
                if (confirm("Are you sure to reject this application?") === false) {
                    return false;
                } else {
                    return true;
                }
            }
        </script>
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
