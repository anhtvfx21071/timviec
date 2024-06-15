<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 3/5/2024
  Time: 9:41 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.io.File" %>
<%@ page import="java.io.FileInputStream" %>
<%@ page import="org.apache.commons.codec.binary.Base64" %>
<%@ page pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<html lang="en">
<head>
    <title>Work CV</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700&display=swap" rel="stylesheet">

    <!-- CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/open-iconic-bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/animate.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/owl.carousel.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/owl.theme.default.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/magnific-popup.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/owl.carousel.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/owl.theme.default.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/aos.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/ionicons.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap-datepicker.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/jquery.timepicker.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/css/bootstrap-reboot.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/css/mixins/_text-hide.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/flaticon.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/icomoon.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap/bootstrap-grid.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap/bootstrap-reboot.css">

    <script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/jquery-migrate-3.0.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/popper.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/jquery.easing.1.3.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/jquery.waypoints.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/jquery.stellar.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/owl.carousel.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/jquery.magnific-popup.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/aos.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/jquery.animateNumber.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/scrollax.min.js"></script>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
    <script src="${pageContext.request.contextPath}/resources/js/google-map.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
    <script src="https://cdn.ckeditor.com/ckeditor5/29.0.0/classic/ckeditor.js"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <style>
        .navbar-nav {
            display: flex;
            justify-content: flex-end;
        }

        .nav-item {
            position: relative;
        }

        .dropdown-menu {
            position: absolute;
            top: 100%;
            left: 0;
            display: none;
            min-width: 10rem;
            padding: 0.5rem 0;
            margin: 0;
            border: 1px solid #ccc;
            border-radius: 0.25rem;
            background-color: #fff;
        }

        .nav-item:hover .dropdown-menu {
            display: block;
        }

        .na {
            margin-left: 10px;
            margin-right: 10px;
        }

        .contai {
            width: 100%;
            padding-left: 10%;
            padding-right: 10%;
        }

        .content {
            width: 80%;
            margin: 0 auto;
            background-color: #f0f0f0;
            padding: 20px;
            box-sizing: border-box;
        }

        .form {
            margin: 20px auto;
            box-shadow: rgba(0, 0, 0, 0.4) 0px 0px 10px;
            overflow: hidden;
        }

        .left {
            float: left;
            width: 40%;
            margin-top: 20px;
            margin-bottom: 20px;
        }

        .right {
            float: right; /* đẩy nội dung sang phải */
            width: 60%; /* chiều rộng của nội dung phải */
        }

        .pdf {
            display: none;
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            z-index: 9999;
            background-color: white;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
            margin-top: 100px;
        }
    </style>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <strong>Work CV</strong>
        <ul class="navbar-nav ml-auto">
            <li class="nav-item active">
                <a class="na" href="${pageContext.request.contextPath}/auth/home">Trang chủ</a>
            </li>
            <li class="nav-item">
                <a class="na" style="color: #78d5ef">Công việc</a>
            </li>
            <security:authorize access="isAuthenticated()">
                <security:authorize access="hasRole('ROLE_ADMIN')">
                    <li class="nav-item">
                        <a class="na" href="${pageContext.request.contextPath}/admin/getListCandidates">Ứng cử viên</a>
                    </li>
                </security:authorize>

                <li class="nav-item dropdownm">
                    <a class="dropdown-toggle na" href="#" id="navbarDropdown" role="button"
                       data-toggle="dropdown"
                       aria-haspopup="true" aria-expanded="false">
                        <security:authentication property="principal.username"/>
                    </a>
                    <div class="dropdown-menu" style="width: 180px">
                        <security:authorize access="hasRole('ROLE_ADMIN')">
                            <a class="dropdown-item" href="${pageContext.request.contextPath}/admin/editProfile">Hồ
                                sơ</a>
                            <a class="dropdown-item" href="${pageContext.request.contextPath}/admin/postList">Danh sách
                                bài đăng</a>
                        </security:authorize>
                        <security:authorize access="hasRole('ROLE_USER')">
                            <a class="dropdown-item" href="${pageContext.request.contextPath}/user/userInformation">Thông
                                tin cá nhân</a>
                            <a class="dropdown-item" href="${pageContext.request.contextPath}/user/applied">Danh sách
                                đăng ký</a>
                            <a class="dropdown-item" href="${pageContext.request.contextPath}/user/listSaveJob">Danh
                                sách đã lưu</a>
                            <a class="dropdown-item" href="${pageContext.request.contextPath}/user/listFollowCompany">D/s
                                công ty theo dõi</a>
                        </security:authorize>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="${pageContext.request.contextPath}/logout">Đăng xuất</a>
                    </div>
                </li>
                <security:authorize access="hasRole('ROLE_USER')">
                    <li class="nav-item" style="width: 50px"></li>
                </security:authorize>
                <security:authorize access="hasRole('ROLE_ADMIN')">
                    <li class="nav-item">
                        <a class="na" style="background-color: #80bdff; border-radius: 10px;"
                           href="${pageContext.request.contextPath}/admin/postJob">Đăng tuyển</a>
                    </li>
                </security:authorize>
            </security:authorize>
            <security:authorize access="!isAuthenticated()">
                <li class="nav-item">
                    <a href="${pageContext.request.contextPath}/auth/login" class="na">Đăng nhập</a>
                </li>
            </security:authorize>
        </ul>
    </div>
