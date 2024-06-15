<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 3/5/2024
  Time: 9:39 PM
  To change this template use File | Settings | File Templates.
--%>
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
            justify-content: flex-end; /* căn phải */
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
                        class="ion-ios-arrow-forward"></i></a></span>Công ty <span></span></p>
                <h1 class="mb-3 bread">Danh sách công ty đã theo dõi</h1>
            </div>
        </div>
    </div>
</div>

<section class="ftco-section bg-light">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 pr-lg-5">
                <div class="row">
                    <c:forEach var="followCompany" items="${followComanies}">
                        <div class="col-md-12 ">
                            <div class="job-post-item p-4 d-block d-lg-flex align-items-center">
                                <div class="one-third mb-4 mb-md-0">
                                    <div class="job-post-item-header align-items-center">
                                        <h2 class="mr-3 text-black">
                                            <strong>${followCompany.companyFollow.nameCompany}</strong></h2>
                                    </div>
                                    <div class="job-post-item-body d-block d-md-flex">
                                        <div class="mr-3"><span
                                                class="icon-layers"></span>${followCompany.companyFollow.email}</div>
                                        <div class="mr-3"><span
                                                class="icon-my_location"></span>${followCompany.companyFollow.address}
                                        </div>
                                        <div style="margin-left: 10px"><span
                                                class="icon-my_location"></span> ${followCompany.companyFollow.phoneNumber}
                                        </div>
                                    </div>
                                </div>
                                <div class="one-forth ml-auto d-flex align-items-center mt-4 md-md-0"
                                     style="width:370px !important;">
                                    <div>
                                        <a onclick="follow(${followCompany.companyFollow.id})"
                                           class="icon text-center d-flex justify-content-center align-items-center icon mr-2">
                                            <span class="icon-delete"></span>
                                        </a>
                                    </div>
                                    <a href="${pageContext.request.contextPath}/auth/company?idCompany=${followCompany.companyFollow.id}"
                                       class="btn btn-primary py-2">Chi tiết</a>
                                    <a href="${pageContext.request.contextPath}/auth/listOfCompanyPost?idCompany=${followCompany.companyFollow.id}"
                                       class="btn btn-warning py-2 ml-1">Danh sách bài đăng</a>
                                </div>
                            </div>
                        </div>
                    </c:forEach>

                </div>
                <div style="text-align: center">
                    <c:if test="${followComanies.size() == 0}">
                        <p style="color:red;">Danh sách trống</p>
                    </c:if>
                </div>
            </div>

        </div>
    </div>
</section>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script>
    function follow(id) {
        var formData = new FormData();
        formData.append('idCompany', id);
        $.ajax({
            type: 'POST',
            url: '/asm2_war_exploded/user/followCompany',
            contentType: false,
            processData: false,
            data: formData,
            success: function (data) {
                console.log(data);
                if (data === "false") {
                    console.log("helo")
                    swal({
                        title: 'Bỏ theo dõi công ty',
                        icon: 'error',
                        timer: 3000,
                        buttons: true,
                        type: 'error'
                    });
                } else {
                    swal({
                        title: 'Theo dõi công ty',
                        icon: 'success',
                        timer: 3000,
                        buttons: true,
                        type: 'success'
                    });
                }
            },
            error: function (err) {
                alert(err);
            }
        });
    }
</script>
<footer th:replace="public/fragments :: footer" class="ftco-footer ftco-bg-dark ftco-section">

</footer>

</body>
</html>
