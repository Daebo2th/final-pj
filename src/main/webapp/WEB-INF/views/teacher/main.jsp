<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>JSP - Hello World</title>

<!-- Favicons -->
<link
	href="${pageContext.request.contextPath}/resources/img/favicon.png"
	rel="icon">
<link
	href="${pageContext.request.contextPath}/resources/img/apple-touch-icon.png"
	rel="apple-touch-icon">

<!-- Google Fonts -->
<link href="https://fonts.gstatic.com" rel="preconnect">
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
	rel="stylesheet">

<!-- Vendor CSS Files -->
<link
	href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/vendor/bootstrap-icons/bootstrap-icons.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/vendor/boxicons/css/boxicons.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/vendor/quill/quill.snow.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/vendor/quill/quill.bubble.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/vendor/remixicon/remixicon.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/vendor/simple-datatables/style.css"
	rel="stylesheet">

<!-- Template Main CSS File -->
<link href="${pageContext.request.contextPath}/resources/css/style.css"
	rel="stylesheet">

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- moment.js -->
<script src="${pageContext.request.contextPath}/resources/js/moment.js"></script>

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
	<%@include file="../include/header.jsp"%>
	<%@include file="../include/aside.jsp"%>
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
								<div class="col-xxl-4 col-md-6">
									<div class="card info-card sales-card">
										<div class="card-body">
											<h5 class="card-title">
												확인한 과제 수
											</h5>

											<div class="d-flex align-items-center">
												<div
													class="card-icon rounded-circle d-flex align-items-center justify-content-center">
													<i class="bi bi-journal-check"></i>
												</div>
												<div class="ps-3">
													<h6>${countTasksOk }개</h6>
													<span class="text-success small pt-1 fw-bold">12%</span> <span
														class="text-muted small pt-2 ps-1">increase</span>

												</div>
											</div>
										</div>

									</div>
								</div>
								<!-- End Sales Card -->

								<!-- Revenue Card -->
								<div class="col-xxl-4 col-md-6">
									<div class="card info-card revenue-card">
										<div class="card-body">
											<h5 class="card-title">
												미확인 과제 수
											</h5>

											<div class="d-flex align-items-center">
												<div
													class="card-icon rounded-circle d-flex align-items-center justify-content-center">
													<i class="bi bi-journal-x"></i>
												</div>
												<div class="ps-3">
													<h6>${countTasks }개</h6>
													<span class="text-success small pt-1 fw-bold">8%</span> <span
														class="text-muted small pt-2 ps-1">increase</span>

												</div>
											</div>
										</div>

									</div>
								</div>
								<!-- End Revenue Card -->

								<!-- Customers Card -->
								<div class="col-xxl-4 col-xl-12">

									<div class="card info-card customers-card">

										<div class="card-body">
											<h5 class="card-title">
												학생수
											</h5>

											<div class="d-flex align-items-center">
												<div
													class="card-icon rounded-circle d-flex align-items-center justify-content-center">
													<i class="bi bi-people"></i>
												</div>
												<div class="ps-3">
													<h6 id="userCount">${user }명</h6>
													<span class="text-danger small pt-1 fw-bold">12%</span> <span
														class="text-muted small pt-2 ps-1">decrease</span>

												</div>
											</div>

										</div>
									</div>

								</div>
								<!-- End Customers Card -->

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
											                    ${count.COUNT}<c:if test="${!status.last}">,</c:if>
											                </c:forEach>
											            ],
											        }],
											        chart:{
											            height:350,
											            type:'bar',
											            toolbar:{ show:true },
											        },
											        colors:['#008ffb','#00e396','#feb019','#ff4560','#775dd0','#546e7a','#26a69a','#d10ce8'],
											        plotOptions:{
											          bar:{
											              columnWidth:'45%',
											              distributed:true,
											          }
											      },
											      dataLabels:{ enabled:false },
											      legend:{ show:false },
											      xaxis:{
											           categories:[
											               <c:forEach var="count" items="${count}" varStatus="status">
											                   "${count.NAME}"<c:if test="${!status.last}">,</c:if>
											               </c:forEach>
											           ],
											           labels:{
											               style:{
											                   colors:['#008ffb', '#00e396', '#feb019', '#ff4560', '#775dd0', '#546e7a', '#26a69a', '#d10ce8'],
											                   fontSize:'12px'
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
								<!-- End Reports -->

							</div>
						</div>
						<div class="col-lg-4">

							<!-- Recent Activity -->
							<div class="card">
								<div class="card-body">
									<h5 class="card-title">
										미확인 과제 
									</h5>
									<c:forEach items="${noCount }" var="noCount">
										<div class="activity">

											<div class="activity-item d-flex">
												<div class="activite-label">${noCount.CREATE_DATE }</div>
												<i
													class='bi bi-circle-fill activity-badge text-success align-self-start'></i>
												<div class="activity-content">
													<a href="/teacher/daily-task-check" class="fw-bold text-dark">${noCount.NAME }</a>
													${noCount.TITLE }
												</div>
												<hr>
											</div>
											<!-- End activity item-->
										</div>
									</c:forEach>
								</div>
							</div>
							<!-- End Recent Activity -->
						</div>
					</div>

				</section>
			</div>

		</section>

	</main>


	<%@include file="../include/footer.jsp"%>

	<!-- Vendor JS Files -->
	<script
		src="${pageContext.request.contextPath}/resources/vendor/apexcharts/apexcharts.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/vendor/chart.js/chart.umd.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/vendor/echarts/echarts.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/vendor/quill/quill.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/vendor/simple-datatables/simple-datatables.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/vendor/tinymce/tinymce.min.js"></script>

	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment-with-locales.min.js"></script>
	<script type="text/javascript">
    $(document).ready(function(){
        moment.locale('ko');  // 한국어로 설정

        $(".activite-label").each(function(i,obj) {
            var dateText = $(obj).text().trim();
            var date = moment(dateText, "YYYYMMDDHHmmss").fromNow();
            $(obj).text(date);
        });
    }); 
</script>

</body>
</html>