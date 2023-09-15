<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>

    <!-- Favicons -->
    <link href="${pageContext.request.contextPath}/resources/img/favicon.png" rel="icon">
    <link href="${pageContext.request.contextPath}/resources/img/apple-touch-icon.png" rel="apple-touch-icon">

    <!-- Google Fonts -->
    <link href="https://fonts.gstatic.com" rel="preconnect">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
          rel="stylesheet">

    <!-- Vendor CSS Files -->
    <link href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/vendor/bootstrap-icons/bootstrap-icons.css"
          rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/vendor/quill/quill.snow.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/vendor/quill/quill.bubble.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/vendor/remixicon/remixicon.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/vendor/simple-datatables/style.css" rel="stylesheet">

    <!-- Template Main CSS File -->
    <link href="${pageContext.request.contextPath}/resources/css/style.css" rel="stylesheet">

    <style>
        #container {
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        .col-xl-12 {
            margin-left: auto; /* 컨텐츠 영역을 오른쪽으로 밀어내기 */
            transition: margin-left 0.3s; /* 부드러운 이동 효과를 위한 트랜지션 설정 */
        }
    </style>
</head>
<body>
<%@include file="include/header.jsp" %>
<%@include file="include/aside.jsp" %>
<c:if test="${user[0] != null}">
    <c:choose>
        <c:when test="${user[0] == 'ROLE_ADMIN'}">
            <%--            <c:redirect url="/teacher" />--%>
        </c:when>
        <c:when test="${user[0] == 'ROLE_USER'}">
            <%--            <c:redirect url="/student" />--%>
        </c:when>
        <c:when test="${user[0] == 'ROLE_GUEST'}">

        </c:when>
    </c:choose>
</c:if>

<main id="main" class="main">

    <div class="pagetitle">
        <h1>Main</h1>
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="/">Home</a></li>
                <li class="breadcrumb-item active">Main</li>
            </ol>
        </nav>
    </div><!-- End Page Title -->

    <section class="section">
        <div class="row">
            <div class="col-xl-12">
                <div class="card">
                    <div class="card-body pt-3">
                        <div id="container">
                            <h1><%= "Hello World!" %>
                            </h1>
                            <br/>

                            <a href="hello-servlet">Hello Servlet</a>

                            <table border="1" align="center" style="width: 30%;">
                                <thead>
                                <tr>
                                    <th>아이디</th>
                                    <th>비번</th>
                                    <th>가입일</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="list" items="${test}">
                                    <tr>
                                        <td>${list.userId}</td>
                                        <td>${list.userPwd}</td>
                                        <td>${list.regDate}</td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                            <a href="/auth/logout">로그아웃</a>

                            <hr>

                            <a href="/schedule/main">일정관리 페이지</a>
                            <a href="/admin/student-record">학생기록부 페이지</a>
                            <a href="/admin/student-detail">학생 상세 정보</a>
                            <a href="/student/todolist">칸반보드</a>
                            <a href="/student/daily-task">학생 일일과제 작성 페이지</a>
                            <hr>
                            <a href="/student/SMain"> 학생 LayoutForm</a>
                            <a href="teacher/TMain"> 교직원 LayoutForm</a>
                            <a href="/index2.jsp">UI 예시</a>
                            <a href="/chat/main">채팅</a>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

</main>


<%@include file="include/footer.jsp" %>

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