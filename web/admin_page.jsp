<%-- 
    Document   : admin_page
    Created on : Jun 13, 2022, 11:37:22 PM
    Author     : Tranduc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/admin.css"  />
        <link rel="stylesheet" href="css/style.css"  />
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">

        <!-- jQuery library -->
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>

        <!-- Popper JS -->
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

        <!-- Latest compiled JavaScript -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
        <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
        <script src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.2/css/bootstrap.css"></script>
        <script src="https://cdn.datatables.net/1.12.1/css/dataTables.bootstrap4.min.css"></script>
        <script src="https://cdn.datatables.net/1.12.1/js/dataTables.bootstrap4.min.js"></script>

        <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css'>
        <script src="https://kit.fontawesome.com/12c372e324.js" crossorigin="anonymous"></script>
        <link rel="shortcut icon" href="img/FPT-logoo.jpg">
        <title>Adminastor</title>
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
                            <a class="nav-link" href="#">
                                <span class="fa-solid fa-users"></span>
                                Students
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">
                                <span class="fa-solid fa-building"></span>
                                Companies
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">
                                <span class="fa-solid fa-square-poll-vertical"></span>
                                Results
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">
                                <span class="fa-solid fa-user-group"></span>
                                Accounts
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

        <div class="jumbotron">
            
            <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal" style="margin-bottom: 20px;">Import Student</button>
            <!-- Modal -->
            <form action="ImportStudentController" method="post" enctype="multipart/form-data">
            <div id="myModal" class="modal fade" role="dialog">
                <div class="modal-dialog">
                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-header">                           
                            <h4 class="modal-title">Import Student</h4>
                        </div>
                        <div class="modal-body">
                            <input type="file" name="file" size="60" accept=".xlsx"/><br /><br /> 
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                            <button type="submit" class="btn btn-primary" name="action" value="ImportStudent">Import</button>
                        </div>
                    </div>

                </div>
            </div>
            </form>
            
            <button type="button" class="btn btn-info btn-lg" data-toggle="modal1" data-target="#myModal1" style="margin-bottom: 20px;">Add Student</button>
           
            
            
            
            <table id="example" class="table table-striped table-bordered" style="width:100%;">
                <thead>
                    <tr>
                        <th>Student ID</th>
                        <th>Student Name</th>    
                        <th>Day Of Birth</th>
                        <th>Major</th>
                        <th>Semester</th>
                        <th>CV Status</th>             
                        <th>Application</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="stu" items="${requestScope.stuList}">
                        <c:forEach var="acc" items="${requestScope.accList}">

                            <c:if test="${stu.getAccID() eq acc.getAccId()}">

                                <tr>
                                    <td>${stu.getStudentID()}</td>
                                    <td>${stu.getStudentName()}</td>
                                    <td>${acc.getBirthday()}</td>
                                    <td>${stu.getMajorID()}</td>
                                    <td>${stu.getSemesterID()}</td>
                                    <td><c:if test="${acc.getCvPath() eq null}"><span class="badge badge-danger">No</span></c:if>
                                        <c:if test="${acc.getCvPath() ne null}"><span class="badge badge-success">Yes</span></c:if>
                                        </td>
                                        <td><a class="btn btn-primary" href="mainController?action=ViewApplicationAdmin&stuID=${stu.getStudentID()}">
                                            View Application
                                        </a>                                 
                                    </td>
                                </tr>  
                            </c:if>

                        </c:forEach>
                    </c:forEach>

                </tbody>

            </table>

        </div>
        <script>
            $(document).ready(function () {
                $('#example').DataTable();
            });
        </script>
        <script>
            var loader = document.getElementById("preloader");
            window.addEventListener("load", function () {
                loader.style.display = "none";
            });
        </script>
    </body>
</html>
