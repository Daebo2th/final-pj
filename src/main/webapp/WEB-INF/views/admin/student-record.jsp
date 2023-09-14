<%--
  Created by IntelliJ IDEA.
  User: KOSA
  Date: 2023-09-10
  Time: 오후 4:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>교육생 관리</title>

    <!-- Favicons -->
    <link href="${pageContext.request.contextPath}/resources/img/favicon.png" rel="icon">
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

</head>
<body>
    <%@include file="../include/header.jsp"%>
    <%@include file="../include/aside.jsp"%>


    <section class="section">
        <div class="row">
            <div class="col-xl-12">
                <div class="card">
                    <div class="card-body pt-3">
                        <main id="main" class="main">

                            <div class="pagetitle">
                                <h1>학생 기록부</h1>
                                <nav>
                                    <ol class="breadcrumb">
                                        <li class="breadcrumb-item"><a href="#">Home</a></li>
                                        <li class="breadcrumb-item active">학생기록부</li>
                                    </ol>
                                </nav>
                            </div><!-- End Page Title -->

                            <section class="section dashboard">
                                <div class="row">

                                    <!-- Left side columns -->
                                    <div class="col-lg-8">
                                        <div class="row">
                                            <!-- Reports -->
                                            <div class="col-12">
                                                <div class="card">
                                                    <div class="card-body">
                                                        <h5 class="card-title">Reports <span>/Today</span></h5>
                                                        <h2>${list[0].groupName} + 학생명단</h2>
                                                        <table border="1">
                                                            <tr>
                                                                <td>번호</td>
                                                                <td>이름</td>
                                                                <td>성별</td>
                                                                <td>연락처</td>
                                                                <td>바로가기 링크</td>
                                                            </tr>
                                                            <%-- rownum, 이름, 연락처, 바로가기 링크 가져오기 --%>
                                                            <c:forEach var="student" items="${list}">
                                                                <tr>
                                                                    <td>${student.rownum}</td>
                                                                    <td>${student.name}</td>
                                                                    <td>${student.gender}</td>
                                                                    <td>${student.phone}</td>
                                                                    <td>
                                                                        <a href="<c:url value='/admin/stduent-detail/${student.userId}' />">바로가기</a>
                                                                    </td>
                                                                </tr>
                                                            </c:forEach>
                                                        </table>

                                                    </div>

                                                </div>
                                            </div><!-- End Reports -->

                                            <!-- Recent Sales -->
                                            <div class="col-12">
                                                <div class="card recent-sales overflow-auto">

                                                    <div class="filter">
                                                        <a class="icon" href="#" data-bs-toggle="dropdown"><i class="bi bi-three-dots"></i></a>
                                                        <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
                                                            <li class="dropdown-header text-start">
                                                                <h6>Filter</h6>
                                                            </li>

                                                            <li><a class="dropdown-item" href="#">Today</a></li>
                                                            <li><a class="dropdown-item" href="#">This Month</a></li>
                                                            <li><a class="dropdown-item" href="#">This Year</a></li>
                                                        </ul>
                                                    </div>

                                                    <div class="card-body">
                                                        <h5 class="card-title">Recent Sales <span>| Today</span></h5>

                                                        <table class="table table-borderless datatable">
                                                            <thead>
                                                            <tr>
                                                                <th scope="col">#</th>
                                                                <th scope="col">Customer</th>
                                                                <th scope="col">Product</th>
                                                                <th scope="col">Price</th>
                                                                <th scope="col">Status</th>
                                                            </tr>
                                                            </thead>
                                                            <tbody>
                                                            <tr>
                                                                <th scope="row"><a href="#">#2457</a></th>
                                                                <td>Brandon Jacob</td>
                                                                <td><a href="#" class="text-primary">At praesentium minu</a></td>
                                                                <td>$64</td>
                                                                <td><span class="badge bg-success">Approved</span></td>
                                                            </tr>
                                                            <tr>
                                                                <th scope="row"><a href="#">#2147</a></th>
                                                                <td>Bridie Kessler</td>
                                                                <td><a href="#" class="text-primary">Blanditiis dolor omnis similique</a></td>
                                                                <td>$47</td>
                                                                <td><span class="badge bg-warning">Pending</span></td>
                                                            </tr>
                                                            <tr>
                                                                <th scope="row"><a href="#">#2049</a></th>
                                                                <td>Ashleigh Langosh</td>
                                                                <td><a href="#" class="text-primary">At recusandae consectetur</a></td>
                                                                <td>$147</td>
                                                                <td><span class="badge bg-success">Approved</span></td>
                                                            </tr>
                                                            <tr>
                                                                <th scope="row"><a href="#">#2644</a></th>
                                                                <td>Angus Grady</td>
                                                                <td><a href="#" class="text-primar">Ut voluptatem id earum et</a></td>
                                                                <td>$67</td>
                                                                <td><span class="badge bg-danger">Rejected</span></td>
                                                            </tr>
                                                            <tr>
                                                                <th scope="row"><a href="#">#2644</a></th>
                                                                <td>Raheem Lehner</td>
                                                                <td><a href="#" class="text-primary">Sunt similique distinctio</a></td>
                                                                <td>$165</td>
                                                                <td><span class="badge bg-success">Approved</span></td>
                                                            </tr>
                                                            </tbody>
                                                        </table>

                                                    </div>

                                                </div>
                                            </div><!-- End Recent Sales -->

                                            <!-- Top Selling -->
                                            <div class="col-12">
                                                <div class="card top-selling overflow-auto">

                                                    <div class="filter">
                                                        <a class="icon" href="#" data-bs-toggle="dropdown"><i class="bi bi-three-dots"></i></a>
                                                        <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
                                                            <li class="dropdown-header text-start">
                                                                <h6>Filter</h6>
                                                            </li>

                                                            <li><a class="dropdown-item" href="#">Today</a></li>
                                                            <li><a class="dropdown-item" href="#">This Month</a></li>
                                                            <li><a class="dropdown-item" href="#">This Year</a></li>
                                                        </ul>
                                                    </div>

                                                    <div class="card-body pb-0">
                                                        <h5 class="card-title">Top Selling <span>| Today</span></h5>

                                                        <table class="table table-borderless">
                                                            <thead>
                                                            <tr>
                                                                <th scope="col">Preview</th>
                                                                <th scope="col">Product</th>
                                                                <th scope="col">Price</th>
                                                                <th scope="col">Sold</th>
                                                                <th scope="col">Revenue</th>
                                                            </tr>
                                                            </thead>
                                                            <tbody>
                                                            <tr>
                                                                <th scope="row"><a href="#"><img src="assets/img/product-1.jpg" alt=""></a></th>
                                                                <td><a href="#" class="text-primary fw-bold">Ut inventore ipsa voluptas nulla</a></td>
                                                                <td>$64</td>
                                                                <td class="fw-bold">124</td>
                                                                <td>$5,828</td>
                                                            </tr>
                                                            <tr>
                                                                <th scope="row"><a href="#"><img src="assets/img/product-2.jpg" alt=""></a></th>
                                                                <td><a href="#" class="text-primary fw-bold">Exercitationem similique doloremque</a></td>
                                                                <td>$46</td>
                                                                <td class="fw-bold">98</td>
                                                                <td>$4,508</td>
                                                            </tr>
                                                            <tr>
                                                                <th scope="row"><a href="#"><img src="assets/img/product-3.jpg" alt=""></a></th>
                                                                <td><a href="#" class="text-primary fw-bold">Doloribus nisi exercitationem</a></td>
                                                                <td>$59</td>
                                                                <td class="fw-bold">74</td>
                                                                <td>$4,366</td>
                                                            </tr>
                                                            <tr>
                                                                <th scope="row"><a href="#"><img src="assets/img/product-4.jpg" alt=""></a></th>
                                                                <td><a href="#" class="text-primary fw-bold">Officiis quaerat sint rerum error</a></td>
                                                                <td>$32</td>
                                                                <td class="fw-bold">63</td>
                                                                <td>$2,016</td>
                                                            </tr>
                                                            <tr>
                                                                <th scope="row"><a href="#"><img src="assets/img/product-5.jpg" alt=""></a></th>
                                                                <td><a href="#" class="text-primary fw-bold">Sit unde debitis delectus repellendus</a></td>
                                                                <td>$79</td>
                                                                <td class="fw-bold">41</td>
                                                                <td>$3,239</td>
                                                            </tr>
                                                            </tbody>
                                                        </table>

                                                    </div>

                                                </div>
                                            </div><!-- End Top Selling -->

                                        </div>
                                    </div><!-- End Left side columns -->

                                </div>
                            </section>

                        </main><!-- End #main -->
                    </div>
                </div>
            </div>
        </div>
    </section>


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
