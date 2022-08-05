<%-- 
    Document   : companyPostByFilter
    Created on : Aug 5, 2022, 4:07:08 PM
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
        <nav class="navbar navbar-dark navbar-expand-md fixed-top">
            <div class="container">
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#Navbar">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <a class="navbar-brand mr-auto" href="JobListByPageController"><img src="img/logo.png" height="30" width="41"></a>
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
                            <a class="nav-link" href="ResultListController">
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
                                <a class="dropdown-item" href="securityCompany.jsp">
                                    <span class="fa fa-user-lock" style="color: #f27229;"></span> Security</a>
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

        <% if (request.getAttribute("success") != null) {
        %>
        <script>
            alert("Post Rejected !!!");
        </script>
        <%
            }%>

        <% if (request.getAttribute("ok") != null) {
        %>
        <script>
            alert("Post Approved !!!");
        </script>
        <%
            }%>


        <%
            if (request.getAttribute("jobList") != null) {
        %>
        <div class="container mt-3 mb-4">
            <div class="col-lg-12 mt-4 mt-lg-0">
                <div class="row">
                    <div class="col-md-12">
                        <div class="user-dashboard-info-box table-responsive mb-0 bg-white p-4 shadow-sm">
                            <div class="dropdown" style="float: right; margin-top: 40px;padding-right: 10px;">
                            <a class="dropdown-toggle btn btn-info"  data-toggle="dropdown">Status
                                <span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <a href="CompanyHomePageController"><li class="dropdown-item badge badge-brand">All</li></a>
                                <a href="mainController?action=postfilter&status=1"><li class="dropdown-item badge badge-success">Approved</li></a>
                                <a href="mainController?action=postfilter&status=0"><li class="dropdown-item badge badge-warning">Pending</li></a>
                                <a href="mainController?action=postfilter&status=2"><li class="dropdown-item badge badge-danger">Rejected</li></a>
                                <a href="mainController?action=postfilter&status=3"><li class="dropdown-item badge badge-secondary">Expired</li></a>
                            </ul>
                        </div>
                            <table class="table manage-candidates-top mb-0">
                                <thead>
                                    <tr>
                                        <th>Post</th>
                                        <th class="text-center">Create Date</th>
                                        <th class="text-center">Modify Date</th>
                                        <th class="text-center">Status</th>                              
                                        <th class="action text-right">Action</th>
                                        
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
                                                                    <img class="img-fluid" src="${acc.getAvatar()}">
                                                                </div>
                                                                <div class="candidate-list-details">
                                                                    <div class="candidate-list-info">
                                                                        <div class="candidate-list-title">
                                                                            <h5 class="mb-0" style="color: #0b7dda">${acc.getName()}</h5>
                                                                        </div>
                                                                        <div class="candidate-list-option">
                                                                            <ul class="list-unstyled">
                                                                                <li><i class="fas fa-filter pr-1"></i>${job.getJobTitle()}</li>
                                                                                <li><i class="fas fa-map-marker-alt pr-1"></i>${com.getComAddress()}</li>
                                                                            </ul>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </td>
                                                            <td class="candidate-list-favourite-time text-center">${job.getJobCreateDate()}</td>
                                                            <td class="candidate-list-favourite-time text-center">${job.getModifyDate()}</td>
                                                            <td class="candidate-list-favourite-time text-center">
                                                                <c:if test="${job.getStatus() eq 2}"><h5><span class="badge badge-danger">Rejected</span></h5></c:if>
                                                                <c:if test="${job.getStatus() eq 0}"><h5><span class="badge badge-warning">Pending</span></h5></c:if>
                                                                <c:if test="${job.getStatus() eq 1}"><h5><span class="badge badge-success">Approved</span></h5></c:if>
                                                                <c:if test="${job.getStatus() eq 3}"><h5><span class="badge badge-secondary">Expired</span></h5></c:if>
                                                                </td>
                                                                <td>                                                                                                         
                                                                    <h5><a href="mainController?action=PostDetail&id=${job.getJobID()}" class="text-primary" data-toggle="tooltip" title="" data-original-title="view" style="padding-left: 16px;"><i class="far fa-eye"></i></a>   
                                                                    <c:if test="${job.getStatus() eq 1}"><a href="#" class="text-primary" data-toggle="tooltip" title="" data-original-title="view" style="padding-left: 16px;" onclick="return remove();"><i class="far fa-trash-alt"></i></a></c:if></h5>
                                                                </td>
                                                                <td>
                                                                <c:if test="${job.getStatus()==0}">
                                                                    <h4><a href="mainController?action=Approve&jobid=${job.getJobID()}"><button class="badge badge-success"><i class="fa-solid fa-check"></i></button></a>
                                                                        <a href="mainController?action=Reject&jobid=${job.getJobID()}"><button class="badge badge-danger" onclick="return check();"><i class="fa-solid fa-ban"></i></button></a></h4>
                                                                            </c:if>
                                                                            <c:if test="${job.getStatus()!=0}">
                                                                    <h4></h4>
                                                                </c:if>                                                 
                                                            </td>
                                                        </tr> 
                                                    </c:if>
                                                </c:if>
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
        <%            } else {
                response.sendRedirect("JobsPostController");
            }
        %>
        <script>
            var loader = document.getElementById("preloader");
            window.addEventListener("load", function () {
                loader.style.display = "none";
            });
        </script>
        <script>
            function check() {
                if (confirm("Are you sure to reject this post?") === false) {
                    return false;
                } else {
                    return true;
                }
            }
        </script>
        <script>
            function remove() {
                if (confirm("Are you sure to take down this post?") === false) {
                    return false;
                } else {
                    return true;
                }
            }
        </script>
    </body>
</html>
