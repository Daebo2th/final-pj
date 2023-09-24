<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>학생 상세보기</title>

    <!-- Favicons -->
    <link href="${pageContext.request.contextPath}favicon.ico" rel="icon">
    <link href="${pageContext.request.contextPath}/resources/img/apple-touch-icon.png" rel="apple-touch-icon">

    <!-- Google Fonts -->
    <link href="https://fonts.gstatic.com" rel="preconnect">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

    <!-- Vendor CSS Files -->
    <link href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/vendor/quill/quill.snow.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/vendor/quill/quill.bubble.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/vendor/remixicon/remixicon.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/vendor/simple-datatables/style.css" rel="stylesheet">

    <!-- Template Main CSS File -->
    <link href="${pageContext.request.contextPath}/resources/css/style.css" rel="stylesheet">
    <link rel="stylesheet" href="/resources/css/chatting.css">
</head>
<body>
<main id="main" class="main">
    <%@include file="../include/header.jsp"%>
    <%@include file="../include/aside.jsp"%>
    <div class="pagetitle">
        <h1>Profile</h1>
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="/">Home</a></li>
                <li class="breadcrumb-item">Users</li>
                <li class="breadcrumb-item active">Profile</li>
            </ol>
        </nav>
    </div>
    <!-- End Page Title -->

    <section class="section profile">
        <div class="row">
            <div class="col-xl-5">

                <div class="card">
                    <div
                            class="card-body profile-card pt-5 d-flex flex-column align-items-center" style="height: 446px;">

                        <img
                                src="${mypage.profile == null ? '/resources/img/profile-img.jpg':('https://osdsbucket.s3.amazonaws.com/osds/'+=mypage.userId += '/' += mypage.profile) }"
                                alt="Profile" class="rounded-circle" id="profileImages">
                        <h2 class="pt-4">${mypage.name}</h2>

                    </div>
                </div>

            </div>

            <div class="col-xl-7">

                <div class="card">
                    <div class="card-body pt-3">
                        <!-- Bordered Tabs -->
                        <ul class="nav nav-tabs nav-tabs-bordered">

                            <li class="nav-item">
                                <button class="nav-link active" data-bs-toggle="tab"
                                        data-bs-target="#profile-overview">개요</button>
                            </li>

                        </ul>
                        <div class="tab-content pt-2">

                            <div class="tab-pane fade show active profile-overview"
                                 id="profile-overview">

                                <h5 class="card-title"
                                    style="font-family: Roboto, sans-serif; font-weight: 700; line-height: 1.5; margin-bottom: 0; padding: 15px 0px; font-size: 22px; color: #012970;">상세 정보</h5>

                                <div class="row pt-4">
                                    <div class="col-lg-3 col-md-4 label">이름</div>
                                    <div class="col-lg-9 col-md-8">${mypage.name}</div>
                                </div>

                                <div class="row">
                                    <div class="col-lg-3 col-md-4 label">아이디</div>
                                    <div class="col-lg-9 col-md-8">${mypage.userId}</div>
                                </div>

                                <div class="row">
                                    <div class="col-lg-3 col-md-4 label">전화번호</div>
                                    <div class="col-lg-9 col-md-8">${mypage.phone}</div>
                                </div>

                                <div class="row">
                                    <div class="col-lg-3 col-md-4 label">성별</div>
                                    <div class="col-lg-9 col-md-8">${mypage.gender=='M'?'남자':'여자'}</div>
                                </div>

                                <div class="row">
                                    <div class="col-lg-3 col-md-4 label">생일</div>
                                    <div class="col-lg-9 col-md-8"><fmt:formatDate value="${mypage.birthday}" pattern="yyyy / MM / dd"></fmt:formatDate></div>
                                </div>

                                <div class="row">
                                    <div class="col-lg-3 col-md-4 label">주소</div>
                                    <div class="col-lg-9 col-md-8">${mypage.addr1}</div>
                                </div>

                                <div class="row">
                                    <div class="col-lg-3 col-md-4 label">가입일</div>
                                    <div class="col-lg-9 col-md-8"><fmt:formatDate value="${mypage.regDate}" pattern="yyyy / MM / dd"></fmt:formatDate></div>
                                </div>

                            </div>




                        </div>
                        <!-- End Bordered Tabs -->

                    </div>
                </div>

            </div>
        </div>
    </section>

</main><!-- End #main -->

<%@include file="../include/footer.jsp"%>

<!-- Vendor JS Files -->
<script src="${pageContext.request.contextPath}/resources/vendor/apexcharts/apexcharts.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/vendor/chart.js/chart.umd.js"></script>
<script src="${pageContext.request.contextPath}/resources/vendor/echarts/echarts.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/vendor/quill/quill.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/vendor/simple-datatables/simple-datatables.js"></script>
<script src="${pageContext.request.contextPath}/resources/vendor/tinymce/tinymce.min.js"></script>

<!-- Template Main JS File -->
<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
</body>
</html>
