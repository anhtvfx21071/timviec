<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 3/5/2024
  Time: 9:43 PM
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

<div class="hero-wrap hero-wrap-2"
     style="background-image: url('${pageContext.request.contextPath}/resources/images/bg_1.jpg');"
     data-stellar-background-ratio="0.5">
    <div class="overlay"></div>
    <div class="container">
        <div class="row no-gutters slider-text align-items-end justify-content-start">
            <div class="col-md-12 text-center mb-5">
                <h1 class="mb-3 bread">Hồ sơ </h1>
                <div class="form-group">
                    <form id="form1" enctype="multipart/form-data" method="post">
                        <label class="btn btn-primary btn-md btn-file">
                            Chọn ảnh<input type="file" name="avatar" id="fileUpload" onchange="submitForms()" required>
                        </label>
                        <input type="hidden" name="email" value="${user.email}">
                    </form>

                </div>
                <div style="margin-left: 0px" id="divImage">
                    <img id="avatar" height="100" width="100" style="border-radius: 50px"
                         src="data:image/jpg;base64, ${avatar}">
                </div>
            </div>
        </div>
    </div>
</div>

<!--Email-->
<security:authorize access="hasRole('ROLE_ADMIN')">
    <c:if test="${user.status ==1}">
        <div class="container-fluid" style="text-align: center">
            <p style="font-size: 20px;font-weight: bold;color: #aaa;margin-top: 10px">Xác thực email đăng nhập</p>
            <c:if test="${param.verifyEmail eq null}">
                <div style="width: 600px;height: 400px;border-radius: 5px; box-shadow: rgba(0, 0, 0, 0.4) 0px 0px 10px;margin: 20px auto;padding: 15px">
                    <p style="line-height: 35px;font-size: 16px">Xin chào, <span>${user.fullName}</span>
                        và làm theo hướng dẫn trong email.
                        Trường hợp không nhận được email, bạn vui lòng bấm nút Nhận email xác thực dưới đây.</p>
                    <div class="row form-group">
                        <form action="${pageContext.request.contextPath}/admin/verifyEmail" method="post"
                              class="col-md-12">
                            <input type="hidden" value="${user.email}" name="email"
                                   class="btn px-4 btn-primary text-white">
                            <input type="submit" value="Nhận email xác thực" class="btn px-4 btn-primary text-white">
                        </form>
                    </div>
                    <p>Mọi thắc mắc vui lòng liên hệ bộ phận CSKH của WorkCV:<br></p>
                    - Điện thoại:<span style="color:#5f80ec">(024) 6680 5588</span><br>
                    - Email: <a href="#" style="color:#5f80ec"> hotro@workcv.vn</a>
                </div>
            </c:if>
            <c:if test="${param.verifyEmail ne null}">
                <div style="width: 600px;height: 400px;border-radius: 5px; box-shadow: rgba(0, 0, 0, 0.4) 0px 0px 10px;margin: 20px auto;padding: 15px">
                    <p style="line-height: 35px;font-size: 16px">Xin chào, <span>${user.fullName}</span>
                        .Bạn đã gửi yêu cầu xác thực thành công,
                        vui lòng kiểm tra mail để xác thực.Cảm ơn bạn!!!
                    </p>
                    <form action="${pageContext.request.contextPath}/admin/emailAuthentication" method="post">
                        <label style="color: hotpink">Mã xác thực của bạn là: </label>
                        <input type="number" name="code">
                        <input type="hidden" name="email" value="${user.email}">
                        <input type="submit" class="btn px-4 btn-primary text-white">
                    </form>
                    <p>Mọi thắc mắc vui lòng liên hệ bộ phận CSKH của WorkCV:<br></p>
                    - Điện thoại:<span style="color:#5f80ec">(024) 6680 5588</span><br>
                    - Email: <a href="#" style="color:#5f80ec"> hotro@workcv.vn</a>
                </div>
            </c:if>

        </div>
    </c:if>
