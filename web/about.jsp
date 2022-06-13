<%-- 
    Document   : about
    Created on : Jun 8, 2022, 10:37:43 PM
    Author     : Tranduc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/style.css"  />
        <link rel="stylesheet" href="css/about.css"  />
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
        <nav class="navbar navbar-dark navbar-expand-md fixed-top">
            <div class="container">
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#Navbar">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <a class="navbar-brand mr-auto" href="JobListController"><img src="img/logo.png" height="30" width="41"></a>
                <div class="collapse navbar-collapse" id="Navbar">
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <a class="nav-link" href="JobListController">
                                <span class="fa fa-home fa-lg"></span>
                                Home
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="jobs.jsp">
                                <span class="fa fa-briefcase fa-lg"></span>
                                Jobs
                            </a>
                        </li>
                        <li class="nav-item active">
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
        <h1>Hello World!</h1>
        <div class="row justify-content-center mt-5">
            <div class="col-12 col-md-8">
                <h1 class="display-4" style="top:100px">
                    TRƯỜNG ĐẠI HỌC FPT
                </h1>
                <div class="row align-items-center border-top border-bottom mb-4">

                </div>
                <div class="ck-content text-justify col-md-8">
                    <p>Trường Đại học FPT chính thức thành lập ngày 08/09/2006 theo quyết định số 208/2006/QĐ-TTg của Thủ tướng Chính phủ. Thời điểm đó, Đại học FPT là trường đại học đầu tiên của Việt Nam do một doanh nghiệp thành lập với 100% vốn đầu tư từ Công ty Cổ phần FPT - tập đoàn tiên phong trong lĩnh vực Công nghệ thông tin của Việt Nam.</p>
                    <figure class="image"><img src="img/fpt-star.png"><figcaption>Trụ sở chính Đại học FPT tại Hà Nội</figcaption></figure>
                    <p>Sứ mệnh của trường Đại học FPT là xây dựng mô hình của một trường Đại học thế hệ mới, có triết lý giáo dục hiện đại, gắn liền đào tạo với thực tiễn cuộc sống và nhu cầu nhân lực của đất nước, góp phần đưa giáo dục Việt nam lên ngang tầm các nước tiên tiến trên thế giới. Sự khác biệt trong phương pháp đào tạo của trường Đại học FPT là gắn kết chặt chẽ với các doanh nghiệp, đào tạo theo chương trình chuẩn công nghệ quốc tế, sinh viên thành thạo hai ngoại ngữ, được rèn luyện kỹ năng mềm, được chú trọng phát triển con người toàn diện, hài hòa.</p>
                    <figure class="image"><img src="img/fpt-total.jpg"><figcaption>Phân hiệu Đại học FPT tại TP. Hồ Chí Minh</figcaption></figure>
                    <p><br>Sau hơn 10 năm thành lập, trường Đại học FPT từ vai trò tiên phong đổi mới giáo dục đại học trong nước đã bước sang vai trò trường đại học đi đầu trong phong trào quốc tế hóa. Năm 2012, Đại học FPT là trường đại học Việt Nam đầu tiên đạt chứng nhận chuẩn 3 sao của Tổ chức Giáo dục Quốc tế QS (Quaccquarelli Symonds) - một trong các chuẩn xếp hạng hàng đầu dành cho các trường đại học trên toàn thế giới. Năm 2015 trường tái kiểm định đạt mức điểm 3,5 trong đó có 4 hạng mục được đánh giá tuyệt đối 5 sao là Giảng dạy, Việc làm, Cơ sở vật chất, Trách nhiệm xã hội và Hoạt động cộng đồng.<br><br>Hiện nay, trường Đại học FPT đã triển khai đào tạo tại 4 phân hiệu thuộc 4 vùng kinh tế trọng điểm: Hà Nội, Đà Nẵng, TP. Hồ Chí Minh và Cần Thơ với hơn 20.000 sinh viên theo học.</p>
                    <figure class="image"><img src="img/fpt-hcm.jpg"><figcaption>Phân hiệu Đại học FPT tại TP. Hồ Chí Minh</figcaption></figure>
                </div>
            </div>
            <div class="col-12 col-md-4 d-none d-md-block">
                <div class="sticky-container">
                    <img src="img/hiring.jpg" style="height: 800px; width:400px; "/>
                


                </div>
            </div>
        </div>



        <footer>
            <%@include file="footer.jsp" %>
        </footer>
    </body>
</html>
