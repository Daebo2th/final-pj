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
    <title>일일과제-상세</title>

    <!-- Favicons -->
    <link rel="icon" href="/resources/favicon.ico" type="image/x-icon">
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
            background: #f6f9ff !important;
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
            /*display: flex;*/
        }
        .btn-danger{
            color:#fff !important;
            border-color: red !important;
            background-color: red !important;
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

        /*댓글 css*/
        .user-comment{
            width:70vw;
            margin:0 auto;
            margin-bottom:10px;
        }
        .comments-section img {
            margin-top: 0px;
            width: 60px;
        }

        .comments-section p {
            line-height: 15px;
            margin: 0 auto 5px;
        }

        .comments-section .comment-author {
            font-weight: 600;
            font-size: 17px;
            letter-spacing: 0.5px;
            color: #547ef8;
        }

        .comments-section .comment-time {
            font-size: 11px;
            margin-left: 10px;
            color: #a7a5a5;
            border-bottom: 1px solid #ddd;
        }

        .comments-section .comment-content {
            font-size: 16px;
            font-weight: 100;
            padding-bottom: 0px;
            line-height: 25px;
            letter-spacing: 1px;
            color: #888888;
        }

        .comments-section .comment-post-reply .comment-content,
        .comments-section .comment-post-reply .comment-author {
            color: #888888; }

        .comments-section textarea {
            width: 100%;
            height: 80px;
            border: 1px solid #ccccccad;
            border-radius: 4px;
            padding: 10px; }
        .comment-like-unlike span i{
            font-size: 18px;
            color: #547ef89e;
            cursor: pointer;
            margin-right: 10px;
            width: 30px;
            height: 25px;
            text-align: center;
            line-height: 25px;
        }
        .comment-like-unlike span i:hover{
            color: #547ef8;
            transition: 0.3s ease-in-out;
        }
        .comment-post, .comment-post-reply{
            display: flex;
            margin-bottom: 25px;
        }
        .comment-details{
            margin-left: 25px;
        }
        .comment-post-reply{
            margin-left: 85px;
            margin-bottom: 40px;
        }
        .comments-section{
            padding-top: 40px;
            border-top: 1px solid #cccccc8a;
        }
        .comments-section .btn--blue {
            -webkit-box-shadow: 0 3px 32px rgba(85, 126, 248, .54);
            box-shadow: 0 3px 32px rgba(85, 126, 248, .54);
            background-color: #557ef8;
            padding: 0 40px;
            -webkit-border-radius: 5px;
            border-radius: 5px;
            height: 50px;
            line-height: 50px;
            color: #fff;
            font-size: 16px;
            display: inline-block;
            border: none;
            font-family: Catamaran;
            font-weight: 400;
            text-decoration:none;
            margin-top:10px;
            float: inherit;
        }
        .tui-editor-defaultUI .tui-editor-mode-switch-left {
            display: none !important;
        }
        #contents {
            /*border: 2px solid gainsboro;*/ /* 1픽셀 두께의 검은색 테두리 적용 */
            padding: 60px;
        }
        .comment-author {
            color: #0f5132 !important; /* 원하는 색상으로 변경 */
        }
        .current-user {
            color: #ff0000 !important; /* 원하는 색상으로 변경 */
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
        <h1>일일과제 상세보기 페이지</h1>
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="/">Home</a></li>
                <li class="breadcrumb-item active">일일과제</li>
            </ol>
        </nav>
    </div><!-- End Page Title -->

    <!-- Default Card -->
    <div class="card">
        <div class="card-body">
            <section class="section">
                <div id="contents">
                    <div class="page-title">
                        <div class="container">
                            <div id="cardTitleflex">
                            <h4 class="card-title">${taskVO.title}</h4>
                            </div>
                          <%--<h3>${taskVO.title}</h3>--%>
                              </div>
                             </div>
                            <!-- 에디터를 적용할 요소 (컨테이너) -->
                            <div id="viewer">

                            </div>

            </div>
         </section>
        </div>
    </div><!-- End Default Card -->
    <p></p><p></p>
    <div id="upbtn" style="display: flex; justify-content: center;">
        <a href="/student/daily-task-update?taskSeq=${taskVO.taskSeq}" class="inline-link">
            <button class="custom-btn btn-16">수정</button>
        </a>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <button id="deleteButton" class="custom-btn btn-16">삭 제</button>&nbsp;&nbsp;
        <%--                <a href="/student/daily-task-delete?taskSeq=${taskVO.taskSeq}" class="inline-link">
                            <button class="custom-btn btn-16">삭 제</button>
                        </a>--%>
    </div>


    <div class="con reply">
        <h3> Comment</h3>
        <div class="user-comment">
            <div class="comments-section">
                <div class="comment-post">
                    <div class="comment-details">
                        <div id="replyList">
                        <p><span class="comment-author">Rajesh Gupta</span></p>
                        <p class="comment-content">Maecenas eu maximus tellus, Suspendisse tincidunt hendrerit nisi, sit amet aliquet enim ornare at.</p>
                        </div>
                    </div>
                </div>
<%--                <div class="comment-post-reply">
                    <div class="comment-details">
                        <p><span class="comment-author">Amit Pradhan</span><span class="comment-time">10 minutes ago</span></p>
                        <p class="comment-content">Lorem ipsum dolor sit amet, consectetur adipiscing elit. </p>
                        <div class="comment-like-unlike">
                            <span><i class="fa fa-thumbs-o-up" aria-hidden="true"></i></span>
                            <span><i class="fa fa-thumbs-o-down" aria-hidden="true"></i></span>
                            <span><i class="fa fa-reply" aria-hidden="true"></i></span>
                        </div>
                    </div>
                </div>--%>
                <div class="comment-add">
                    <div class="field-comment">
                        <textarea id="replyContent" rows="4" cols="50"></textarea>
                        <input id='replyConfirm' type='button' value='Post Your Comment' class='btn btn--blue btn--medium pull-right'>
                    </div>
                    <!-- hidden fields for replyer and taskSeq -->
                    <input type="hidden" id="replyer" value="<sec:authentication property='principal.name'/>"/>
                    <input type="hidden" id="taskSeq" value="${taskVO.taskSeq}"/>
                </div>
            </div>
        </div>
    </div>

    <%--삭제 버튼 클릭 + 댓글 입력후 댓글목록 불러오는 ajax 요청--%>
    <script type="text/javascript">

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
                    const viewer = new toastui.Editor.factory({
                        el:document.querySelector('#viewer'),
                        initialValue: response.content,
                        height: '600px',
                        toolbarItems: [],
                        viewer:true
                    });
                }catch(e){
                    console.error(e);
                }
            }


        };

        $('#deleteButton').click(function(e) {
            e.preventDefault();

            var taskSeq = $("#taskSeq").val();  // taskSeq 값 가져오기

            $.ajax({
                type: 'GET',
                url: '/student/daily-task-delete?taskSeq=' + taskSeq,
                success: function(result) {
                    swal({
                        text: "글 삭제가 완료되었습니다.", buttons: "확인", closeOnClickOutside: false
                    }).then(function (){
                        window.location.href = "/student/daily-task-list";  // 페이지 리다이렉트 (필요한 URL로 변경)
                    })
                },
                error: function(error) {
                    alert('삭제하는 중에 오류가 발생했습니다.');
                    console.log(error);
                }
            });
        });
        /****************댓글 목록 불러오기 **********************/
        function replyList() {
            var replySeq=$("#replySeq").val();
            var taskSeq = $("#taskSeq").val();
            var userId = $("#replyer").val();
            console.log(replySeq);

            $.ajax({
                type: 'GET',
                url: '/student/reply-list?taskSeq='+taskSeq,  // 실제 댓글 목록 API URL로 변경 필요
                success: function(data) {
                    var replyContainer = $('#replyList');
                    replyContainer.empty();  // 기존 목록 삭제

                    data.forEach(function(reply) {  // 각 댓글에 대해
                        var commentPost = $('<div>').addClass('comment-post');
                        var commentDetails = $('<div>').addClass('comment-details').appendTo(commentPost);

                        var commentAuthor = $('<span>').addClass('comment-author').text(reply.replyer);
                        // 현재 로그인한 사용자와 댓글 작성자가 일치하면 클래스 추가
                        if (userId === reply.replyer) {
                            console.log(userId);
                            console.log(reply.replyer);
                            commentAuthor.addClass('current-user');
                        }

                        $('<p>').append(commentAuthor).appendTo(commentDetails);


                    /*    $('<p>').append($('<span>').addClass('comment-author').text(reply.replyer)).appendTo(commentDetails);*/
                        $('<p>').addClass('comment-content').text(reply.replyContent).appendTo(commentDetails);

                        /*만약 현재 로그인한 사용자가 댓글 작성자와 동일하다면 수정 및 삭제 버튼 추가*/
                        if (userId === reply.replyer) {
                            var deleteButton = $('<button type="button" id="deleteButton" class="btn btn-danger btn-sm"><i class="bi bi-trash"></i></button>');  // 삭제 버튼 생성  // 삭제 버튼 생성
                            deleteButton.click(function() {
                                // 여기에 댓글 삭제 로직 구현
                                $.ajax({
                                    type: 'GET',
                                    url: '/student/delete-reply?replySeq=' + reply.replySeq,  // 실제 댓글 삭제 API URL로 변경 필요
                                    success: function(result) {
                                        swal({
                                            text: "댓글 삭제가 완료되었습니다.", buttons: "확인", closeOnClickOutside: false
                                        }).then(function (){
                                            replyList();  // 댓글 목록 새로고침
                                        })
                                    },
                                    error: function(error) {
                                        swal({
                                            text: "댓글 삭제에 실패했습니다.", buttons: "확인", closeOnClickOutside: false
                                        }).then(function (){
                                            replyList();  // 댓글 목록 새로고침
                                        })
                                    }
                                });
                            });
                            commentDetails.append(deleteButton);  // 삭제 버튼 추가
                        }

                        commentPost.appendTo(replyContainer);  // 완성된 행을 테이블에 추가
                    });
                },
                error: function(error) {
                    swal({
                        text: "댓글 삭제에 실패했습니다.", buttons: "확인", closeOnClickOutside: false
                    }).then(function (){
                        replyList();  // 댓글 목록 새로고침
                    })
                }
            });
        }



        /*댓글 버튼이 눌렸을 때 */
        $(function(){
            $('#replyConfirm').click(function(){
                const formData = {
                    replyer: $("#replyer").val(),
                    replyContent: $("#replyContent").val(),
                    taskSeq: $("#taskSeq").val()
                }

                console.log(formData);
                /*var params =$('#replyData').serialize();*/  //serialize() jquery api 메소드를 이용해서 form 의 모든 element의 name과 value 값을 넘길수 있음!!

                $.ajax({
                    type:'post',
                    contentType: 'application/json',
                    data: JSON.stringify(formData),
                    url:'/student/daily-task-reply',
                    success:function(result){
                        swal({
                            text: "댓글 등록이 완료되었습니다.", buttons: "확인", closeOnClickOutside: false
                        }).then(function (){
                            //화면 초기화
                            $('#replyContent').val('');
                            replyList();
                        })
                    },
                    error: function(error){
                        alert('error');
                        console.log(error);
                    }
                });
            });
            replyList();
        });
    </script>


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