</security:authorize>
<security:authorize access="hasRole('ROLE_USER')">
    <section class="site-section" style="margin-top: 10px">
        <div class="container">
            <form action="${pageContext.request.contextPath}/user/updateCV" enctype="multipart/form-data" method="post">
                <div class="row align-items-center mb-5">
                    <div class="col-lg-8 ">
                        <div class="d-flex align-items-center">
                            <div class="form-group" style="margin-top: 15px">
                                <label class="btn btn-primary btn-md btn-file">
                                    Chọn cv (pdf)<input type="file" name="fileCV" id="fileUpload1" required hidden>
                                    <input type="hidden" name="email" value="${user.email}">
                                </label>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="row">
                            <div class="col-6">
                                <button type="submit" id="myBtn" class="btn btn-block btn-light btn-md"><span
                                        class="icon-open_in_new mr-2"></span>Cập nhật cv
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
            <div id="filePDF" style="position: relative;">
                <div id="pdf-container" style="display: none">
                    <embed id="pdf-viewer" src="" type="application/pdf" width="100%" height="100%">
                </div>
                <a id="open-pdf-link" href="#">Xem CV</a>
                <a style="color: red;margin-left: 20px" data-toggle="modal" data-target="#exampleModal">Xóa cv</a>
                <button id="close-btn" style="position: absolute; top: 10px; right: 10px; display: none">Đóng</button>
            </div>
            <form:form action="${pageContext.request.contextPath}/user/updateUser" method="post"
                       enctype="multipart/form-data">
            <div class="row align-items-center mb-5">
                <div class="col-lg-8 mb-4 mb-lg-0">
                    <div class="d-flex align-items-center">
                        <div>
                            <h2>Cập nhật thông tin</h2>
                        </div>
                    </div>
                </div>
            </div>
            <input type="hidden" name="id" value="${user.id}">
            <input type="hidden" name="password" value="${user.password}">
            <input type="hidden" name="roleName" value="${user.role.roleName}">
            <input type="hidden" name="status" value="${user.status}">
            <div class="row mb-5">
                <div class="col-lg-12">
                    <div class="p-4 p-md-5 border rounded">
                        <h3 class="text-black mb-5 border-bottom pb-2">Thông tin chi tiết</h3>
                        <div class="form-group">
                            <label for="email">Email</label>
                            <input type="email" class="form-control" id="email" name="email"
                                   value="${user.email}"
                                   required placeholder="${user.email}">
                        </div>
                        <div class="form-group">
                            <label for="job-title">Full name</label>
                            <input type="text" class="form-control" name="fullName"
                                   value="${user.fullName}"
                                   required id="job-title" placeholder="${user.fullName}">
                        </div>
                        <div class="form-group">
                            <label>Địa chỉ</label>
                            <input type="text" name="address"
                                   value="${user.address}"
                                   class="form-control" required placeholder="${user.address}">
                        </div>
                        <div class="form-group">
                            <label>Số điện thoại</label>
                            <input type="text" name="phoneNumber"
                                   value="${user.phoneNumber}"
                                   class="form-control" required placeholder="${user.phoneNumber}">
                        </div>
                        <div class="form-group">
                            <label>Mô tả bản thân</label>
                            <textarea name="description"
                                      class="form-control" id="editor"
                                      placeholder="Mô tả">${user.description}</textarea>
                        </div>
                        <div class="row">
                            <div class="col-12 col-md-8 col-lg-8"></div>
                            <div class="col-12 col-md-4 col-lg-4">
                                <div class="row">
                                    <div class="col-6">
                                        <button type="submit" class="btn btn-block btn-primary btn-md">Lưu thông tin
                                        </button>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>

                </div>
                </form:form>
            </div>
    </section>


    <!-- Modal -->

    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
         aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Bạn có chắc chắn muốn xóa ?</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    Cv : <span id="cvXoa"></span>
                    <span>${Cv.fileName}</span>
                    <form action="${pageContext.request.contextPath}/user/deleteCv" method="post">
                        <div class="modal-footer mt-1">
                            <input type="hidden" name="idUser" value="${Cv.userCv.id}">
                            <button type="submit" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                            <button type="submit" class="btn btn-danger">Xóa</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</security:authorize>
