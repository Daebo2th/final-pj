<%--
  Created by IntelliJ IDEA.
  User: KOSA
  Date: 2023-09-19
  Time: 오후 2:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <title>만족도 조사</title>
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
  <link rel="stylesheet" href="/resources/css/chatting.css">

  <!-- Template Main CSS File -->
  <link href="${pageContext.request.contextPath}/resources/css/style.css" rel="stylesheet">

  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

  <style>
    .breadcrumb { background-color: white;}
  </style>

</head>
<body>
<%@include file="../include/header.jsp"%>
<%@include file="../include/aside.jsp"%>

<main id="main" class="main">
  <div class="pagetitle">
    <h1>만족도 조사</h1>
    <nav>
      <ol class="breadcrumb">
        <li class="breadcrumb-item"><a href="/">Home</a></li>
        <li class="breadcrumb-item active">만족도조사</li>
      </ol>
    </nav>
  </div><!-- End Page Title -->

<div id="googleForm">
  <iframe src="https://docs.google.com/forms/d/1Ldei5OhEfE5tFlGwL0jRJv8o4rPit1K1tmyglZGIuzg/viewform?embedded=true"
          width="640" height="1318" frameborder="0" marginheight="0" marginwidth="0">Loading…</iframe>

</div>
</main>
<script>
  function closeForm() {
    var form = FormApp.openById('1Ldei5OhEfE5tFlGwL0jRJv8o4rPit1K1tmyglZGIuzg');
    var responses = form.getResponses();

    if(responses.length >= 1) {
      form.setAcceptingResponses(false);
    }
  }
</script>
<%--<script>
  // 클라이언트 ID 및 리디렉션 URI를 설정합니다.
  const CLIENT_ID = '500727375065-0nav6t5btcjsotc81q4pg9tfblvvtn2e.apps.googleusercontent.com';
  const REDIRECT_URI = 'http://localhost:8081/common/survey';

  // Google API 스크립트를 로드한 후 실행할 함수
  function onGapiLoaded() {
    // API 호출 및 Google Forms를 웹 페이지에 삽입합니다.
    gapi.client.init({
      'clientId': CLIENT_ID,
      'scope': 'https://www.googleapis.com/auth/forms'
    }).then(function() {
      gapi.client.forms.forms.get({
        'formId': '1Ldei5OhEfE5tFlGwL0jRJv8o4rPit1K1tmyglZGIuzg'
      }).then(function(response) {
        const formHtml = response.result.html;
        document.getElementById('googleForm').innerHTML = formHtml;
      }, function(error) {
        console.error('Error loading Google Form:', error);
      });
    });
  }

  // Google API 스크립트를 로드합니다.
  (function() {
    var script = document.createElement('script');
    script.src = 'https://apis.google.com/js/api.js';
    script.onload = onGapiLoaded; // 스크립트 로드 후 실행할 함수 지정
    document.body.appendChild(script);
  })();
</script>--%>

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


