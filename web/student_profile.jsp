<%-- 
    Document   : student_profile
    Created on : Jun 6, 2022, 4:12:55 PM
    Author     : Tranduc
--%>

<%@page import="sample.student.StudentDTO"%>
<%@page import="sample.account.AccountDTO"%>
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
        <title>Student's Profile</title>
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
                <a class="navbar-brand mr-auto" href="JobListController"><img src="img/logo.png" height="30" width="41"></a>
                <div class="collapse navbar-collapse" id="Navbar">
                    <ul class="navbar-nav">
                        <li class="nav-item active">
                            <a class="nav-link" href="student_profile.jsp">
                                <span class="fas fa-id-card"></span>
                                Home
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="mainController?action=GetApplication&stuID=<%=stu.getStudentID()%>">
                                <span class="far fa-file-alt"></span>
                                Application
                            </a>
                        </li>
                        <li class="nav-item">
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

        <div class="container">
            <h3>Welcome ${sessionScope.name}</h3>

            <div class="container-xl px-4 mt-4">
                <!-- Account page navigation-->

                <div class="row">
                    <div class="col-xl-4">
                        <!-- Profile picture card-->
                        <div class="card mb-4 mb-xl-0">
                            <div class="card-header">Profile Picture</div>
                            <div class="card-body text-center">
                                <!-- Profile picture image-->
                                <img class="img-account-profile rounded-circle mb-2" src="<%= acc.getAvatar()%>" alt="">
                                <!-- Profile picture help block-->
                                <div class="small font-italic text-muted mb-4">JPG or PNG no larger than 5 MB</div>
                                <!-- Profile picture upload button-->

                                <!-- Avatar -->
                                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#updateAvatar">
                                    Update Avatar
                                </button>

                                <!-- Modal -->
                                <form action="UploadImageController" method="post" enctype="multipart/form-data">
                                    <div class="modal fade" id="updateAvatar" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                        <div class="modal-dialog" role="document">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="exampleModalLabel">Upload Your Avatar</h5>
                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                        <span aria-hidden="true">&times;</span>
                                                    </button>
                                                </div>
                                                <div class="modal-body">
                                                    <input type="file" name="file" size="60" accept=".jpg, .jpeg, .png"/><br /><br /> 

                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                                    <button type="submit" class="btn btn-primary">Save changes</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <%= (request.getAttribute("noFile") == null) ? "" : request.getAttribute("noFile")%>
                                </form>


                                <!-- CV -->                            
                                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#uploadCV" style="margin-top: 20px;">
                                    Upload CV
                                </button>

                                <!-- Modal -->
                                <form action="UploadCVController" method="post" enctype="multipart/form-data">
                                    <div class="modal fade" id="uploadCV" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                        <div class="modal-dialog" role="document">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="exampleModalLabel">Upload Your CV</h5>
                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                        <span aria-hidden="true">&times;</span>
                                                    </button>
                                                </div>
                                                <div class="modal-body">
                                                    <input type="file" name="file" size="60" accept=".pdf"/><br /><br /> 

                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                                    <button type="submit" class="btn btn-primary">Upload</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <%= (request.getAttribute("noCV") == null) ? "" : request.getAttribute("noCV")%>
                                </form>

                                
                                <% if(acc.getCvPath()!=null){
                                    %>                     
                                    <a href="<%= acc.getCvPath() %>">View CV</a>
                                <%
                                }%>

                            </div>
                        </div>
                    </div>

                            
                    <div class="col-xl-8">
                        <!-- Account details card-->
                        <div class="card mb-4">
                            <div class="card-header">Account Details</div>
                            <div class="card-body">
                                <form action="mainController" method="post" enctype="">
                                    <!-- Form Group (username)-->
                                    <div class="mb-3">
                                        <label class="small mb-1" for="inputUsername">Student Name</label>
                                        <input class="form-control" id="inputUsername" type="text" value="<%= acc.getName()%>" required="" name="txtname">
                                    </div>
                                    <!-- Form Row-->

                                    <!-- Form Row        -->
                                    <div class="row gx-3 mb-3">
                                        <!-- Form Group (organization name)-->
                                        <div class="col-md-6">
                                            <label class="small mb-1" for="inputPhone">Student ID</label>
                                            <input class="form-control" id="inputPhone" type="tel" name="txtstuid" value="<%= stu.getStudentID() %>" readonly="">
                                        </div>
                                        <!-- Form Group (location)-->
                                        <div class="col-md-6">
                                            <label class="small mb-1" for="inputLocation">Major</label>
                                            <input class="form-control" name="txtmajor" value="${sessionScope.majorName}" readonly="">
                                               
                                           
                                        </div>
                                    </div>
                                    <!-- Form Group (email address)-->
                                    <div class="mb-3">
                                        <label class="small mb-1" for="inputEmailAddress">Email address</label>
                                        <input class="form-control" id="inputEmailAddress" type="email" name="txtemail" readonly="" value="${sessionScope.accEmail}">
                                    </div>
                                    <!-- Form Row-->
                                    <div class="row gx-3 mb-3">
                                        <!-- Form Group (phone number)-->
                                        <div class="col-md-6">
                                            <label class="small mb-1" for="inputPhone">Phone number</label>
                                            <input class="form-control" id="inputPhone" type="tel" name="txtphone" value="<%= acc.getPhone()%>" required="">
                                        </div>
                                        <!-- Form Group (birthday)-->
                                        <div class="col-md-6">
                                            <label class="small mb-1" for="inputBirthday">Birthday</label>
                                            <input class="form-control" id="inputBirthday" type="date" name="txtbirthday" value="<%= acc.getBirthday()%>">
                                        </div>
                                    </div>
                                            <%= (request.getAttribute("success") == null) ? "" : request.getAttribute("success")%> </br>
                                    <!-- Save changes button-->
                                    <button class="btn btn-primary" type="submit" name="action" value="updateInfor">Save changes</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
                                            <footer>
                                                <%@include file="footer.jsp" %>
                                            </footer>

        <script src="node_modules/jquery/dist/jquery.slim.min.js"></script>
        <script src="node_modules/popper.js/dist/umd/popper.min.js"></script>
        <script src="node_modules/bootstrap/dist/js/bootstrap.min.js"></script>
        <script>
            var loader=document.getElementById("preloader");
            window.addEventListener("load",function (){
                loader.style.display="none";
            });
        </script>
    </body>
</html>
<%}
%>