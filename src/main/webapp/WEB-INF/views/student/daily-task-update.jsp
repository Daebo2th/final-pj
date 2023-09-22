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
<%@ page import="com.fasterxml.jackson.databind.ObjectMapper" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ page import="com.fasterxml.jackson.core.JsonGenerator" %>
<%@ page import="org.apache.commons.lang3.StringEscapeUtils" %>

<html>
<head>

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
    <title>일일과제 수정 페이지</title>

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
        .savebtns{
            display: flex;
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

        /* 16 */
        .btn-16 {

            border: none;
            color: #000;
        }
        .btn-16:after {
            position: absolute;
            content: "";
            width: 0;
            height: 100%;
            top: 0;
            left: 0;
            direction: rtl;
            z-index: -1;
            box-shadow:
                    -7px -7px 20px 0px #fff9,
                    -4px -4px 5px 0px #fff9,
                    7px 7px 20px 0px #0002,
                    4px 4px 5px 0px #0001;
            transition: all 0.3s ease;
        }
        .btn-16:hover {
            color: #000;
        }
        .btn-16:hover:after {
            left: auto;
            right: 0;
            width: 100%;
        }
        .btn-16:active {
            top: 2px;
        }
        .inline-link {
            display: inline;
        }

    </style>
    <link rel="stylesheet" type="text/css" href="/resources/css/daily-task.css">
    <link rel="stylesheet" href="/resources/css/chatting.css">
</head>
<body>
<%@include file="../include/header.jsp"%>
<%@include file="../include/aside.jsp"%>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

<main id="main" class="main">

    <div class="pagetitle">
        <h1>일일과제 수정 페이지</h1>
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
                    <div class="form-group">
                        <label for="detailTitle">제 목</label>
                        <input id="detailTitle" type="text" class="form-control" value="${taskVO.title}">
                    </div>

                    <!-- 작성자와 제목을 보여줄 요소 -->
                    <!-- 작성자의 ID -->
                    <input type="hidden" id="userid" value="${taskVO.userId}" />
                    <!-- 게시글의 ID -->
                    <input type="hidden" id="taskseq" value="${taskVO.taskSeq}" />
                    <!-- 작성자 -->
                    <div class="form-group">
                        <label for="detailAuthor">작성자</label>
                        <input id="detailAuthor" type="text" class="form-control" value="${taskVO.author}" readonly="false">
                    </div>
                </div>
            </div>
            <!-- 에디터를 적용할 요소 (컨테이너) -->
            <div id="editor">

            </div>

            <div id="savebtns" style="display: flex; justify-content: center;">
                    <button class="custom-btn btn-3" onclick="saveData()"><span>Save</span></button>
                    &nbsp;&nbsp;
                <a href="/student/daily-task-list" class="inline-link">
                    <button class="custom-btn btn-16">돌아가기</button>
                </a>
            </div>
            <script type = "text/javascript">


                var editor;
                //페이지가 로드 되면 실행 됨
                window.onload = function(){
                    $.ajax({
                        url: "/api/task-list/${param.taskSeq}",
                        type: "GET",
                        dataType: 'json',
                        success: function (response) {
                            toastUI(response)
                        },
                        error: function (xhr, status, error) {
                            console.error('Error occurred while sending data:', error);
                        }
                    });

                   function toastUI(response){
                       try{
                           //에디터 인스턴스를 생성하고 초기화 한다
                           editor = new toastui.Editor({
                               el:document.querySelector('#editor'),
                               initialEditType: 'markdown',
                               previewStyle: 'vertical',
                               height: '700px',
                               initialValue: response.content,
                               readOnly: false, // 수정이 가능해야 하므로 false 로 설정
                               hooks: {
                                   addImageBlobHook: (blob, callback) =>{
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

                           }//editor.setMarkdown() + AWS 이미지 저장 완료;

                       }catch(e){
                           console.error(e);
                       }
                   }
                }
                // 데이터 전송 함수를 전역 스코프에 선언합니다.
                window.saveData = function() {
                    const formData = {
                        userId: $("#userid").val(),
                        taskSeq: $("#taskseq").val(), // 게시글의 ID
                        title: $("#detailTitle").val(),
                        content: editor.getMarkdown()
                    }

                    console.log(formData)

                    $.ajax({
                        url: '/student/daily-task-update',
                        type: 'POST',
                        contentType: 'application/json',
                        data: JSON.stringify(formData),
                        success: function (response) {
                            swal({
                                text: "글 수정이 완료되었습니다.", buttons: "확인", closeOnClickOutside: false
                            }).then(function (){
                                window.location.href=response;
                            })
                        },
                        error: function (xhr, status, error) {
                            swal({
                                text: "글 수정에 실패하였습니다.", buttons: "확인", closeOnClickOutside: false
                            }).then(function (){
                                console.error('Error occurred while sending data:', error);
                            })
                        }
                    });
                }

            </script>
        </div>
    </section>




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
</body>
</html>
