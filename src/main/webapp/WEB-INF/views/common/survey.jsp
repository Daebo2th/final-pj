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

  <jsp:include page="../include/commonCss.jsp"/>

  <!-- Template Main CSS File -->
  <link href="${pageContext.request.contextPath}/resources/css/style.css" rel="stylesheet">
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

<jsp:include page="../include/footer.jsp"/>

<!-- Template Main JS File -->
<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
</body>
</html>


