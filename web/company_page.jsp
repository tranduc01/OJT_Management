<%-- 
    Document   : company_page
    Created on : Jun 13, 2022, 11:37:44 PM
    Author     : Tranduc
--%>

<%@page import="sample.company.CompanyDTO"%>
<%@page import="sample.account.AccountDTO"%>
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
        <title>FPT OJT</title>
    </head>
    <body>
        <% AccountDTO acc = (AccountDTO) session.getAttribute("acc");
            CompanyDTO com = (CompanyDTO) session.getAttribute("company");
            session.setAttribute("comID", com.getComID());
        %>
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


        <div class="container mt-3 mb-4" style="padding-top: 50px;">
            <div class="col-lg-12 mt-4 mt-lg-0">
                <div class="row">
                    <div class="col-md-12">

                        <button type="button" class="btn btn-info" data-toggle="modal" data-target="#myModalAdd" style="margin-top: 20px; float: right;">Add Job</button>
                        <!-- Modal -->
                        <form  action="AddJobCompanyController" method="POST">
                            <div id="myModalAdd" class="modal fade" role="dialog">
                                <div class="modal-dialog modal-lg">
                                    <!-- Modal content-->
                                    <div class="modal-content">
                                        <div class="modal-header">                           
                                            <h4 class="modal-title">Post a Job</h4>
                                        </div>
                                        <div class="modal-body">

                                            <div class="form-group">
                                                <label class="col-sm-2 control-label">Name</label>
                                                <div class="col-sm-12">
                                                    <input class="form-control" name="jobName" type="text" required="">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-sm-4 control-label">Title</label>
                                                <div class="col-sm-12">
                                                    <input class="form-control" name="jobTitle" type="text" value="Intern" readonly="">
                                                </div>
                                            </div>
                                            <div class="row gx-3 mb-3">
                                                <!-- Form Group (Job Name)-->                                            
                                                <!-- Form Group (Job Salary)-->
                                                <div class="col-md-6">
                                                    <label class="small mb-1" for="inputLocation">Amount</label>
                                                    <input class="form-control" id="inputLocation" type="text" placeholder="Amount" name="Amount">
                                                </div>
                                                <div class="col-md-6">
                                                    <label class="small mb-1" for="inputLocation">Job Salary</label>
                                                    <input class="form-control" id="inputLocation" type="text" placeholder="Job Salary" name="jobSalary">
                                                </div>
                                            </div>                   
                                            <div class="mb-3">
                                                <label class="small mb-1" for="inputOrgName">Description</label>
                                                <textarea class="form-control" type="text" id="feedback" rows="5" name="jobDescription"></textarea>
                                            </div>     
                                            <!-- Form Group (Job Requirement)-->
                                            <div class="mb-3">
                                                <label class="small mb-1" for="inputEmailAddress">Job Requirement</label>
                                                <input class="form-control" id="inputEmailAddress" type="text" placeholder="Job Requirement" name="jobRequirement">
                                            </div>
                                            <!-- Form Group (Job Benefits)-->
                                            <div class="mb-3">
                                                <label class="small mb-1" for="inputEmailAddress">Job Benefits</label>
                                                <input class="form-control" id="inputEmailAddress" type="text" placeholder="Job Benefits" name="jobBenefits">
                                            </div>
                                            <!-- Form Row-->
                                            <div class="row gx-3 mb-3">
                                                <!-- Form Group (create number)-->
                                                <div class="col-md-6">
                                                    <label class="small mb-1" for="inputPhone">Create Date</label>
                                                    <input class="form-control" type="date" name="CreateDate">
                                                </div>
                                                <!-- Form Group (end date)-->
                                                <div class="col-md-6">
                                                    <label class="small mb-1" for="inputBirthday">End Date</label>
                                                    <input class="form-control"  type="date" name="EndDate">
                                                </div>                               
                                            </div>                                                                      
                                            <div class="form-group">
                                                <label class="col-sm-2 control-label" >Major</label>
                                                <div class="col-sm-12">
                                                    <select name="Major" class="form-control">
                                                        <c:forEach var="major" items="${requestScope.majorList}">
                                                            <option value="${major.getMajorID()}">${major.getMajorName()}</option>
                                                        </c:forEach>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-sm-2 control-label">Semester</label>
                                                <div class="col-sm-12">
                                                    <input class="form-control" type="text" name="txtsemester" value="SU2022">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                            <button type="submit" class="btn btn-primary">Post</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form>

                        <div class="user-dashboard-info-box table-responsive mb-0 bg-white p-4 shadow-sm">
                            <table class="table manage-candidates-top mb-0">
                                <thead>
                                    <tr>
                                        <th>Post</th>
                                        <th class="text-center">Create Date</th>
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
                                                            <td class="candidate-list-favourite-time text-center">
                                                                <c:if test="${job.getStatus() eq 2}"><h5><span class="badge badge-danger">Rejected</span></h5></c:if>
                                                                <c:if test="${job.getStatus() eq 0}"><h5><span class="badge badge-warning">Pending</span></h5></c:if>
                                                                <c:if test="${job.getStatus() eq 1}"><h5><span class="badge badge-success">Approved</span></h5></c:if>
                                                                </td>
                                                                <td>                                                                                                         
                                                                    <h4><a href="mainController?action=CompanyPostDetail&id=${job.getJobID()}" class="text-primary" data-toggle="tooltip" title="" data-original-title="view" style="padding-left: 16px;"><i class="far fa-eye"></i></a></h4>                                                                                                                                                                             
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
    </body>
</html>
