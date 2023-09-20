<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%--
  Created by IntelliJ IDEA.
  User: KOSA
  Date: 2023-09-14
  Time: 오후 12:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>자료공유실</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Favicons -->
    <link href="${pageContext.request.contextPath}/resources/img/favicon.png" rel="icon">
    <link href="${pageContext.request.contextPath}/resources/img/apple-touch-icon.png" rel="apple-touch-icon">

    <!-- Google Fonts -->
    <link href="https://fonts.gstatic.com" rel="preconnect">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
          rel="stylesheet">

    <!-- Vendor CSS Files -->
    <link href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/vendor/bootstrap-icons/bootstrap-icons.css"
          rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/vendor/quill/quill.snow.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/vendor/quill/quill.bubble.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/vendor/remixicon/remixicon.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/vendor/simple-datatables/style.css" rel="stylesheet">

    <!-- Template Main CSS File -->
    <link href="${pageContext.request.contextPath}/resources/css/style.css" rel="stylesheet">
    <style type="text/css">
        body {
            margin-top: 20px;
            background: #DCDCDC;
        }

        .card-box {
            padding: 20px;
            border-radius: 3px;
            margin-bottom: 30px;
            background-color: #fff;
        }

        .file-man-box {
            padding: 20px;
            border: 1px solid #e3eaef;
            border-radius: 5px;
            position: relative;
            margin-bottom: 20px;
            /* 요소의 내용이 영역을 벗어날 경우 그 부분은 숨겨지게 처리 */
            overflow: hidden;
            /* 요소의 표시 방법을 -webkit-box로 표시 */
            display: -webkit-box;
            /* webkit-box로 표시된 자식 요소들의 배치 방법 결정 (여기서는 수직) */
            -webkit-box-orient: vertical;
            /* 요소 내 텍스트를 지정한 라인수까지만 표시 */
            -webkit-line-clamp: 2;
        }

        .file-man-box .file-close {
            color: #f1556c;
            position: absolute;
            line-height: 24px;
            font-size: 24px;
            right: 10px;
            top: 10px;
            visibility: hidden;
        }

        .file-man-box .file-img-box {
            line-height: 120px;
            text-align: center
        }

        .file-man-box .file-img-box img {
            height: 64px
        }

        .file-man-box .file-download {
            font-size: 32px;
            color: #98a6ad;
            position: absolute;
            right: 10px;
            bottom: 0;
        }

        .file-man-box .file-download:hover {
            color: #313a46
        }

        .file-man-box .file-man-title {
            padding-right: 25px
        }

        .file-man-box:hover {
            -webkit-box-shadow: 0 0 24px 0 rgba(0, 0, 0, .06), 0 1px 0 0 rgba(0, 0, 0, .02);
            box-shadow: 0 0 24px 0 rgba(0, 0, 0, .06), 0 1px 0 0 rgba(0, 0, 0, .02)
        }

        .file-man-box:hover .file-close {
            visibility: visible
        }

        .text-overflow {
            text-overflow: ellipsis;
            white-space: nowrap;
            display: block;
            width: 100%;
            overflow: hidden;
        }

        h5 {
            font-size: 15px;
        }

        .filebox .upload-name {
            display: inline-block;
            height: 40px;
            padding: 0 10px;
            vertical-align: middle;
            border: 1px solid #dddddd;
            width: 60%;
            color: #999999;
        }

        .filebox label {
            display: inline-block;
            padding: 10px 20px;
            color: #fff;
            vertical-align: middle;
            background-color: #999999;
            cursor: pointer;
            height: 40px;
            margin-left: 10px;
        }

        .filebox .upload {
            display: inline-block;
            padding: 10px 20px;
            color: #fff;
            vertical-align: middle;
            background-color: #999999;
            cursor: pointer;
            height: 40px;
            margin-left: 10px;
            border: 1px;
        }

        .filebox input[type="file"] {
            position: absolute;
            width: 0;
            height: 0;
            padding: 0;
            overflow: hidden;
            border: 0;
        }
        #moreBtn {
            cursor: pointer;
        }
    </style>
</head>
<body>
<%@include file="../include/header.jsp" %>
<%@include file="../include/aside.jsp" %>
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">

