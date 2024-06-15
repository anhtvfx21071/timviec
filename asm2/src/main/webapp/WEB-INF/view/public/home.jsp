<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 3/5/2024
  Time: 10:40 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.io.File" %>
<%@ page import="java.io.FileInputStream" %>
<%@ page import="org.apache.commons.codec.binary.Base64" %>
<%@ page import="com.example.asm2.entity.Company" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
    <title>Work CV</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <base href="/">
    <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700&display=swap" rel="stylesheet">


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
<c:if test="${param.access != null}">
    <div class="toast" data-delay="2000" style="position:fixed;top: 100PX; right: 10PX;z-index: 2000;width: 300px">
        <script>
            swal({
                title: 'Đăng nhập thành công!',
                /* text: 'Redirecting...', */
                icon: 'success',
                timer: 3000,
                buttons: true,
                type: 'success'
            })
        </script>
    </div>
</c:if>
<c:if test="${param.apply == true}">
    <div class="toast" data-delay="2000" style="position:fixed;top: 100PX; right: 10PX;z-index: 2000;width: 300px">
        <script>
            swal({
                title: 'Apply thành công',
                /* text: 'Redirecting...', */
                icon: 'success',
                timer: 3000,
                buttons: true,
                type: 'success'
            })
        </script>
    </div>
</c:if>
<c:if test="${param.apply == false}">
    <div class="toast" data-delay="2000" style="position:fixed;top: 100PX; right: 10PX;z-index: 2000;width: 300px">
        <script>
            swal({
                title: 'Apply thất bại do thiếu CV',
                /* text: 'Redirecting...', */
                icon: 'error',
                timer: 3000,
                buttons: true,
                type: 'error'
            })
        </script>
    </div>
</c:if>
<c:if test="${param.verifyEmail != null}">
    <div class="toast" data-delay="2000" style="position:fixed;top: 100PX; right: 10PX;z-index: 2000;width: 300px">
        <script>
            swal({
                title: 'Xác thực enail thất bại',
                icon: 'error',
                timer: 3000,
                buttons: true,
                type: 'error'
            })
        </script>
    </div>
</c:if>
<c:if test="${param.recruitment != null}">
    <div class="toast" data-delay="2000" style="position:fixed;top: 100PX; right: 10PX;z-index: 2000;width: 300px">
        <script>
            swal({
                title: 'Đăng tuyển thành công',
                icon: 'success',
                timer: 3000,
                buttons: true,
                type: 'success'
            })
        </script>
    </div>
