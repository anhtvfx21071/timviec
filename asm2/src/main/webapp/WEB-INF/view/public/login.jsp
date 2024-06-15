<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 3/7/2024
  Time: 5:31 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
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

    <!-- JS -->
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
                <a class="na" style="color: #78d5ef" >Công việc</a>
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
                            <a class="dropdown-item" href="${pageContext.request.contextPath}/user/applied">Danh sách đăng ký</a>
                            <a class="dropdown-item" href="${pageContext.request.contextPath}/user/listSaveJob">Danh sách đã lưu</a>
                            <a class="dropdown-item" href="${pageContext.request.contextPath}/user/listFollowCompany">D/s công ty theo dõi</a>
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
        </ul>
    </div>
</nav>
<div class="hero-wrap hero-wrap-2" style="background-image: url('${pageContext.request.contextPath}/resources/assets/images/bg_1.jpg');" data-stellar-background-ratio="0.5">
    <div class="overlay"></div>
    <div class="container">
        <div class="row no-gutters slider-text align-items-end justify-content-start">
            <div class="col-md-12 text-center mb-5">
                <p class="breadcrumbs mb-0"><span class="mr-3"><a >Trang chủ <i class="ion-ios-arrow-forward"></i></a></span> đăng nhập<span></span></p>
                <h1 class="mb-3 bread">Đăng nhập / Đăng kí</h1>
            </div>
        </div>
    </div>
</div>
<c:if test="${param.success ne null}">
    <div class="toast" data-delay="2500" style="position:fixed; top: 100PX; right: 10PX;z-index: 2000;width: 300px">
        <script>
            swal({
                title: '<%= request.getParameter("message") %>',
                timer: 3000,
                buttons: true,
                type: 'success'
            });
        </script>
    </div>
</c:if>
<c:if test="${param.error ne null}">
    <div class="toast" data-delay="2500" style="position:fixed; top: 100PX; right: 10PX;z-index: 2000;width: 300px">
        <script>
            swal({
                title: '${errorMessage}',
                icon: 'error',
                timer: 3000,
                buttons: true,
                type: 'error'
            })
        </script>
    </div>
</c:if>

<!-- HOME -->
<section class="section-hero overlay inner-page bg-image" style="background-image: url('${pageContext.request.contextPath}/resources/assetsimages/bg_1.jpg');" id="home-section">
    <div class="container">
        <div class="row">
            <div class="col-md-7">
                <h1 class="text-white font-weight-bold">Đăng kí / đăng nhập</h1>
                <div class="custom-breadcrumbs">
                    <a href="home">Trang chủ</a> <span class="mx-2 slash">/</span>
                    <span><strong>Đăng nhập</strong></span>
                </div>
            </div>
        </div>
    </div>
</section>

<section class="site-section">
    <div class="container">
        <div class="row">
            <div class="col-lg-6 mb-5">
                <h2 class="mb-4">Đăng kí</h2>
                <form:form action="${pageContext.request.contextPath}/auth/register" method="post" class="p-4 border rounded">

                    <div class="row form-group">
                        <div class="col-md-12 mb-3 mb-md-0">
                            <label class="text-black" >Email</label>
                            <input type="email"  name="email" class="form-control" placeholder="Email" required>
                        </div>
                    </div>

                    <div class="row form-group">
                        <div class="col-md-12 mb-3 mb-md-0">
                            <label class="text-black" >Họ và tên</label>
                            <input type="text"  name="fullName" class="form-control" placeholder="Họ và tên" required>
                        </div>
                    </div>

                    <div class="row form-group">
                        <div class="col-md-12 mb-3 mb-md-0">
                            <label class="text-black" >Mật khẩu</label>
                            <input type="password"   name="password" class="form-control" placeholder="Mật khẩu" required>
                        </div>
                    </div>
                    <div class="row form-group mb-4">
                        <div class="col-md-12 mb-3 mb-md-0">
                            <label class="text-black" >Nhập lại mật khẩu</label>
                            <input type="password"  name="rePassword" class="form-control" placeholder="Nhập lại mật khẩu" required>
                        </div>
                    </div>
                    <div class="row form-group">
                        <div class="col-md-12 mb-3 mb-md-0">
                            <label class="text-black" >Vai trò</label>
                            <select class="form-control" name="roleName" aria-label="Default select example" required>
                                <option value="ROLE_USER">Ứng cử viên</option>
                                <option value="ROLE_ADMIN">Công ty</option>
                            </select>
                        </div>
                    </div>
                    <div class="row form-group">
                        <div class="col-md-12">
                            <input type="submit" value="Đăng kí" class="btn px-4 btn-primary text-white">
                        </div>
                    </div>
                </form:form>
            </div>
            <div class="col-lg-6">
                <h2 class="mb-4">Đăng nhập</h2>
                <form:form action="${pageContext.request.contextPath}/authenticateTheUser" method="post" class="p-4 border rounded">

                    <div class="row form-group">
                        <div class="col-md-12 mb-3 mb-md-0">
                            <label class="text-black" >Email</label>
                            <input type="email"  name="username" class="form-control" placeholder="Email" required>
                        </div>
                    </div>
                    <div class="row form-group mb-4">
                        <div class="col-md-12 mb-3 mb-md-0">
                            <label class="text-black" >Mật khẩu</label>
                            <input type="password"  name="password" class="form-control" placeholder="Mật khẩu" required>
                        </div>
                    </div>

                    <div class="row form-group">
                        <div class="col-md-12">
                            <input type="submit" value="Đăng nhập" class="btn px-4 btn-primary text-white">
                        </div>
                    </div>

                </form:form>
            </div>
        </div>
    </div>
</section>
<footer th:replace="public/fragments :: footer" class="ftco-footer ftco-bg-dark ftco-section">
</footer>
</body>
</html>