<security:authorize access="hasRole('ROLE_ADMIN')">
    <c:if test="${user.status == 2}">
        <section class="site-section" style="margin-top: 10px">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6 mb-5">
                        <h2 class="mb-4">Thông tin cá nhân</h2>
                        <form:form action="${pageContext.request.contextPath}/admin/updateUser"
                                   enctype="multipart/form-data" method="post">
                            <input type="hidden" name="id" value="${user.id}">
                            <input type="hidden" name="password" value="${user.password}">
                            <input type="hidden" name="roleName" value="${user.role.roleName}">
                            <input type="hidden" name="status" value="${user.status}">
                            <div class="row mb-5">
                                <div class="col-lg-12">
                                    <div class="p-4 p-md-5 border rounded" method="post">
                                        <div class="form-group">
                                            <label>Email</label>
                                            <input type="email" class="form-control" required name="email"
                                                   value="${user.email != null ? user.email : ""}"
                                                   placeholder="Email">
                                        </div>
                                        <div class="form-group">
                                            <label for="job-title">Họ và tên</label>
                                            <input type="text" class="form-control" required name="fullName"
                                                   value="${user.fullName != null ? user.fullName : ""}"
                                                   placeholder="Họ và tên">
                                        </div>
                                        <div class="form-group">
                                            <label>Địa chỉ</label>
                                            <input type="text" name="address"
                                                   value="${user.address != null ? user.address : ""}"
                                                   class="form-control"
                                                   placeholder="Địa chỉ">
                                        </div>
                                        <div class="form-group">
                                            <label>Số điện thoại</label>
                                            <input type="tel" name="phoneNumber"
                                                   value="${user.phoneNumber != null ? user.phoneNumber : ""}"
                                                   class="form-control" placeholder="Số điện thoại">
                                        </div>
                                        <div class="form-group">
                                            <label>Mô tả bản thân</label>
                                            <textarea name="description" type="text"
                                                      class="form-control" id="editorNr"
                                                      placeholder="Mô tả">${user.description}</textarea>
                                        </div>
                                        <div class="row form-group">
                                            <div class="col-md-12">
                                                <input type="submit" value="Lưu thông tin"
                                                       class="btn px-4 btn-primary text-white">
                                            </div>
                                        </div>
                                    </div>

                                </div>

                            </div>
                        </form:form>

                    </div>
                    <div class="col-lg-6">
                        <h2 class="mb-4">Thông tin công ty</h2>
                        <form:form action="${pageContext.request.contextPath}/admin/updateCompany" method="post"
                                   enctype="multipart/form-data">
                            <input type="hidden" name="idUser" value="${user.id}">
                            <input type="hidden" name="logo" value="${company.logo}">
                            <div class="form-group">
                                <label>Cập nhật Logo</label> <br>
                                <label class="btn btn-primary btn-md btn-file">
                                    <input type="file" name="photo" onchange="previewImage(event)" required>
                                </label>
                                <div id="divLogo">
                                    <img id="preview-image" src="#" alt="Ảnh công ty" style="display: none"
                                         height="100" width="100" style="border-radius: 50px; margin-bottom: 15px"/>

                                </div>
                            </div>

                            <c:if test="${not empty company.id}">
                                <!-- Nếu company.id có giá trị -->
                                <input type="hidden" name="id" value="${company.id}">
                            </c:if>
                            <c:if test="${empty company.status}">
                                <input type="hidden" name="status" value="1">
                            </c:if>
                            <c:if test="${not empty company.status}">
                                <input type="hidden" name="status" value="${company.status}">
                            </c:if>
                            <div class="row mb-5">
                                <div class="col-lg-12">
                                    <div class="p-4 p-md-5 border rounded" method="post">
                                        <div class="form-group">
                                            <label>Email</label>
                                            <input type="email" class="form-control" required name="email"
                                                   value="${company.email != null ? company.email : ""}"
                                                   placeholder="Email">
                                        </div>
                                        <div class="form-group">
                                            <label for="job-title">Tên công ty</label>
                                            <input type="text" class="form-control" required name="nameCompany"
                                                   value="${company.nameCompany != null ? company.nameCompany : ""}"
                                                   placeholder="Họ và tên">
                                        </div>
                                        <div class="form-group">
                                            <label>Địa chỉ</label>
                                            <input type="text" name="address"
                                                   value="${company.address != null ? company.address : ""}"
                                                   class="form-control"
                                                   placeholder="Địa chỉ">
                                        </div>
                                        <div class="form-group">
                                            <label>Số điện thoại</label>
                                            <input type="text" name="phoneNumber"
                                                   value="${company.phoneNumber != null ? company.phoneNumber : ""}"
                                                   class="form-control" placeholder="Số điện thoại">
                                        </div>
                                        <div class="form-group">
                                            <label>Mô tả bản thân</label>
                                            <textarea name="description" type="text"
                                                      class="form-control" id="editorN"
                                                      placeholder="Mô tả">${company.description}</textarea>
                                        </div>

                                        <c:if test="${not empty company.logo}">
                                            <div>
                                                <img src="data:image/jpg;base64, ${base64Image}" alt="Logo Company"
                                                     height="100" width="100"
                                                     style="border-radius: 50px; margin-bottom: 15px"/>
                                            </div>
                                        </c:if>
                                        <div class="row form-group">
                                            <div class="col-md-12">
                                                <input type="submit" value="Lưu thông tin"
                                                       class="btn px-4 btn-primary text-white">
                                            </div>
                                        </div>
                                    </div>

                                </div>

                            </div>
                        </form:form>
                    </div>
                </div>
            </div>
        </section>
    </c:if>
