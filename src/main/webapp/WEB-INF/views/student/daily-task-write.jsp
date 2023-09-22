<%@ page import="com.fasterxml.jackson.databind.ObjectMapper" %><%--
  Created by IntelliJ IDEA.
  User: KOSA
  Date: 2023-09-06
  Time: 오전 10:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ page import="com.fasterxml.jackson.databind.ObjectMapper" %>
<%@ page import="com.fasterxml.jackson.core.JsonGenerator" %>
<%@ page import="org.apache.commons.lang3.StringEscapeUtils" %>

<html>
<head>
  <title>일일과제현황</title>

  <jsp:include page="../include/commonCss.jsp"/>
  <!-- Template Main CSS File -->
  <link href="${pageContext.request.contextPath}/resources/css/style.css" rel="stylesheet">

  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

  <style>
    .breadcrumb { background-color: white;}
  </style>
  <!-- jquery CDN -->
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <!-- Editor's Style -->
  <link rel="stylesheet" href="https://uicdn.toast.com/editor/latest/toastui-editor.min.css" />
  <!-- TUI 에디터 JS CDN -->
  <script src="https://uicdn.toast.com/editor/latest/toastui-editor-all.min.js"></script>
  <!-- moment.js -->
  <script src="${pageContext.request.contextPath}/resources/js/moment.js"></script>

  <style>
    /* body 스타일 */
    html, body {
      /*overflow: hidden;*/
      font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
      font-size: 14px;
    }
    /* 캘린더 위의 해더 스타일(날짜가 있는 부분) */
    .fc-header-toolbar {
      padding-top: 1em;
      padding-left: 1em;
      padding-right: 1em;
    }
    .custom-btn {
      width: 130px;
      height: 40px;
      color: #fff;
      border-radius: 5px;
      padding: 10px 25px;
      font-family: 'Lato', sans-serif;
      font-weight: 500;
      background: transparent;
      cursor: pointer;
      transition: all 0.3s ease;
      position: relative;
      display: inline-block;
      box-shadow:inset 2px 2px 2px 0px rgba(255,255,255,.5),
      7px 7px 20px 0px rgba(0,0,0,.1),
      4px 4px 5px 0px rgba(0,0,0,.1);
      outline: none;
    }

    /* 3 */
    .btn-3 {
      background: rgb(0,172,238);
      background: linear-gradient(0deg, rgba(0,172,238,1) 0%, rgba(2,126,251,1) 100%);
      width: 130px;
      height: 40px;
      line-height: 42px;
      padding: 0;
      border: none;

    }
    .btn-3 span {
      position: relative;
      display: block;
      width: 100%;
      height: 100%;
    }
    .btn-3:before,
    .btn-3:after {
      position: absolute;
      content: "";
      right: 0;
      top: 0;
      background: rgba(2,126,251,1);
      transition: all 0.3s ease;
    }
    .btn-3:before {
      height: 0%;
      width: 2px;
    }
    .btn-3:after {
      width: 0%;
      height: 2px;
    }
    .btn-3:hover{
      background: transparent;
      box-shadow: none;
    }
    .btn-3:hover:before {
      height: 100%;
    }
    .btn-3:hover:after {
      width: 100%;
    }
    .btn-3 span:hover{
      color: rgba(2,126,251,1);
    }
    .btn-3 span:before,
    .btn-3 span:after {
      position: absolute;
      content: "";
      left: 0;
      bottom: 0;
      background: rgba(2,126,251,1);
      transition: all 0.3s ease;
    }
    .btn-3 span:before {
      width: 2px;
      height: 0%;
    }
    .btn-3 span:after {
      width: 0%;
      height: 2px;
    }
    .btn-3 span:hover:before {
      height: 100%;
    }
    .btn-3 span:hover:after {
      width: 100%;
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
    <h1>일일과제 작성</h1>
    <nav>
      <ol class="breadcrumb">
        <li class="breadcrumb-item"><a href="/">Home</a></li>
        <li class="breadcrumb-item active">write</li>
      </ol>
    </nav>
  </div><!-- End Page Title -->

  <section class="section">
    <div id="contents">
      <p></p>
      <div class="row">
        <main class="col-sm-8">
        </main>
      </div>
      <div class="page-title">
        <div class="container">
          <div class="form-group">
            <label for="title">Title</label>
            <input id="title" type="text" class="form-control">
          </div>
          <div class="form-group">
            <label for="author">Author</label>
            <input id="author" type="text" class="form-control" value="${userName}" readonly="false">
          </div>
          <div class="form-group">
            <%--<label for="userid">UserId</label>--%>
            <input type="hidden" id="userid" type="text" class="form-control" value="${userId}" readonly="false">
          </div>
        </div>
      </div>
      <!-- 에디터를 적용할 요소 (컨테이너) -->
      <div id="editor">

      </div>
      <p></p>
      <div id="sbbtn" style="display: flex; justify-content: flex-end;">
         <button class="custom-btn btn-3" onclick="sendData()"><span>Submit</span></button>
      </div>

      <!-- TUI 에디터 JS CDN -->
      <script src="https://uicdn.toast.com/editor/latest/toastui-editor-all.min.js"></script>
      <script type = "text/javascript">
        // Toast UI Editor 초기화
        const editor = new toastui.Editor({
          el: document.querySelector('#editor'), // 에디터를 적용할 요소 (컨테이너)
          height: '700px',                        // 에디터 영역의 높이 값 (OOOpx || auto)
          initialEditType: 'markdown',            // 최초로 보여줄 에디터 타입 (markdown || wysiwyg)
          initialValue: '일일 과제를 작성하세요.',     // 내용의 초기 값으로, 반드시 마크다운 문자열 형태여야 함
          previewStyle: 'vertical',
          hooks: {
            addImageBlobHook: (blob, callback) =>{
              console.log(blob);
              uploadImages(blob, callback);
            }
          }
        });

        const uploadImages = (blob, callback) => {
          let fileData = new FormData();
          fileData.append("fileData", blob);

          $.ajax({
            type:'POST',
            enctype: 'multipart/form-data',
            url: '/student/fileUpload',
            data: fileData,
            dataType:'json',
            processData: false,
            contentType: false,
            cache: false
          }).fail(function( jqXHR, textStatus, errorThrown ){
            console.log(jqXHR)
            console.log('status'+textStatus)
            console.log('error'+errorThrown)
            //callback();
          }).done(function(data){
            console.log('들어옴')
            console.log(data.message);
            console.log(data.status)
            if (data.status === "success") {
              callback(data.message);
            } else {
              console.error('Image upload failed.');
            }
          });
        }

        //데이터 전송 함수
        function sendData() {

          const formData = {
            author: $("#author").val(),
            userId: $("#userid").val(),
            title: $("#title").val(),
            content: editor.getMarkdown()
          }

          console.log(formData)

          $.ajax({
            url: '/student/daily-task',
            type: 'POST',
            contentType: 'application/json',
            data: JSON.stringify(formData),
            success: function (response) {
              swal({
                text: "글 작성이 완료되었습니다.", buttons: "확인", closeOnClickOutside: false
              }).then(function (){
                window.location.href=response;
              })
            },
            error: function (xhr, status, error) {
              swal({
                text: "글 작성에 실패했습니다", buttons: "확인", closeOnClickOutside: false
              }).then(function (){
                console.error('Error occurred while sending data:', error);
              })
            }
          });
        }
      </script>
    </div>
    </div>
  </section>

</main>
<%@include file="../include/footer.jsp"%>
<!-- Template Main JS File -->
<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
</body>
</html>
