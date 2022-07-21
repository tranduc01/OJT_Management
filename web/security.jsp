<%-- 
    Document   : security
    Created on : Jun 6, 2022, 6:47:30 PM
    Author     : Tranduc
--%>

<%@page import="sample.student.StudentDTO"%>
<%@page import="sample.account.AccountDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String email = (String) session.getAttribute("accEmail");
    if (email==null) {
%>
<script>
    window.alert("You need to login first !!");
    window.location.href = "login.jsp";
</script>
%>
<%
} else {
int role=(int) session.getAttribute("role");
if(role==0 || role==2){
%>
<script>
    window.alert("You don't have permission to access this site !!!");
    window.location.href = "JobListController";
</script>
%><%
}else{
%>
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
        <title>Security</title>
    </head>
    <body>     
        
        <div id="preloader">
            <img src="img/loader.gif"/>
        </div>
        <% AccountDTO acc = (AccountDTO) session.getAttribute("acc");
           StudentDTO stu = (StudentDTO) session.getAttribute("student");
        %>
        <nav class="navbar navbar-dark navbar-expand-md">
            <div class="container">
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#Navbar">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <a class="navbar-brand mr-auto" href="JobListByPageController"><img src="img/logo.png" height="30" width="41"></a>
                <div class="collapse navbar-collapse" id="Navbar">
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <a class="nav-link" href="student_profile.jsp">
                                <span class="fas fa-id-card"></span>
                                Profile
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="mainController?action=GetApplication&stuID=<%= stu.getStudentID() %>">
                                <span class="far fa-file-alt"></span>
                                Application
                            </a>
                        </li>
                        <li class="nav-item active">
                            <a class="nav-link" href="security.jsp">
                                <span class="fas fa-user-lock"></span>
                                Security
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
                                <a class="dropdown-item preview-item">
                                    <div class="preview-thumbnail">
                                        <div class="preview-icon bg-success">
                                            <i class="ti-info-alt mx-0"></i>
                                        </div>
                                    </div>
                                    <div class="preview-item-content">
                                        <h6 class="preview-subject font-weight-normal">Application Error</h6>
                                        <p class="font-weight-light small-text mb-0 text-muted">
                                            Just now
                                        </p>
                                    </div>
                                </a>
                                <a class="dropdown-item preview-item">
                                    <div class="preview-thumbnail">
                                        <div class="preview-icon bg-warning">
                                            <i class="ti-settings mx-0"></i>
                                        </div>
                                    </div>
                                    <div class="preview-item-content">
                                        <h6 class="preview-subject font-weight-normal">Settings</h6>
                                        <p class="font-weight-light small-text mb-0 text-muted">
                                            Private message
                                        </p>
                                    </div>
                                </a>
                                <a class="dropdown-item preview-item">
                                    <div class="preview-thumbnail">
                                        <div class="preview-icon bg-info">
                                            <i class="ti-user mx-0"></i>
                                        </div>
                                    </div>
                                    <div class="preview-item-content">
                                        <h6 class="preview-subject font-weight-normal">New user registration</h6>
                                        <p class="font-weight-light small-text mb-0 text-muted">
                                            2 days ago
                                        </p>
                                    </div>
                                </a>
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

        <div class="container-xl px-4 mt-4">
            <!-- Account page navigation-->

            <div class="row">
                <div class="col-lg-4">
                    <!-- Change password card-->
                    <div class="card mb-4">
                        <div class="card mb-4 mb-xl-0">
                            <div class="card-header">Profile Picture</div>
                            <div class="card-body text-center">
                                <!-- Profile picture image-->
                                <img class="img-account-profile rounded-circle mb-2" src="<%= acc.getAvatar()%>" alt="">
                                <p><%= acc.getName()%></p>
                                <p><%= stu.getStudentID() %></p>
                            </div>
                        </div>
                    </div>

                </div>
                <div class="col-lg-8">
                    <!-- Change password card-->
                    <div class="card mb-4">
                        <div class="card-header">Change Password</div>
                        <div class="card-body">
                            <form action="mainController" method="post">
                                <!-- Form Group (current password)-->
                                <div class="mb-3">
                                    <label class="small mb-1" for="currentPassword">Current Password</label>
                                    <input class="form-control" id="currentPassword" type="password" placeholder="Enter current password" name="currentPassword">
                                </div>
                                <!-- Form Group (new password)-->
                                <div class="mb-3">
                                    <label class="small mb-1" for="newPassword">New Password</label>
                                    <input class="form-control" id="newPassword" type="password" placeholder="Enter new password" name="newPassword">
                                </div>
                                <!-- Form Group (confirm password)-->
                                <div class="mb-3">
                                    <label class="small mb-1" for="confirmPassword">Confirm Password</label>
                                    <input class="form-control" id="confirmPassword" type="password" placeholder="Confirm new password" name="confirmPassword">
                                </div>
                                <%
                                    if (request.getAttribute("changed") != null) {
                                %>

                                <script>
                                        window.alert("Password change successfully !!!");
                                        window.location.href = "student_profile.jsp";
                                </script>
                                %>
                                <%
                                    }

                                %>
                                <p style="color: red;"><%= (request.getAttribute("wrongPassword") == null) ? "" : request.getAttribute("wrongPassword")%></p>
                                <p style="color: red;"><%= (request.getAttribute("passNotMatch") == null) ? "" : request.getAttribute("passNotMatch")%></p>
                                <button class="btn btn-primary" type="submit" name="action" value="ChangePassword">Save</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

       
        <script>
            var loader=document.getElementById("preloader");
            window.addEventListener("load",function (){
                loader.style.display="none";
            });
        </script>
    </body>
</html>
<%}
}
%>