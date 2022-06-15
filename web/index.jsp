<%-- 
    Document   : index
    Created on : Jun 6, 2022, 9:59:41 AM
    Author     : Tranduc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
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
        <link rel="stylesheet" href="https://unpkg.com/swiper@8/swiper-bundle.min.css"/>
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
                %> 

                <span class="navbar-text ml-auto">
                    <a  href="student_profile.jsp">
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



        <div id="demo" class="carousel slide" data-ride="carousel">

            <!-- Indicators -->
            <ul class="carousel-indicators">
                <li data-target="#demo" data-slide-to="0" class="active"></li>
                <li data-target="#demo" data-slide-to="1"></li>
                <li data-target="#demo" data-slide-to="2"></li>
            </ul>

            <!-- The slideshow -->
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img style="width: 1550px; height: 500px;" src="img/slide-1.jpg">
                </div>
                <div class="carousel-item">
                    <img style="width: 1550px; height: 500px;" src="img/slide-2.jpg">
                </div>
                <div class="carousel-item">
                    <img style="width: 1550px; height: 500px;" src="img/slider-3.jpg">
                </div>
            </div>
            <script>
                $(document).ready(function () {
                    $(".carousel-inner").carousel({interval: 2000});
                });
            </script>
            <!-- Left and right controls -->
            <a class="carousel-control-prev" href="#demo" data-slide="prev">
                <span class="carousel-control-prev-icon"></span>
            </a>
            <a class="carousel-control-next" href="#demo" data-slide="next">
                <span class="carousel-control-next-icon"></span>
            </a>

        </div>

        <div class="jumbotron">

            <!--<div>
                <form action="">
                    <input type="search" placeholder="Search here ...">
                    <i class="fa fa-search"></i>
                </form>
            </div>-->


            <h3 style="padding-top: 50px;">Hot Deals</h3>
            <div class="row">
                <c:forEach var="job" items="${requestScope.jobList}">
                    <c:forEach var="com" items="${requestScope.companyList}">
                        <c:forEach var="acc" items="${requestScope.accList}">
                            <c:if test="${job.getComID() eq com.getComID()}">
                                <c:if test="${com.getAccID() eq acc.getAccId()}">
                                    <div class="col-sm-6 col-md-3">
                                        <div class="card " style="width:300px">
                                            <input type="hidden" name="jobid" value="${job.getJobID()}">
                                            <img class="card-img-top" src="${acc.getAvatar()}" alt="Card image" style="width:298px; height: 250px;">
                                            <div class="card-body">
                                                <h4 class="card-title">${job.getJobName()}</h4>
                                                <p>${job.getJobCreateDate()} - Remain: 2 days</p> 
                                                <p><i class="fas fa-map-marker-alt"></i> ${com.getComAddress()}</p>
                                                <a href="mainController?action=jobDetails&jobid=${job.getJobID()}" class="btn btn-primary btn-block">Detail</a>
                                            </div>
                                        </div>
                                    </div>   
                                </c:if>
                            </c:if>
                        </c:forEach>
                    </c:forEach>
                </c:forEach>
            </div>
            <!-- Swiper -->
            <div class="container">
                <div class="swiper card_slider">
                    <!-- Additional required wrapper -->
                    <div class="swiper-wrapper">
                        <!-- Slides -->
                        <c:forEach var="com" items="${requestScope.companyList}">
                            <c:forEach var="acc" items="${requestScope.accList}">
                                <c:if test="${com.getAccID() eq acc.getAccId()}">
                                    <div class="swiper-slide">              
                                        <a href="mainController?action=companyDetails&comID=${com.getComID()}"><img style="width:100% ;" src="${acc.getAvatar()}"></a>            
                                    </div>
                                </c:if>
                            </c:forEach>
                        </c:forEach>
                    </div>



                    <!-- If we need navigation buttons -->
                    <div class="swiper-button-prev"></div>
                    <div class="swiper-button-next"></div>


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
                    var loader = document.getElementById("preloader");
                    window.addEventListener("load", function () {
                        loader.style.display = "none";
                    });
        </script>
        <script src="https://unpkg.com/swiper@8/swiper-bundle.min.js"></script>
        <script type="text/javascript">
                    var swiper = new Swiper(".card_slider", {
                        spaceBetween: 30,
                        loop: true,
                        speed: 1000,
                        autoplay: {
                            delay: 2000,
                        },
                        pagination: {
                            el: ".swiper-pagination",
                            clickable: true,
                        },
                        navigation: {
                            nextEl: ".swiper-button-next",
                            prevEl: ".swiper-button-prev"
                        },
                        breakpoints: {
                            1200: {
                                slidesPerView: 4,
                            },
                            768: {
                                slidesPerView: 3,
                            },
                            480: {
                                slidesPerView: 2,
                            },
                            320: {
                                slidesPerView: 1,
                            },
                        },
                    });
        </script>

    </body>

</html>
