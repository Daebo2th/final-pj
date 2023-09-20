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
<!DOCTYPE html>
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
  <!-- jquery CDN -->
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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
    .center {
      text-align: center;
      font-family: monospace;
    }
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
        <li class="breadcrumb-item"><a href="/">Home</a></li>
        <li class="breadcrumb-item active">일일과제</li>
      </ol>
    </nav>
  </div><!-- End Page Title -->

  <section class="section">
    <div id="contents">
      <div class="page-title">
        <div class="container">
          <h3>${taskUserList[0].author} 일일과제 목록 </h3>

        </div>
      </div>

      <div id="board-search">
        <div class="container">
          <div class="search-window">
            <form action="/teacher/student-daily-task-list" method="get">
              <div class="search-wrap">
                <div class="dropdown">
                  <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="width: 150px; height: 40px;">
                    검색조건
                  </button>
                  <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                    <a class="dropdown-item" data-value="title">제목</a>
                    <a class="dropdown-item" data-value="author">작성자</a>
                    <a class="dropdown-item" data-value="createDate">작성일</a>
                  </div>
                </div>
                <input type='hidden' name='searchCondition' id='searchCondition'>
                <input type="hidden" name="studentUserId" value="${userId}" />

                <label for="searchKeyword" class="blind">내용 검색</label>
                <input id="searchKeyword" type="search" name="searchKeyword" placeholder="검색어를 입력해주세요." value="">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
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
            <c:forEach items="${taskUserList}" var="taskUserList">
              <tr>
                <td>${taskUserList.author}</td>
                <td><a href="/teacher/daily-task-detail?taskSeq=${taskUserList.taskSeq}">${taskUserList.title}</td>
                <td><fmt:formatDate value="${taskUserList.updateDate}" pattern="yyyy-MM-dd"/></td>
                <input type="hidden" name="taskSeq" value="${taskUserList.taskSeq}" />
                <td><input type="checkbox" value="${taskUserList.status}" ${taskUserList.status == '1'? 'checked':''} /></td>
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

  <div id="pageNation" style="display: flex;justify-content: space-evenly;">
    <nav aria-label="Page navigation example">
      <ul class="pagination">
        <c:if test="${pagingVO.nowPage > 1}">
          <li class="page-item">
            <a class="page-link" href="?nowPage=${pagingVO.nowPage - 1}&studentUserId=${userId}&searchCondition=${param.searchCondition}&searchKeyword=${param.searchKeyword}" aria-label="Previous">
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
            <c:otherwise><li class='page-item'><a class='page-link' href="?nowPage=${status.index}&studentUserId=${userId}&searchCondition=${param.searchCondition}&searchKeyword=${param.searchKeyword}">${status.index}</a></li></c:otherwise>
          </c:choose>
        </c:forEach>

        <!-- 다음 버튼 -->
        <!-- 마지막 페이지가 아닌 경우만 '다음' 버튼을 보여줍니다. -->
        <c:if test="${pagingVO.nowPage != pagingVO.lastPage}">
          <li class="page-item">
            <a class="page-link" href="?nowPage=${pagingVO.nowPage + 1}&studentUserId=${userId}&searchCondition=${param.searchCondition}&searchKeyword=${param.searchKeyword}" aria-label="Next">
              &raquo;
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
          swal({
            text: "상태 업데이트가 완료되었습니다.", buttons: "확인", closeOnClickOutside: false
          }).then(function (){
            $(document).off("ajaxStop");  // 이 이벤트 핸들러를 제거합니다.
          })
        }

      });
    });
  });
</script>
</body>
</html>