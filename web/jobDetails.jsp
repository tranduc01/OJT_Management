<%-- 
    Document   : jobDetails
    Created on : Jun 7, 2022, 1:46:35 PM
    Author     : Tranduc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">  
        <link rel="stylesheet" href="css/style.css"  />
        <link rel="stylesheet" href="css/jobDetails.css"  />
        <link rel="stylesheet" href="assets/css/owl.carousel.min.css">
        <link rel="stylesheet" href="assets/css/flaticon.css">
        <link rel="stylesheet" href="assets/css/slicknav.css">
        <link rel="stylesheet" href="assets/css/price_rangs.css">
        <link rel="stylesheet" href="assets/css/animate.min.css">
        <link rel="stylesheet" href="assets/css/magnific-popup.css">
        <link rel="stylesheet" href="assets/css/themify-icons.css">
        <link rel="stylesheet" href="assets/css/slick.css">
        <link rel="stylesheet" href="assets/css/nice-select.css">
        <link rel="stylesheet" href="assets/css/style.css">
        <link rel="manifest" href="site.webmanifest">
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

        <title>FPT OJT</title>
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
                            <a class="nav-link" href="JobListController">
                                <span class="fa fa-home fa-lg"></span>
                                Home
                            </a>
                        </li>
                        <li class="nav-item">
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
        <c:set var="job" value="${requestScope.job}"/>
        <c:set var="com" value="${requestScope.com}"/>
        <c:set var="acc" value="${requestScope.acc}"/>
        <c:set var="stuAcc" value="${sessionScope.acc}"/>
        
        <!-- job post company Start -->
        <div class="job-post-company pt-120 pb-120">
            <div class="container">
                <div class="row justify-content-between">
                    <!-- Left Content -->
                    <div class="surround col-xl-7 col-lg-8">
                        <!-- job single -->
                        <div class="single-job-items mb-50">
                            <div class="job-items">
                                <div class="company-img company-img-details">
                                    <a href="#"><img src="${acc.getAvatar()}" style="height: 70px; width: 70px;"></a>
                                </div>
                                <div class="job-tittle">

                                    <h4 style="font-weight: bold;">${job.getJobName()}</h4>

                                    <ul>
                                        <li>${job.getJobTitle()}</li>                                       
                                        <li>$${job.getJobSalary()}</li>

                                    </ul>
                                    <i class="fas fa-map-marker-alt"></i> ${com.getComAddress()}
                                </div>
                            </div>
                        </div>
                        <!-- job single End -->

                        <div class="job-post-details">
                            <div class="post-details1 mb-50">
                                <!-- Small Section Tittle -->
                                <div class="small-section-tittle">
                                    <h4 style="font-weight: bold;">Job Description</h4>
                                </div>
                                <div class="long-text"><pre>${job.getJobDescription()}</pre></div>
                            </div>
                            <div class="post-details2  mb-50">
                                <!-- Small Section Tittle -->
                                <div class="small-section-tittle">
                                    <h4 style="font-weight: bold;">Requirements</h4>
                                </div>
                                <pre>${job.getJobRequirement()}</pre>
                            </div>
                            <div class="post-details2  mb-50">
                                <!-- Small Section Tittle -->
                                <div class="small-section-tittle">
                                    <h4 style="font-weight: bold;">Benefits</h4>
                                </div>
                                <pre>${job.getJobBenefits()}</pre>
                            </div>
                        </div>

                    </div>
                    <!-- Right Content -->
                    <div class="col-xl-4 col-lg-4">
                        <div class="post-details3  mb-50">
                            <!-- Small Section Tittle -->
                            <div class="small-section-tittle">
                                <h4 style="font-weight: bold;">Job Overview</h4>
                            </div>
                            <ul>
                                <li>Posted date : <span>${job.getJobCreateDate()}</span></li>

                                <li>Amount : <span>${job.getAmount()}</span></li>

                                <li>Salary :  <span>$${job.getJobSalary()}</span></li>
                                <li>End date : <span>${job.getJobEndDate()}</span></li>
                            </ul>
                            <div class="apply-btn2">
                                <div class="line"></div>
                               
                                <c:if test="${requestScope.availabe == null}">
                                    <a type="button" class="btn" data-toggle="modal" data-target="#exampleModal" <c:if test="${sessionScope.acc eq null}">onclick="warning()"</c:if>>
                                        Apply Now
                                    </a>
                                </c:if>
                                <c:if test="${requestScope.availabe !=null}">
                                    <a type="button" class="btn">
                                        Applied
                                    </a>
                                </c:if>
                                        
                                        
                                </div>
                            </div>
                            <div class="post-details4  mb-50">
                                <!-- Small Section Tittle -->
                                <div class="small-section-tittle">
                                    <h4>Company Information</h4>
                                </div>
                                <span>${acc.getName()}</span>


                            <img src="${acc.getAvatar()}" style="height: 225px; width: 225px;"></br>
                            Website:<a href="${com.getWebsite()}"> ${com.getWebsite()}</a>


                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- job post company End -->

        <!-- Modal -->
        <form action="mainController" method="post">
            <input type="hidden" name="jobID" value="${job.getJobID()}">
            
                <c:set var="stu" value="${requestScope.stu}"/>
            <input type="hidden" name="stuID" value="${stu.getStudentID()}">           
            

            <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel" style="font-weight: bold;">Application</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <c:if test="${stuAcc.getCvPath() != null}">
                                Your CV: <a href="${stuAcc.getCvPath()}">View</a>
                            </c:if>
                            <c:if test="${stuAcc.getCvPath() == null}">
                                <p>Please Upload your CV first !!!</p>
                            </c:if>


                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn" data-dismiss="modal" style="font-weight: bold;">Close</button>
                            <c:if test="${stuAcc.getCvPath() != null}">
                                <button type="submit" class="btn" style="font-weight: bold;" value="InsertApplication" name="action">Apply</button>
                            </c:if>
                        </div>
                    </div>
                </div>
            </div>
        </form>


        <footer>
            <%@include file="footer.jsp" %>
        </footer>
        <script>
            var loader = document.getElementById("preloader");
            window.addEventListener("load", function () {
                loader.style.display = "none";
            });
        </script>
        <script>
            function warning() {
                window.alert("You need to login first !!!");
                window.location.href = "login.jsp";
            }
        </script>
    </body>
</html>