<main id="main" class="main">

    <div class="pagetitle">
        <h1>자료 공유실</h1>
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="/">Home</a></li>
                <li class="breadcrumb-item active">자료 공유실</li>
            </ol>
        </nav>
    </div><!-- End Page Title -->

    <section class="section">
        <div class="content">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <div class="card-box">

                            <div class="row">
                                <div class="col-lg-6 col-xl-6">
                                    <%--<h4 class="header-title m-b-30">자료 공유실</h4>--%>
                                </div>
                                <div class="col-lg-6 col-xl-6">
                                    <h6 class="header-title m-b-30">
                                        <form action="/class/${principal.groupSeq}/dataSharingRoom/upload" method="post"
                                              enctype="multipart/form-data">
                                            <div class="filebox">
                                                <input class="upload-name" value="첨부파일" placeholder="첨부파일">
                                                <input type="file" name="file" id="file">
                                                <label for="file">파일찾기</label>
                                                <input type="submit" class="upload" value="업로드">
                                            </div>
                                        </form>
                                    </h6>
                                </div>
                            </div>

                            <c:set var="contentTypeArray" value="${['jpg', 'pdf', 'png', 'txt', 'gif', 'html', 'js', 'json', 'md']}"/>
                            <%-- 어딘가에서 contentTypes 배열을 설정하거나 가져오는 코드 --%>
                            <div class="row location pt-5">
                                <c:forEach var="list" items="${list}">
                                    <div class="col-lg-3 col-xl-3 fileTable" style="display: none; padding-bottom: 14px;">
                                        <div class="file-man-box">
                                            <a href class="file-close" data-uuid="${list.uuid}" data-uploadname="${list.uploadName} data-filetype="${list.fileType}"><i class="fa fa-times-circle"></i></a>

                                            <div class="file-img-box">
                                                <i style="font-size: 100px;" class="bx ${list.fileType == 'folder'?'bxs-folder': contentTypeArray.contains(fn:split(list.uploadName,'.')[1])?'bxs-file-'+=fn:split(list.uploadName,'.')[1]:'bxs-file-blank'}"></i>
                                                <c:if test="${list.fileType != 'folder'}">
                                                    <a href="<c:url value="https://osdsbucket.s3.ap-northeast-2.amazonaws.com/dataSharing/${list.groupSeq}/${list.uploadName}"/>"
                                               class="file-download"><i class="fa fa-download"></i></a>
                                                </c:if>
                                            </div>
                                            <div class="file-man-title">
                                                <h5 class="mb-0 text-overflow">${list.originName}</h5>
                                                <p class="mb-0"><small></small></p>
                                            </div>
                                        </div>
                                    </div>
<%--                                    </c:if>--%>
<%--                                    </c:forEach>--%>
                                </c:forEach>
                            </div>

                            <div class="text-center mt-3">
                                <button type="button" id="moreBtn" class="btn btn-outline-danger w-md waves-effect waves-light"><i
                                        class="mdi mdi-refresh"></i>더보기
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </section>

</main>

<script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.bundle.min.js"></script>
<!-- Vendor JS Files -->
<script src="${pageContext.request.contextPath}/resources/vendor/apexcharts/apexcharts.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/vendor/chart.js/chart.umd.js"></script>
<script src="${pageContext.request.contextPath}/resources/vendor/echarts/echarts.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/vendor/quill/quill.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/vendor/simple-datatables/simple-datatables.js"></script>
<script src="${pageContext.request.contextPath}/resources/vendor/tinymce/tinymce.min.js"></script>

<!-- Template Main JS File -->
<script>
    /* 더보기 버튼 */
    $(function(){
        $(".fileTable").slice(0,8).show(); // 초기갯수
        $("#moreBtn").click(function(e){ // 클릭시 more
            e.preventDefault();
            $(".fileTable:hidden").slice(0, 8).show(); // 클릭시 more 갯수 지정
            if($(".fileTable:hidden").length === 0){ // 컨텐츠 남아있는지 확인
                $("#moreBtn").hide();
            }
        });
    });

    $("#file").on('change', function () {
        var fileName = $("#file").val();
        $(".upload-name").val(fileName);
    });

    $(document).ready(function () {
        // .file-close를 클릭했을 때
        $(".file-close").click(function (e) {
            let $this = $(this)
            e.preventDefault();
            var formData = {};
            formData.uuid = $(this).data("uuid"); // 데이터 속성에서 UUID 추출
            formData.uploadName = $(this).data("uploadname");
            // console.log(uploadName)
            // 서버에 삭제 요청 보내기
            $.ajax({
                type: "POST", // 또는 다른 HTTP 메서드 (GET, DELETE 등)
                url: "/api/dataSharingRoom/delete", // 삭제 요청을 처리하는 서버 엔드포인트 URL
                contentType: "application/json",
                data: JSON.stringify(formData),
                success: function (data) {
                    // 성공적으로 삭제되었을 때 실행할 코드
                    swal({
                        text: "파일이 삭제되었습니다.", buttons: "확인", closeOnClickOutside: false
                    }).then(function (){
                        $($this).closest(".file-man-box").remove();
                    })
                },
                error: function (error) {
                    // 삭제 중 오류가 발생했을 때 실행할 코드
                    console.error("파일 삭제 중 오류가 발생했습니다.");
                }
            });
        });
    });
</script>
<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
<%@include file="../include/footer.jsp" %>
</body>
</html>