</c:if>
<div class="hero-wrap img"
     style="background-image: url('${pageContext.request.contextPath}/resources/images/bg_1.jpg');">
    <div class="overlay"></div>
    <div class="container">
        <div class="row d-md-flex no-gutters slider-text align-items-center justify-content-center">
            <div class="col-md-10 d-flex align-items-center ">
                <div class="text text-center pt-5 mt-md-5">
                    <p class="mb-4">Tìm việc làm, Cơ hội việc làm và Nghề nghiệp</p>
                    <h1 class="mb-5">Cách dễ dàng nhất để có được công việc mới của bạn</h1>
                    <div class="ftco-counter ftco-no-pt ftco-no-pb">
                        <div class="row">
                            <div class="col-md-4 d-flex justify-content-center counter-wrap ">
                                <div class="block-18">
                                    <div class="text d-flex">
                                        <div class="icon mr-2">
                                            <span class="flaticon-visitor"></span>
                                        </div>
                                        <div class="desc text-left">
                                            <strong class="number" data-number="46"></strong>
                                            <span>Ứng cử viên</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4 d-flex justify-content-center counter-wrap ">
                                <div class="block-18 text-center">
                                    <div class="text d-flex">
                                        <div class="icon mr-2">
                                            <span class="flaticon-visitor"></span>
                                        </div>
                                        <div class="desc text-left">
                                            <strong class="number" data-number="450"></strong>
                                            <span>Công ty</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4 d-flex justify-content-center counter-wrap">
                                <div class="block-18 text-center">
                                    <div class="text d-flex">
                                        <div class="icon mr-2">
                                            <span class="flaticon-resume"></span>
                                        </div>
                                        <div class="desc text-left">
                                            <strong class="number" data-number="80000"></strong>
                                            <span>Tuyển dụng</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="ftco-search my-md-5">
                        <div class="row">
                            <div class="col-md-12 nav-link-wrap">
                                <div class="nav nav-pills text-center">
                                    <a class="nav-link active mr-md-1"
                                       href="${pageContext.request.contextPath}/auth/home#v-pills-1">Tìm công việc</a>
                                    <a class="nav-link" href="${pageContext.request.contextPath}/auth/home#v-pills-2">Tìm
                                        theo công ty</a>
                                    <a class="nav-link" href="${pageContext.request.contextPath}/auth/home#v-pills-3">Tìm
                                        theo địa điểm</a>
                                </div>
                            </div>
                            <div class="col-md-12 tab-wrap">
                                <div class="tab-content p-4" id="v-pills-tabContent">

                                    <div class="tab-pane fade show active" id="v-pills-1">
                                        <form action="${pageContext.request.contextPath}/search/searchByJob"
                                              method="post" class="search-job">
                                            <div class="row no-gutters">
                                                <div class="col-md-10 mr-md-2">
                                                    <div class="form-group">
                                                        <div class="form-field">
                                                            <div class="icon"><span class="icon-map-marker"></span>
                                                            </div>
                                                            <input type="text" name="keySearch" class="form-control"
                                                                   placeholder="Tìm kiếm công việc">
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md">
                                                    <div class="form-group">
                                                        <div class="form-field">
                                                            <button type="submit" class="form-control btn btn-primary">
                                                                Tìm kiếm
                                                            </button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </form>
                                    </div>

                                    <div class="tab-pane fade show active" id="v-pills-2" style="display: none;">
                                        <form action="${pageContext.request.contextPath}/search/searchByCompany"
                                              method="post" class="search-job">
                                            <div class="row no-gutters">

                                                <div class="col-md-10 mr-md-2">
                                                    <div class="form-group">
                                                        <div class="form-field">
                                                            <div class="icon"><span class="icon-map-marker"></span>
                                                            </div>
                                                            <input type="text" name="keySearch" class="form-control"
                                                                   placeholder="Tìm kiếm theo công ty">
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md">
                                                    <div class="form-group">
                                                        <div class="form-field">
                                                            <button type="submit" class="form-control btn btn-primary">
                                                                Tìm kiếm
                                                            </button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </form>
                                    </div>

                                    <div class="tab-pane fade show active" id="v-pills-3" style="display: none;">
                                        <form action="${pageContext.request.contextPath}/search/searchByAddress"
                                              method="post" class="search-job">
                                            <div class="row no-gutters">

                                                <div class="col-md-10 mr-md-2">
                                                    <div class="form-group">
                                                        <div class="form-field">
                                                            <div class="icon"><span class="icon-map-marker"></span>
                                                            </div>
                                                            <input type="text" name="keySearch" class="form-control"
                                                                   placeholder="Tìm kiếm theo địa điểm">
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md">
                                                    <div class="form-group">
                                                        <div class="form-field">
                                                            <button type="submit" class="form-control btn btn-primary">
                                                                Tìm kiếm
                                                            </button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </form>
                                    </div>


                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<section class="ftco-section">
    <div class="container">
        <div class="row justify-content-center mb-5">

            <div style="display: block" class="col-md-7 heading-section text-center">
                <span class="subheading">Danh mục công việc</span>
                <h2 class="mb-0">Top Danh Mục</h2>
            </div>
        </div>
        <div class="row">

            <c:forEach var="category" items="${categories}">
                <div class="col-md-3 ">
                    <ul class="category text-center">

                        <li><a style="text-decoration: none !important;"><p>${category.name}</p>
                            <span class="number">${category.numberChoose}</span> <span>Vị trí</span><i
                                    class="ion-ios-arrow-forward"></i></a></li>
                    </ul>
                </div>
            </c:forEach>
        </div>
    </div>
</section>

