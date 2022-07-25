<%-- 
    Document   : companyDetails
    Created on : Jun 15, 2022, 10:08:34 AM
    Author     : Tranduc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/comDetails.css" rel="stylesheet" />
        <link rel="stylesheet" href="css/style.css"  />
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">

        <!-- jQuery library -->
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>

        <!-- Popper JS -->
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

        <!-- Latest compiled JavaScript -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/material-design-iconic-font/2.2.0/css/material-design-iconic-font.min.css" integrity="sha256-3sPp8BkKUE7QyPSl6VfBByBroQbKxKG7tsusY2mhbVY=" crossorigin="anonymous" />
        <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css'>
        <script src="https://kit.fontawesome.com/12c372e324.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://unpkg.com/swiper@8/swiper-bundle.min.css"/>
        <link rel="shortcut icon" href="img/FPT-logoo.jpg">
        <title>Company Details</title>
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
                        <li class="nav-item active">
                            <a class="nav-link" href="JobListByPageController">
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

        <c:set var="com" value="${requestScope.com}"/>       
        <c:set var="acc" value="${requestScope.acc}"/>    

        <!-- Page header with logo and tagline-->
        <header class="py-5 bg-light border-bottom mb-4">
            <div class="container">
                <div class="text-center my-5">
                    <h1 class="fw-bolder">Welcome to ${acc.getName()}!</h1>
                </div>
            </div>
        </header>
        <!-- Page content-->
        <div class="container">
            <div class="row">
                <!-- Blog entries-->
                <div class="col-lg-7">
                    <!-- Featured blog post-->
                    <div class="card1 mb-4">
                        <img class="card1-img-top" src="${com.getBannerImage()}" />
                        <div class="card1-body">

                            <h2 class="card1-title">About Us</h2>
                            <pre class="card1-text">${com.getComDescription()}</pre>

                        </div>
                    </div>
                    <!-- Nested row for non-featured blog posts-->

                </div>
                <!-- Side widgets-->
                <div class="col-lg-5" >                   
                    <div class="card1 mb-4">
                        <div class="card1-header" style="text-align: center; font-weight: bold;">Contact</div>
                        <div class="card1-body"><span class="fa fa-phone"> :${acc.getPhone()}</span></div>
                        <div class="card1-body"><span class="fa fa-envelope"> :${acc.getEmail()}</span></div>
                        <div class="card1-body"><span class="fa-solid fa-globe">:<a href="${com.getWebsite()}"> ${com.getWebsite()}</a></span></div>
                    </div>
                </div>
            </div>
            <!-- Swiper -->
            <div class="container" style="padding-bottom: 70px;">
                <div class="swiper card_slider" >
                    <!-- Additional required wrapper -->
                    <div class="swiper-wrapper">
                        <!-- Slides -->

                        <c:forEach var="jobList" items="${requestScope.jobList}">
                            <div class="swiper-slide" style="padding: 30px 10px 30px 10px; width: 150px;">  
                            <div class="card1 mb-4" >
                                <img class="card1-img-top" src="${acc.getAvatar()}"/>
                                <div class="card1-body" style="text-align: center;">                                   
                                    <h2 class="card1-title h4">${jobList.getJobName()}</h2>                                   
                                    <a class="btn btn-primary" href="mainController?action=jobDetails&jobid=${jobList.getJobID()}">View →</a>
                                </div>
                            </div>   
                             </div>

                        </c:forEach>

                    </div>



                    <!-- If we need navigation buttons -->
                    <div class="swiper-button-prev"></div>
                    <div class="swiper-button-next"></div>


                </div>
            </div>
        </div>

        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
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
        <footer>
            <%@include file="footer.jsp" %>
        </footer>   
    </body>
</html>