</security:authorize>
<script>
    document.getElementById('open-pdf-link').addEventListener('click', function (event) {
        event.preventDefault();
        var pdfViewer = document.getElementById('pdf-viewer');
        pdfViewer.setAttribute('src', 'data:application/pdf;base64,${fileCv}');
        document.getElementById('pdf-container').style.display = 'block';
        document.getElementById('close-btn').style.display = 'block';

    });
    document.getElementById('close-btn').addEventListener('click', function () {
        var pdfViewer = document.getElementById('pdf-viewer');
        pdfViewer.setAttribute('src', '');
        document.getElementById('pdf-container').style.display = 'none';
        document.getElementById('close-btn').style.display = 'none';
    });
</script>
<script>
    function submitForms() {
        var form1 = new FormData(document.getElementById("form1"));
        var fileInput = document.getElementById('fileUpload');
        if (fileInput.files.length > 0) {
            form1.append('avatar', fileInput.files[0]);

            var xhr = new XMLHttpRequest();
            xhr.open('POST', '/asm2_war_exploded/auth/updateAvatar', true);

            xhr.send(form1);
        }
    }
</script>
<script>
    ClassicEditor.create(document.querySelector('#editor')).then(eidt => {
        console.log("da" + eidt);
    })
        .catch(error => {
            console.error(error);
        });
    ClassicEditor.create(document.querySelector('#editorN')).then(eidt => {
        console.log("da" + eidt);
    })
        .catch(error => {
            console.error(error);
        });
</script>
<script>
    function previewImage(event) {
        const preview = document.getElementById('preview-image');
        const file = event.target.files[0];
        const reader = new FileReader();

        reader.onload = function (e) {
            preview.src = e.target.result;
            preview.style.display = 'block';
        }
        reader.readAsDataURL(file);
    }
</script>
<footer th:replace="public/fragments :: footer" class="ftco-footer ftco-bg-dark ftco-section">

</footer>
</body>
</html>
