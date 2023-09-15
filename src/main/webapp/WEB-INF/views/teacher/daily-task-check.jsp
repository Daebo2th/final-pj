<%--
  Created by IntelliJ IDEA.
  User: KOSA
  Date: 2023-09-06
  Time: 오전 10:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
    <title>일일과제현황</title>

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

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

    <style>
        .breadcrumb { background-color: white;}
    </style>

    <title>Hello, world!</title>
    <!-- jquery CDN -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <!-- moment.js -->
    <script src="${pageContext.request.contextPath}/resources/js/moment.js"></script>
    <!-- fullcalendar CDN -->
    <link href='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.css' rel='stylesheet' />
    <script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.js'></script>
    <!-- fullcalendar 언어 CDN -->
    <script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/locales-all.min.js'></script>
    <style>
        /* body 스타일 */
        html, body {
            overflow: hidden;
            font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
            font-size: 14px;
        }
        /* 캘린더 위의 해더 스타일(날짜가 있는 부분) */
        .fc-header-toolbar {
            padding-top: 1em;
            padding-left: 1em;
            padding-right: 1em;
        }
        .w3-pagination {
            display: flex;
            justify-content: center;
        }
    </style>
    <link rel="stylesheet" type="text/css" href="/resources/css/daily-task.css">
</head>
<body>
<%@include file="../include/header.jsp"%>
<%@include file="../include/aside.jsp"%>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

<main id="main" class="main">

    <div class="pagetitle">
        <h1>일일과제 현황</h1>
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="index.html">Home</a></li>
                <li class="breadcrumb-item active">일일과제</li>
            </ol>
        </nav>
    </div><!-- End Page Title -->

    <section class="section">
        <div id="contents">
            <div class="page-title">
                <div class="container">
                    <h3>대보2기 일일과제 목록 </h3>
                </div>
            </div>

            <!-- board seach area -->
            <div id="board-search">
                <div class="container">
                    <div class="search-window">
                        <form action="">
                            <div class="search-wrap">
                                <label for="search" class="blind">공지사항 내용 검색</label>
                                <input id="search" type="search" name="" placeholder="검색어를 입력해주세요." value="">
                                <button type="submit" class="btn btn-dark">검색</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>

            <!-- board list area -->
            <div id="board-list">
                <div class="container">
                    <table class="board-table">
                        <thead>
                        <tr>
                            <th scope="col" class="th-num">이름</th>
                            <th scope="col" class="th-title">제목</th>
                            <th scope="col" class="th-date">등록일</th>
                            <th scope="col" class="th-date">상태</th>
                        </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${groupTasks}" var="groupTasks">
                                <tr>
                                    <td>${groupTasks.userId}</td>
                                    <td><a href="/teacher/daily-task-detail?taskSeq=${groupTasks.taskSeq}">${groupTasks.title}</td>
                                    <td><fmt:formatDate value="${groupTasks.updateDate}" pattern="yyyy-MM-dd"/></td>
                                    <input type="hidden" name="taskSeq" value="${groupTasks.taskSeq}" />
                                    <td><input type="checkbox" value="${groupTasks.status}" ${groupTasks.status == '1'? 'checked':''} /></td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                    <div id="chkbtn" style="display: flex; justify-content: flex-end">
                        <button id="checkStatus" type="button" class="btn btn-dark">제출 확인 완료</button>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <div class="w3-center">
        <ul class="w3-pagination">
            <li><a href="#">&laquo;</a></li>
            <li><a class="w3-green" href="#">1</a></li>
            <li><a href="#">2</a></li>
            <li><a href="#">3</a></li>
            <li><a href="#">4</a></li>
            <li><a href="#">5</a></li>
            <li><a href="#">&raquo;</a></li>
        </ul>
    </div>

</main>




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
<script>
    $(document).ready(function() {
        $('#checkStatus').click(function() {
            var successCount = 0;  // 성공적으로 처리된 체크박스의 수를 추적하는 카운터
            $('input[type="checkbox"]').each(function() {
                /*if ($(this).is(':checked')) {*/
                    var status = $(this).is(':checked') ? '1' : '0'; // 체크박스 상태에 따라 status 값 변경
                    var taskSeq = $(this).closest('tr').find('input[name=taskSeq]').val();

                    $.ajax({
                        url: '/teacher/updateTaskStatus',
                        type: 'POST',
                        contentType: 'application/json',  // 추가
                        data: JSON.stringify({status: status, taskSeq: taskSeq}),  // 수정
                        success: function(response) {
                            // 요청이 성공적으로 완료된 후 수행할 작업을 여기에 작성합니다.
                            console.log(response);
                            successCount++;
                        },
                        error: function(jqXHR, textStatus, errorThrown) {
                            // 요청이 실패했을 때 수행할 작업을 여기에 작성합니다.
                            console.error(textStatus + " " + errorThrown);
                        }
                    });
               /* }*/
            });
            // 모든 AJAX 요청이 완료되면 alert을 표시합니다.
            $(document).ajaxStop(function () {
                if (successCount > 0) {
                    alert("상태 업데이트가 완료되었습니다.");
                }
                $(document).off("ajaxStop");  // 이 이벤트 핸들러를 제거합니다.
            });
        });
    });
</script>
</body>
</html>
