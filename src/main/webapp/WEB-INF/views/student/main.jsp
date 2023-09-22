<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>

    <jsp:include page="../include/commonCss.jsp"/>

    <!-- Template Main CSS File -->
    <link href="${pageContext.request.contextPath}/resources/css/style.css"
          rel="stylesheet">
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
<%@include file="../include/header.jsp" %>
<%@include file="../include/aside.jsp" %>
<%-- <c:if test="${user[0] != null}">
    <c:choose>
        <c:when test="${user[0] == 'ROLE_ADMIN'}">
                       <c:redirect url="/teacher" />
        </c:when>
        <c:when test="${user[0] == 'ROLE_USER'}">
                       <c:redirect url="/student" />
        </c:when>
        <c:when test="${user[0] == 'ROLE_GUEST'}">

        </c:when>
    </c:choose>
</c:if> --%>

<main id="main" class="main">

    <div class="pagetitle">
        <h1>Main</h1>
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="/">Home</a></li>
                <li class="breadcrumb-item active">Main</li>
            </ol>
        </nav>
    </div>
    <!-- End Page Title -->

    <section class="section">
        <div class="row">
            <section class="section dashboard">
                <div class="row">

                    <!-- Left side columns -->
                    <div class="col-lg-8">
                        <div class="row">

                            <!-- Sales Card -->
                            <div class="col-xxl-4 col-md-6"></div>

                            <!-- Reports -->
                            <div class="card">
                                <div class="card-body">
                                    <h5 class="card-title">나의 과제 현황</h5>

                                    <!-- Default Table -->
                                    <table class="table">
                                        <thead>
                                        <tr>
                                            <th scope="col">번호</th>
                                            <th scope="col">제목</th>
                                            <th scope="col">작성일</th>
                                            <th scope="col">수정일</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${task }" var="task" begin="0" end="4">
                                            <c:set var="i" value="${i + 1 }"/>
                                        <tr>
                                            <th scope="row">${i }</th>
                                            <td>
                                                <a href="/student/daily-task-detail?taskSeq=${task.TASK_SEQ}">${task.TITLE }
                                            </td>
                                            <td><fmt:formatDate value="${task.CREATE_DATE }"
                                                                pattern="yyyy-MM-dd hh:mm"/></td>
                                            <td><fmt:formatDate value="${task.UPDATE_DATE }"
                                                                pattern="yyyy-MM-dd hh:mm"/></td>
                                        </tr>
                                        </c:forEach>
                                    </table>
                                    <!-- End Default Table Example -->
                                </div>
                            </div>
                            <!-- End Reports -->
                            <!-- Reports -->
                            <div class="col-12">
                                <div class="card">
                                    <div class="card-body">
                                        <h5 class="card-title">
                                            과제 제출 현황
                                        </h5>

                                        <!-- Line Chart -->
                                        <div id="reportsChart"></div>

                                        <script>
                                            document.addEventListener("DOMContentLoaded", () => {
                                                var options = {
                                                    series: [{
                                                        name: '과제제출수',
                                                        data: [
                                                            <c:forEach var="count" items="${count}" varStatus="status">
                                                            ${count.COUNT}<c:if test="${!status.last}">, </c:if>
                                                            </c:forEach>
                                                        ],
                                                    }],
                                                    chart: {
                                                        height: 350,
                                                        type: 'bar',
                                                        toolbar: {show: true},
                                                    },
                                                    colors: ['#008ffb', '#00e396', '#feb019', '#ff4560', '#775dd0', '#546e7a', '#26a69a', '#d10ce8'],
                                                    plotOptions: {
                                                        bar: {
                                                            columnWidth: '45%',
                                                            distributed: true,
                                                        }
                                                    },
                                                    dataLabels: {enabled: false},
                                                    legend: {show: false},
                                                    xaxis: {
                                                        categories: [
                                                            <c:forEach var="count" items="${count}" varStatus="status">
                                                            "${count.NAME}"<c:if test="${!status.last}">, </c:if>
                                                            </c:forEach>
                                                        ],
                                                        labels: {
                                                            style: {
                                                                colors: ['#008ffb', '#00e396', '#feb019', '#ff4560', '#775dd0', '#546e7a', '#26a69a', '#d10ce8'],
                                                                fontSize: '12px'
                                                            }
                                                        }
                                                    }
                                                };

                                                var chart = new ApexCharts(document.querySelector("#reportsChart"), options);
                                                chart.render();
                                            });

                                        </script>
                                        <!-- End Line Chart -->

                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4">

                        <!-- Recent Activity -->
                        <div class="card">
                            <div class="card-body-taskStatus">
                                <h5 class="card-title">
                                    미확인 과제
                                </h5>
                                <c:forEach items="${taskStatus }" var="taskStatus">
                                    <div class="activity">

                                        <div class="activity-item d-flex">
                                            <div class="activite-label">${taskStatus.CREATE_DATE }</div>
                                            <i
                                                    class='bi bi-circle-fill activity-badge text-success align-self-start'></i>
                                            <div class="activity-content">
                                                <a href="/student/daily-task-list"
                                                   class="fw-bold text-dark">${taskStatus.NAME }</a>
                                                    ${taskStatus.TITLE }
                                            </div>
                                            <hr>
                                        </div>
                                        <!-- End activity item-->
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                        <!-- End Recent Activity -->
                        <div class="card">
                            <div class="card-body pb-0">
                                <h5 class="card-title">도움말</h5>

                                <div class="news">
                                    <div class="post-item clearfix">
                                        <img src="/resources/img/일일과제.png" alt="">
                                        <h4>
                                            <a href="/student/daily-task">일일과제 작성</a>
                                        </h4>
                                        <p>일일과제 메뉴에 일일과제 작성 기능을 활용해 쉽고 간편하게 일일과제를 작성 할 수 있습니다.</p>
                                    </div>

                                    <div class="post-item clearfix">
                                        <img src="/resources/img/캘린더.png" alt="">
                                        <h4>
                                            <a href="/schedule">캘린더</a>
                                        </h4>
                                        <p>일정관리 메뉴에 캘린더 기능을 활용하여 일정을 관리하고 확인 할 수 있습니다.</p>
                                    </div>

                                    <div class="post-item clearfix">
                                        <img src="resources/img/투두리스트.png" alt="">
                                        <h4>
                                            <a href="/student/todolist">ToDoList</a>
                                        </h4>
                                        <p>일정관리 메뉴에 ToDoList 기능을 활용하여 해야 할 일을 정리하고 확인 할 수 있습니다.</p>
                                    </div>

                                    <div class="post-item clearfix">
                                        <img src="resources/img/자료공유실.png" alt="">
                                        <h4>
                                            <a href="/class/${principal.groupSeq}/dataSharingRoom">자료 공유실</a>
                                        </h4>
                                        <p>자료 공유실 기능을 활용하여 교육시 참고할만한 자료들과 정보들을 공유 할 수
                                            있습니다.</p>
                                    </div>

                                    <div class="post-item clearfix">
                                        <img src="resources/img/만족도조사.png" alt="">
                                        <h4>
                                            <a href="/common/survey">만족도 조사</a>
                                        </h4>
                                        <p>교육에 대한 만족도 조사와 교사 평가서를 교육생이 작성하여 제출 할
                                            수 있습니다.</p>
                                    </div>

                                </div>
                                <!-- End sidebar recent posts-->

                            </div>
                        </div>
                        <!-- End News & Updates -->
                    </div>
                </div>

            </section>
        </div>

    </section>

</main>


<jsp:include page="../include/footer.jsp"/>
<script type="text/javascript">
    $(document).ready(function () {
        moment.locale('ko'); // 한국어로 설정

        $(".activite-label").each(function (i, obj) {
            var dateText = $(obj).text().trim();
            var date = moment(dateText, "YYYYMMDDHHmmss").fromNow();
            $(obj).text(date);
        });
    });
</script>

</body>
</html>