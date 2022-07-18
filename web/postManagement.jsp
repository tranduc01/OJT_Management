<%-- 
    Document   : postManagement
    Created on : Jul 18, 2022, 1:20:05 PM
    Author     : Tranduc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="css/postcss.css"  />
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
                <a class="navbar-brand mr-auto" href="JobListByPageController"><img src="img/logo.png" height="30" width="41"></a>
                <div class="collapse navbar-collapse" id="Navbar">
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <a class="nav-link active" href="JobListController">
                                <span class="fa-solid fa-users"></span>
                                Home
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="AdminStudentController">
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
        <div class="container mt-3 mb-4">
            <div class="col-lg-9 mt-4 mt-lg-0">
                <div class="row">
                    <div class="col-md-12">
                        <div class="user-dashboard-info-box table-responsive mb-0 bg-white p-4 shadow-sm">
                            <table class="table manage-candidates-top mb-0">
                                <thead>
                                    <tr>
                                        <th>Post</th>
                                        <th class="text-center">Status</th>
                                        <th class="action text-right">Action</th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="job" items="${requestScope.jobList}">
                                        <c:forEach var="com" items="${requestScope.companyList}">
                                            <c:forEach var="acc" items="${requestScope.accList}">
                                                <c:if test="${job.getComID() eq com.getComID()}">
                                                    <c:if test="${com.getAccID() eq acc.getAccId()}">
                                                        <tr class="candidates-list">
                                                            <td class="title">
                                                                <div class="thumb">
                                                                    <img class="img-fluid" src="${acc.getAvatar()}" >
                                                                </div>
                                                                <div class="candidate-list-details">
                                                                    <div class="candidate-list-info">
                                                                        <div class="candidate-list-title">
                                                                            <h5 class="mb-0"><a href="#">Brooke Kelly</a></h5>
                                                                        </div>
                                                                        <div class="candidate-list-option">
                                                                            <ul class="list-unstyled">
                                                                                <li><i class="fas fa-filter pr-1"></i>Information Technology</li>
                                                                                <li><i class="fas fa-map-marker-alt pr-1"></i>Rolling Meadows, IL 60008</li>
                                                                            </ul>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </td>
                                                            <td class="candidate-list-favourite-time text-center">
                                                                <a class="candidate-list-favourite order-2 text-danger" href="#"><i class="fas fa-heart"></i></a>
                                                                <span class="candidate-list-time order-1">Shortlisted</span>
                                                            </td>
                                                            <td>
                                                                <ul class="list-unstyled mb-0 d-flex justify-content-end">
                                                                    <li><a href="#" class="text-primary" data-toggle="tooltip" title="" data-original-title="view"><i class="far fa-eye"></i></a></li>
                                                                    <li><a href="#" class="text-info" data-toggle="tooltip" title="" data-original-title="Edit"><i class="fas fa-pencil-alt"></i></a></li>                                            
                                                                </ul>
                                                            </td>
                                                            <td></td>
                                                        </tr> 
                                                    </c:if>
                                                </c:if>
                                            </c:forEach>
                                        </c:forEach>
                                    </c:forEach>
                                </tbody>
                            </table>
                            <div class="text-center mt-3 mt-sm-3">
                                <ul class="pagination justify-content-center mb-0">
                                    <li class="page-item disabled"> <span class="page-link">Prev</span> </li>
                                    <li class="page-item active" aria-current="page"><span class="page-link">1 </span> <span class="sr-only">(current)</span></li>
                                    <li class="page-item"><a class="page-link" href="#">2</a></li>
                                    <li class="page-item"><a class="page-link" href="#">3</a></li>
                                    <li class="page-item"><a class="page-link" href="#">...</a></li>
                                    <li class="page-item"><a class="page-link" href="#">25</a></li>
                                    <li class="page-item"> <a class="page-link" href="#">Next</a> </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script>
            var loader = document.getElementById("preloader");
            window.addEventListener("load", function () {
                loader.style.display = "none";
            });
        </script>
    </body>
</html>