</nav>
<!-- END nav -->

<div class="hero-wrap hero-wrap-2"
     style="background-image: url('${pageContext.request.contextPath}/resources/images/bg_1.jpg');"
     data-stellar-background-ratio="0.5">
    <div class="overlay"></div>
    <div class="container">
        <div class="row no-gutters slider-text align-items-end justify-content-start">
            <div class="col-md-12 text-center mb-5">
                <p class="breadcrumbs mb-0"><span class="mr-3"><a href="/">Trang chủ <i
                        class="ion-ios-arrow-forward"></i></a></span>Công việc <span></span></p>
                <h1 class="mb-3 bread">Danh sách ứng cử viên</h1>
            </div>
        </div>
    </div>
</div>

<section class="ftco-section bg-light">
    <div class="contai">
        <div class="content">
            <c:forEach var="applyPost" items="${applyPosts}">
                <div class="form" style="box-shadow: rgba(0, 0, 0, 0.4) 0px 0px 10px;margin: 20px auto;">
                    <div class="left">
                        <% com.example.asm2.entity.ApplyPost applyPost = (com.example.asm2.entity.ApplyPost) pageContext.getAttribute("applyPost");
                            String path = "C:/image/avatar/" + applyPost.getUser().getImage();
                            File file = new File(path);
                            if (file.exists()) {
                                FileInputStream fis = new FileInputStream(file);
                                byte[] imageBytes = new byte[(int) file.length()];
                                fis.read(imageBytes);
                                fis.close();
                                String avatar = Base64.encodeBase64String(imageBytes);%>
                        <img style="border-radius: 10px;width: 150px; height: 200px"
                             src="data:image/jpg;base64,<%= avatar %>" class="img-fluid" alt="Company Avatar">
                        <% } %>
                    </div>
                    <div class="right">
                        <H5 class="location mb-0"><strong>${applyPost.user.fullName}</strong></H5>
                        <p>Địa chỉ: ${applyPost.user.address}</p>
                        <p>Email: ${applyPost.user.email}</p>
                        <p>Mô tả: ${applyPost.text}</p>
                        <p>Vị trí ứng tuyển: ${applyPost.recruitment.title}</p>
                        <p>Xem cv: <a href="#" id="viewCvLink_${applyPost.id}" class="btn btn-primary"
                        >${applyPost.nameCv}</a></p>
                    </div>
                    <%
                        com.example.asm2.entity.ApplyPost applyPost1 = (com.example.asm2.entity.ApplyPost) pageContext.getAttribute("applyPost");
                        String path1 = "C:/image/fileCV/" + applyPost1.getNameCv();
                        File file1 = new File(path1);
                        if (file1.exists()) {
                            FileInputStream fis1 = new FileInputStream(file1);
                            byte[] imageBytes = new byte[(int) file1.length()];
                            fis1.read(imageBytes);
                            fis1.close();
                            String fileCv = Base64.encodeBase64String(imageBytes);
                    %>

                    <div id="pdf-container_${applyPost.id}" class="pdf">
                        <embed src="data:application/pdf;base64,<%=fileCv%>" type="application/pdf" width="1000px"
                               height="900px">
                    </div>
                    <% } %>
                </div>
            </c:forEach>
            <div style="text-align: center">
                <c:if test="${applyPosts.size() == 0 || applyPosts.size() == null}">
                    <p style="color: red">Không có kết quả nào</p>
                </c:if>
            </div>
        </div>
    </div>
</section>
<script>
    function handleViewCv(id) {
        var viewCvLink = document.getElementById('viewCvLink_' + id);
        var pdfContainer = document.getElementById('pdf-container_' + id);
        var isOpened = false;

        function openPdfContainer() {
            pdfContainer.style.display = 'block';
            document.body.style.overflow = 'hidden';
            isOpened = true;
            document.addEventListener('click', closeOnClickOutside);
        }

        function closePdfContainer() {
            pdfContainer.style.display = 'none';
            document.body.style.overflow = '';
            isOpened = false;
            document.removeEventListener('click', closeOnClickOutside);
        }

        function closeOnClickOutside(event) {
            if (!pdfContainer.contains(event.target) && event.target !== viewCvLink) {
                closePdfContainer();
            }
        }

        viewCvLink.addEventListener('click', function (event) {
            event.preventDefault();
            if (!isOpened) {
                openPdfContainer();
            } else {
                closePdfContainer();
            }
        });
        document.addEventListener('click', function (event) {
            if (isOpened && event.target !== viewCvLink) {
                closePdfContainer();
            }
        });
    }

    <c:forEach var="applyPost" items="${applyPosts}">
    handleViewCv(${applyPost.id});
    </c:forEach>
</script>
<footer th:replace="public/fragments :: footer" class="ftco-footer ftco-bg-dark ftco-section">

</footer>

</body>
</html>
