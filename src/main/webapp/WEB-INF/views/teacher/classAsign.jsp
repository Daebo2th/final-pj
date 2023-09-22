<%--
  Created by IntelliJ IDEA.
  User: KOSA
  Date: 2023-09-21
  Time: 오후 6:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>교육생 관리</title>

    <jsp:include page="../include/commonCss.jsp"/>

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
    <link rel="stylesheet" href="/resources/css/chatting.css">
    <style>
        .page-link{
            color:#28a745 !important;
        }

        .page-item.active .page-link {
            z-index: 1;
            color: #fff !important;
            background-color: #28a745 !important;
            border-color: #28a745 !important;
        }
    </style>
</head>
<body>
<%@include file="../include/header.jsp" %>
<%@include file="../include/aside.jsp" %>


<section class="section">
    <div class="row">
        <div class="col-xl-12">
            <div class="card">
                <div class="card-body pt-3">
                    <main id="main" class="main">

                        <div class="pagetitle">
                            <h1>CLASS 관리</h1>
                            <nav>
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="/">Home</a></li>
                                    <li class="breadcrumb-item active">CLASS 배정</li>
                                </ol>
                            </nav>
                        </div><!-- End Page Title -->

                        <p></p>
                        <section class="section dashboard">
                            <div class="card">
                                <div class="card-body">
                                    <%--<h1 class="card-title">대보2기 학생 명단</h1>--%>
                                    <!-- Table with hoverable rows -->
                                <form>
                                    <table class="table table-hover">
                                        <thead>
                                        <tr>
                                            <th scope="col">#</th>
                                            <th scope="col">아이디</th>
                                            <th scope="col">이름</th>
                                            <th scope="col">그룹지정</th>
                                            <th>확정</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach var="list" items="${list}" varStatus="status">
                                            <tr>
                                                <td>${status.count}</td>
                                                <td>${list.userId}</td>
                                                <td>${list.name}</td>
                                                <td>
                                                    <select name="groupSeq" id="">
                                                        <option value="" selected>미배정</option>
                                                        <c:forEach var="group" items="${groupList}">
                                                            <option value="${group.groupSeq}">${group.groupName}</option>
                                                        </c:forEach>
                                                    </select>
                                                </td>
                                                <td><input type="button" data-userid="${list.userId}" onclick="classUpdateBtn(this)"></td>
                                            </tr>
                                        </c:forEach>

                                        </tbody>
                                    </table>
                                </form>

                                    <!-- End Table with hoverable rows -->
                                </div>
                            </div> <%--End Card--%>
                        </section>
                        <div id="pageNation" style="display: flex;justify-content: space-evenly;">
                            <nav aria-label="Page navigation example">
                                <ul class="pagination">
                                    <c:if test="${pagingVO.nowPage > 1}">
                                        <li class="page-item">
                                            <!-- 아래 라인에서 쿼리 문자열 시작 부분에 &가 누락되었습니다. -->
                                            <a class="page-link" href="?nowPage=${pagingVO.nowPage - 1}" aria-label="Previous">
                                                <span aria-hidden="true">&laquo;</span>
                                            </a>
                                        </li>
                                    </c:if>

                                    <!-- 시작페이지부터 끝페이지까지 반복 -->
                                    <c:forEach varStatus='status' begin='${pagingVO.startPage}' end='${pagingVO.endPage}'>
                                        <!-- 현재 페이지일 경우 'active' 클래스 적용 -->
                                        <c:choose>
                                            <c:when test="${status.index == pagingVO.nowPage}">
                                                <li class='page-item active'><a class='page-link'>${status.index}</a></li>
                                            </c:when>
                                            <c:otherwise><li class='page-item'><a class='page-link' href="?nowPage=${status.index}">${status.index}</a></li></c:otherwise>
                                        </c:choose>
                                    </c:forEach>

                                    <!-- 다음 버튼 -->
                                    <!-- 마지막 페이지가 아닌 경우만 '다음' 버튼을 보여줍니다. -->
                                    <c:if test="${pagingVO.nowPage != pagingVO.lastPage}">
                                        <li class="page-item">
                                            <a class="page-link" href="?nowPage=${pagingVO.nowPage + 1}" aria-label="Next">
                                                &raquo;
                                            </a>
                                        </li>
                                    </c:if>

                                </ul>
                            </nav><!-- End Pagination with icons -->
                        </div>
                    </main><!-- End #main -->
                </div>
            </div>
        </div>
    </div>
</section>




<%@include file="../include/footer.jsp" %>

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
<script>
    function classUpdateBtn(button){
        let userInfo = {};
        userInfo.userId = button.getAttribute("data-userid");
        userInfo.groupSeq = button.parentElement.parentElement.querySelector("select[name='groupSeq']").value;

        $.ajax({
            url: "/api/userclassupdate",
            type: "PUT",
            data: JSON.stringify(userInfo),
            contentType: "application/json",
            dataType: 'json'
        }).done(function (data) {
            //var result = jQuery.parseJSON(data);
            console.log(data.status);
            if (data.status == 'true') {
                swal(data.msg);
                location.href="/teacher/nogroupuser"
                return;
            }
            swal(data.msg)
        }).fail(function (e) {
            console.log(e);
        });
    }
</script>
</body>
</html>