<section class="ftco-section services-section">
    <div class="container">
        <div class="row d-flex">
            <div class="col-md-3 d-flex align-self-stretch ">
                <div class="media block-6 services d-block">
                    <div class="icon"><span class="flaticon-resume"></span></div>
                    <div class="media-body">
                        <h3 class="heading mb-3">Tìm kiếm hàng triệu việc làm</h3>
                        <p>Một con sông nhỏ tên là Duden chảy qua nơi ở và nguồn cung cấp của họ.</p>
                    </div>
                </div>
            </div>
            <div class="col-md-3 d-flex align-self-stretch ">
                <div class="media block-6 services d-block">
                    <div class="icon"><span class="flaticon-team"></span></div>
                    <div class="media-body">
                        <h3 class="heading mb-3">Dễ dàng quản lý công việc</h3>
                        <p>Một con sông nhỏ tên là Duden chảy qua nơi ở và nguồn cung cấp của họ.</p>
                    </div>
                </div>
            </div>
            <div class="col-md-3 d-flex align-self-stretch ">
                <div class="media block-6 services d-block">
                    <div class="icon"><span class="flaticon-career"></span></div>
                    <div class="media-body">
                        <h3 class="heading mb-3">Top Nghề nghiệp</h3>
                        <p>Một con sông nhỏ tên là Duden chảy qua nơi ở và nguồn cung cấp của họ.</p>
                    </div>
                </div>
            </div>
            <div class="col-md-3 d-flex align-self-stretch ">
                <div class="media block-6 services d-block">
                    <div class="icon"><span class="flaticon-employees"></span></div>
                    <div class="media-body">
                        <h3 class="heading mb-3">Ứng viên Chuyên gia Tìm kiếm</h3>
                        <p>Một con sông nhỏ tên là Duden chảy qua nơi ở và nguồn cung cấp của họ.</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<section class="ftco-section bg-light">
    <div class="container">
        <div class="row">
            <div class="col-lg-9 pr-lg-5">
                <div class="row justify-content-center pb-3">
                    <div class="col-md-12 heading-section ">
                        <span class="subheading">CÔNG VIỆC ĐƯỢC NHIỀU NGƯỜI ỨNG TUYỂN</span>
                        <h2 class="mb-4">Các bài đăng về việc làm nổi bật</h2>

                    </div>
                </div>
                <div class="row">
                    <c:forEach var="recruitment" items="${recruitments}">
                        <div class="col-md-12 ">
                            <div class="job-post-item p-4 d-block d-lg-flex align-items-center">
                                <div class="one-third mb-4 mb-md-0">
                                    <div class="job-post-item-header align-items-center">
                                        <span class="subadge">${recruitment.type}</span>
                                        <h2 class="mr-3 text-black"><strong>${recruitment.title}</strong>
                                        </h2>
                                    </div>
                                    <div class="job-post-item-body d-block d-md-flex">
                                        <div class="mr-3"><span class="icon-layers">
                                           <a href="${pageContext.request.contextPath}/auth/company?idCompany=${recruitment.companyRe.id}">
                                               <span>${recruitment.companyRe.nameCompany}</span>
                                                 </a></span>
                                        </div>
                                        <div><span class="icon-my_location"></span> <span>${recruitment.address}</span>
                                        </div>
                                    </div>
                                </div>
                                <security:authorize access="hasRole('ROLE_USER')">
                                    <div class="one-forth ml-auto d-flex align-items-center mt-4 md-md-0">
                                        <div>
                                            <a onclick="save(${recruitment.id})"
                                               class="icon text-center d-flex justify-content-center align-items-center icon mr-2">
                                                <span class="icon-heart"></span>
                                            </a>
                                        </div>
                                        <a data-toggle="modal"
                                           data-target="#exampleModal${recruitment.id}"
                                           class="btn btn-primary py-2">Apply Job</a>
                                    </div>
                                </security:authorize>
                            </div>
                        </div>
                        <!-- Modal -->
                        <div class="modal fade" id="exampleModal${recruitment.id}" tabindex="-1" role="dialog"
                             aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="exampleModalLabel">Ứng tuyển:
                                            <span>${recruitment.title}</span></h5>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <form action="${pageContext.request.contextPath}/user/apply" method="post"
                                          enctype="multipart/form-data">
                                        <div class="col-12">
                                            <select class="form-control" aria-label="Default select example"
                                                    id="submissionMethod${recruitment.id}"
                                                    onchange="toggleFields(${recruitment.id})">
                                                <option selected>Chọn phương thức nộp</option>
                                                <option value="1">Dùng cv đã cập nhật</option>
                                                <option value="2">Nộp cv mới</option>
                                            </select>
                                        </div>
                                        <div id="introductionDiv${recruitment.id}" style="display:none" class="col-12">
                                            <input type="hidden" name="idRecruitment" value="${recruitment.id}">
                                            <input type="hidden" name="status" value="1">
                                            <label class="col-form-label">Giới thiệu:</label>
                                            <textarea name="text" rows="10" cols="3" class="form-control"></textarea>
                                        </div>
                                        <div id="cvDiv${recruitment.id}" style="display:none" class="col-12">
                                            <input type="hidden" name="idRecruitment" value="${recruitment.id}">
                                            <input type="hidden" name="status" value="1">
                                            <input type="file" name="fileCv" class="form-control">
                                            <label class="col-form-label">Giới thiệu:</label>
                                            <textarea name="text" rows="10" cols="3" class="form-control"></textarea>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng
                                            </button>
                                            <button style="display:none" type="submit" class="btn btn-primary"
                                                    id="nopCv${recruitment.id}">Nộp
                                            </button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
            <div class="col-lg-3 sidebar">
                <div class="row justify-content-center pb-3">
                    <div class="col-md-12 heading-section ">
                        <h2 class="mb-4">Công ty nổi bật</h2>
                    </div>
                </div>
                <c:forEach var="company" items="${companies}">
                    <% com.example.asm2.entity.Company company = (com.example.asm2.entity.Company) pageContext.getAttribute("company");
                        String logo = company.getLogo();
                        String path = "C:/image/logo/" + logo;
                        File file = new File(path);
                        if (file.exists()) {
                            FileInputStream fis = new FileInputStream(file);
                            byte[] imageBytes = new byte[(int) file.length()];
                            fis.read(imageBytes);
                            fis.close();
                            String base64Image = Base64.encodeBase64String(imageBytes);
                    %>
                    <div class="sidebar-box">
                        <a href="#" class="company-wrap">
                            <img style="width: 150px; height: 150px" src="data:image/jpg;base64,<%= base64Image %>"
                                 class="img-fluid" alt="Company Avatar">
                        </a> <% } %>
                        <div class="text p-3">
                            <div class="job-post-item-body d-block d-md-flex">
                                <div class="mr-3"><span class="icon-layers">
                                    <a href="${pageContext.request.contextPath}/auth/company?idCompany=${company.id}">
                                        <strong>${company.nameCompany}</strong>
                                    </a>
                                </span>
                                </div>
                                <div><span class="icon-my_location"></span> <span>${company.address}</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
