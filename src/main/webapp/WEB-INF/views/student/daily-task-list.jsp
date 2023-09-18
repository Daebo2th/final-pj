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
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

    <!-- moment.js -->
    <script src="${pageContext.request.contextPath}/resources/js/moment.js"></script>

   <!-- fullcalendar CDN -->
    <link href='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.css' rel='stylesheet' />
    <script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.js'></script>
    <!-- fullcalendar 언어 CDN -->
    <script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/locales-all.min.js'></script>
    <script>
        $(document).ready(function() {
            $('.dropdown-item').click(function(e) {
                e.preventDefault();
                var value = $(this).attr('data-value');  // 선택한 항목의 'data-value' 속성값 가져오기
                $('#searchCondition').val(value);  // 숨겨진 입력 필드에 값 설정하기

                var text = $(this).text();  // 선택한 항목의 텍스트 가져오기
                $('#dropdownMenuButton').text(text);  // '검색조건' 버튼의 텍스트 변경하기
              /*  $("#dateInput").remove();   // 만약 이미 존재하는 date input이 있다면 제거*/
                if (value === 'createDate') {  // 만약 '작성일'이 선택되었다면...
                    $('#searchKeyword').attr('type', 'date');  // 검색어 입력 필드의 타입을 'date'로 변경
                }else if (value === 'updateDate') {  // 만약 '작성일'이 선택되었다면...
                    $('#searchKeyword').attr('type', 'date');  // 검색어 입력 필드의 타입을 'date'로 변경
                } else {
                    $('#searchKeyword').attr('type', 'search');  // 그 외 경우에는 검색어 입력 필드의 타입을 원래대로 ('search') 복원

                }
            });
        });
    </script>
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
        .confirmed {
            color: red;
        }
        .unconfirmed {
            color: green;
        }
        .center {
            text-align: center;
            font-family: monospace;
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
        <h1>My Daily Task List</h1>
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="index.html">Home</a></li>
                <li class="breadcrumb-item active">List</li>
            </ol>
        </nav>
    </div><!-- End Page Title -->

    <section class="section">
        <div id="contents">
            <div class="page-title">
                <div class="container">
                    <h3>일일과제 목록</h3>
                </div>
            </div>

            <!-- board seach area -->
            <div id="board-search">
                <div class="container">
                    <div class="search-window">
                        <form action="/student/daily-task-list" method="get">
                            <div class="dropdown">
                                <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="width: 150px; height: 40px;">
                                 검색조건
                                </button>
                                <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                    <a class="dropdown-item" data-value="title">제목</a>
                                    <a class="dropdown-item" data-value="createDate">작성일</a>
                                    <a class="dropdown-item" data-value="updateDate">수정일</a>
                                </div>
                            </div>
                             <input type='hidden' name='searchCondition' id='searchCondition'>

                            <div class="search-wrap">
                                <label for="searchKeyword" class="blind">내용 검색</label>
                                <input id="searchKeyword" type="search" name="searchKeyword" placeholder="검색어를 입력해주세요." value="">

                            </div>
                            <button type="submit" class="btn btn-dark">검색</button>
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
                            <th scope="col" class="th-num">번호</th>
                            <th scope="col" class="th-title">제목</th>
                            <th scope="col" class="th-date">작성일</th>
                            <th scope="col" class="th-date">수정일</th>
                            <th scope="col" class="th-date">상태</th>
                        </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${taskUserList}" var="dailyTask">
                                <tr>
                                <td>${dailyTask.rownum}</td>
                                    <input type='hidden' name='taskSeq' id='taskSeq' value="${taskSeq}">
                                <td><a href="/student/daily-task-detail?taskSeq=${dailyTask.taskSeq}">${dailyTask.title}</td>
                                <td><fmt:formatDate value="${dailyTask.createDate}" pattern="yyyy-MM-dd hh:mm"/></td>
                                <td><fmt:formatDate value="${dailyTask.updateDate}" pattern="yyyy-MM-dd hh:mm"/></td>
                                <td>
                                    <span class="${dailyTask.status == '1' ? 'confirmed' : ''}">
                                         ${dailyTask.status == '1' ? '확인' : '미확인'}
                                    </span>
                                </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                   <%-- <button id="checkStatus" type="button" class="btn btn-dark">제출 확인 완료</button>--%>
                </div>
            </div>
        </div>

    </section>

    <div id="pageNation" style="display: flex;justify-content: space-evenly;">
        <nav aria-label="Page navigation example">
            <ul class="pagination">
                <c:if test="${pagingVO.nowPage != 1}">
                    <li class="page-item">
                        <a class="page-link" href="?nowPage=${pagingVO.nowPage - 1}" aria-label="Previous">
                            <span aria-hidden="true">&laquo;</span>
                        </a>
                    </li>
                </c:if>

                <c:forEach var="i" begin="${pagingVO.startPage}" end="${pagingVO.endPage}">
                    <c:choose>
                        <c:when test="${i == pagingVO.nowPage}">
                            <li class='page-item active'><a class='page-link' href='#'>${i}</a></li>
                        </c:when>
                        <c:otherwise><li class='page-item'><a class='page-link' href='?nowPage=${i}'>${i}</a></li></c:otherwise>
                    </c:choose>
                </c:forEach>

                <!-- 다음 버튼 -->
                <c:if test="${pagingVO.nowPage != pagingVO.lastPage}">
                    <li class="page-item">
                        <a class="page-link" href="?nowPage=${pagingVO.nowPage + 1}" aria-label="Next">
                            <span aria-hidden="true">&raquo;</span>
                        </a>
                    </li>
                </c:if>
            </ul>
        </nav><!-- End Pagination with icons -->
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
<script src="/resources/task.js"></script>
<!-- Template Main JS File -->
<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>

</body>
</html>
