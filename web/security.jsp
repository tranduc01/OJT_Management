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
    if (email == null) {
%>
<script>
    window.alert("You need to login first !!");
    window.location.href = "index.jsp";
</script>
%>
<%
} else {
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
        <% AccountDTO acc = (AccountDTO) session.getAttribute("acc");
           StudentDTO stu = (StudentDTO) session.getAttribute("student");
        %>
        <nav class="navbar navbar-dark navbar-expand-md fixed-top">
            <div class="container">
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#Navbar">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <a class="navbar-brand mr-auto" href="index.jsp"><img src="img/logo.png" height="30" width="41"></a>
                <div class="collapse navbar-collapse" id="Navbar">
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <a class="nav-link" href="student_profile.jsp">
                                <span class="fas fa-id-card"></span>
                                Home
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
                </div>
                <span class="navbar-text ml-auto">
                    <a href="mainController?action=logout">
                        <span class="fa fa-sign-in"></span> Logout</a>
                </span>
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

        <footer>
            <%@include file="footer.jsp" %>
        </footer>
    </body>
</html>
<%}
%>