</section>

<script>
    document.addEventListener("DOMContentLoaded", function () {
        const tabs = document.querySelectorAll('.nav-link');
        const tabContents = document.querySelectorAll('.tab-pane');

        tabs.forEach(tab => {
            tab.addEventListener('click', function (event) {
                event.preventDefault();

                const tabId = this.getAttribute('href').substring(this.getAttribute('href').indexOf('#'));

                tabs.forEach(item => {
                    item.classList.remove('active', 'mr-md-1');
                });
                tab.classList.add('active', 'mr-md-1');

                tabContents.forEach(tabContent => {
                    tabContent.classList.remove('show');
                    tabContent.style.display = 'none';
                });

                const selectedTabContent = document.querySelector(tabId);
                selectedTabContent.classList.add('show', 'active');
                selectedTabContent.style.display = 'block';
            });
        });
    });
</script>
<script>
    function toggleFields(recruitmentId) {
        var selectBox = document.getElementById("submissionMethod" + recruitmentId);
        var selectedValue = selectBox.options[selectBox.selectedIndex].value;

        var introductionDiv = document.getElementById("introductionDiv" + recruitmentId);
        var cvDiv = document.getElementById("cvDiv" + recruitmentId);

        if (selectedValue === "1") {
            introductionDiv.style.display = "block";
            cvDiv.style.display = "none";
            document.getElementById("nopCv" + recruitmentId).style.display = "block";
        } else if (selectedValue === "2") {
            introductionDiv.style.display = "none";
            cvDiv.style.display = "block";
            document.getElementById("nopCv" + recruitmentId).style.display = "block";
        } else {
            introductionDiv.style.display = "none";
            cvDiv.style.display = "none";
            document.getElementById("nopCv" + recruitmentId).style.display = "none";
        }
    }
</script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script>
    function save(id) {
        var formData = new FormData();
        formData.append('idRe', id);
        $.ajax({
            type: 'POST',
            url: '/asm2_war_exploded/user/save',
            contentType: false,
            processData: false,
            data: formData,
            success: function (data) {
                console.log(data);
                if (data === "false") {
                    swal({
                        title: 'Xóa khỏi danh sách lưu',
                        icon: 'error',
                        timer: 3000,
                        buttons: true,
                        type: 'error'
                    });
                } else {
                    swal({
                        title: 'Lưu thành công!',
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
