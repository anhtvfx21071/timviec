<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 3/5/2024
  Time: 9:44 PM
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
            <security:authorize access="!isAuthenticated()">
                <li class="nav-item">
                    <a href="${pageContext.request.contextPath}/auth/login" class="na">Đăng nhập</a>
                </li>
            </security:authorize>
        </ul>
    </div>
</nav>
<!-- END nav -->
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

<section class="ftco-section bg-light">
    <div class="container">
        <h4 style="margin-top: -20px">Kết quả tìm kiếm cho : <span>${keySearch}</span></h4>
        <div class="row">
            <div class="col-lg-12 pr-lg-5">
                <div class="row">
                    <div id="content" class="col-md-12 "></div>
                    <c:choose>
                        <c:when test="${recruitments.size() == 0}">
                            <div style="text-align: center;">
                                <br>
                                <p style="color: red;">Không có kết quả nào</p>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <div id="pagination">
                                <button onclick="previousPage()">Previous</button>
                                <span id="pageNumbers"></span>
                                <button onclick="nextPage()">Next</button>
                            </div>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </div>
    </div>
</section>

<script>
    function toggleFields(recruitmentId) {
        var selectBox = document.getElementById("submissionMethod" + recruitmentId);
        var selectedValue = selectBox.options[selectBox.selectedIndex].value;

        var introductionDiv = document.getElementById("introductionDiv" + recruitmentId);
        var cvDiv = document.getElementById("cvDiv" + recruitmentId);

        if (selectedValue === "1") {
            introductionDiv.style.display = "block";
            cvDiv.style.display = "none";
            document.getElementById("nopCv"+recruitmentId).style.display = "block";
        } else if (selectedValue === "2") {
            introductionDiv.style.display = "none";
            cvDiv.style.display = "block";
            document.getElementById("nopCv"+recruitmentId).style.display = "block";
        } else {
            introductionDiv.style.display = "none";
            cvDiv.style.display = "none";
            document.getElementById("nopCv"+recruitmentId).style.display = "none";
        }
    }
</script>

<script>
    var recruitments = [];
    <c:forEach var="recruitment" items="${recruitments}">
    var recruitmentObj = {
        id: '${recruitment.id}',
        type: '${recruitment.type}',
        title: '${recruitment.title}',
        companyName: '${recruitment.companyRe.nameCompany}',
        address: '${recruitment.address}'
    };
    recruitments.push(recruitmentObj);
    </c:forEach>
    var itemsPerPage = 5; // Số lượng sản phẩm trên mỗi trang
    var currentPage = 1; // Trang hiện tại
    var i;

    function displayData() {
        var startIndex = (currentPage - 1) * itemsPerPage;
        var endIndex = Math.min(startIndex + itemsPerPage, recruitments.length);
        var content = "";
        for (i = startIndex; i < endIndex; i++) {
            var recruitment = recruitments[i]
            content += ` <div class="col-md-12 ">
                         <div class="job-post-item p-4 d-block d-lg-flex align-items-center">
                         <div class="one-third mb-4 mb-md-0">
                         <div class="job-post-item-header align-items-center">
                         <span class="subadge">`
            content += recruitment.type
            content += `</span><h2 class="mr-3 text-black" ><a href="#">`
            content += recruitment.title
            content += `</a></h2></div><div class="job-post-item-body d-block d-md-flex">
                        <div class="mr-3"><span class="icon-layers"></span> <a href="#" >`
            content += recruitment.companyName
            content += `</a></div><div><span class="icon-my_location"></span> <span>`
            content += recruitment.address
            content += `</span></div></div></div>
            <div class="one-forth ml-auto d-flex align-items-center mt-4 md-md-0">
            <div><a class="icon text-center d-flex justify-content-center align-items-center icon mr-2">
            <span class="icon-heart"></span></a></div>
            <a data-toggle="modal" data-target="#exampleModal`
            content += recruitment.id
            content += `" class="btn btn-primary py-2">Apply Job</a>
                        </div></div></div>
                        <div class="modal fade" id="exampleModal`
            content += recruitment.id
            content += `" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog" role="document">
                        <div class="modal-content">
                        <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Ứng tuyển: <span>`
            content += recruitment.title
            content += `</span></h5><button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span></button>
                        </div><form
                        method="post" action="${pageContext.request.contextPath}/user/apply" enctype="multipart/form-data">
                        <div class="modal-body">
                        <div class="row"><div class="col-12">
                        <select class="form-control" aria-label="Default select example" id="submissionMethod`
            content += recruitment.id
            content += `" onchange="toggleFields(`
            content += recruitment.id
            content += `)">
                        <option selected>Chọn phương thức nộp</option>
                        <option value="1">Dùng cv đã cập nhật</option>
                        <option value="2">Nộp cv mới</option>
                        </select></div><div id="introductionDiv`
            content += recruitment.id
            content += `" style="display:none" class="col-12"><input type="hidden" name="idRecruitment" value="`
            content += recruitment.id
            content += `"><input type="hidden" name="status" value="1">
                          <label class="col-form-label">Giới thiệu:</label>
                          <textarea name="text" rows="10" cols="3" class="form-control"></textarea>
                          </div><div id="cvDiv`
            content+= recruitment.id
            content += `" style="display:none" class="col-12">
                         <input type="hidden" name="idRecruitment" value="`
            content += recruitment.id
            content += `"><input type="hidden" name="status" value="1">
                         <label class="col-form-label">Chọn cv:</label>
                         <input type="file" class="form-control" name="fileCv">
                         <label class="col-form-label">Giới thiệu:</label>
                         <textarea  name="text" rows="10" cols="3" class="form-control"></textarea>
                         </div></div><div class="modal-footer">
                         <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                         <button  style="display:none" type="submit" class="btn btn-primary" id="nopCv`
            content += recruitment.id
            content +=`">Nộp</button></div>
                         </div></form></div></div></div>`;
        }
        document.getElementById("content").innerHTML = content;
    }

    function generatePageNumbers() {
        var totalPages = Math.ceil(recruitments.length / itemsPerPage);
        var pageNumbers = "";

        for (var i = 1; i <= totalPages; i++) {
            pageNumbers += "<button onclick=\"changePage(" + i + ")\">" + i + "</button>";
        }

        document.getElementById("pageNumbers").innerHTML = pageNumbers;
    }

    function changePage(page) {
        currentPage = page;
        displayData();
    }

    function nextPage() {
        if (currentPage < Math.ceil(recruitments.length / itemsPerPage)) {
            currentPage++;
            displayData();
        }
    }

    function previousPage() {
        if (currentPage > 1) {
            currentPage--;
            displayData();
        }
    }

    displayData();
    generatePageNumbers();
</script>
<script>
    document.addEventListener("DOMContentLoaded", function () {
        const tabs = document.querySelectorAll('.nav-link');
        const tabContents = document.querySelectorAll('.tab-pane');

        tabs.forEach(tab => {
            tab.addEventListener('click', function (event) {
                event.preventDefault(); // Prevent default anchor behavior

                const tabId = this.getAttribute('href').substring(this.getAttribute('href').indexOf('#')); // Get tab id

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
<footer th:replace="public/fragments :: footer" class="ftco-footer ftco-bg-dark ftco-section">

</footer>


</body>
</html>
