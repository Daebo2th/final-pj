<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 2023-09-07
  Time: PM 2:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="com.fasterxml.jackson.databind.ObjectMapper" %>
<%@ page import="com.fasterxml.jackson.core.JsonGenerator" %>
<%@ page import="org.apache.commons.lang3.StringEscapeUtils" %>

<html>
<head>
    <title>일일과제 상세보기 페이지 </title>

    <!-- jQuery 라이브러리 추가 -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <!-- Editor's Style -->
    <link rel="stylesheet" href="https://uicdn.toast.com/editor/latest/toastui-editor.min.css" />
    <!-- TUI 에디터 JS CDN -->
    <script src="https://uicdn.toast.com/editor/latest/toastui-editor-all.min.js"></script>
</head>
<body>
<h1>일일과제 수정 페이지</h1>

<!-- 작성자와 제목을 보여줄 요소 -->
<!-- 작성자의 ID -->
<input type="hidden" id="userid" value="${taskVO.userId}" />
<!-- 게시글의 ID -->
<input type="hidden" id="taskseq" value="${taskVO.taskSeq}" />
<!-- 작성자 -->
작성자 : <input type="text" id="detailAuthor" value="${taskVO.author}" readonly="true"/> <%--수정 불가능 --%>

제목 : <input type="text" id="detailTitle" value="${taskVO.title}"/> <%--수정 가능 !!--%>

<!-- 에디터를 적용할 요소 (컨테이너) -->
<div id="editor">

</div>
<%
    Object taskObject = request.getAttribute("taskVO");
   /* out.println(taskObject);*/
    String taskJson ="{}";
    if(taskObject != null){
        try{ //서버에서 받아온 'taskVO' 객체를 JSON 문자열로 변환하고, 이스케이프 처리합니다.
            ObjectMapper mapper = new ObjectMapper();
            String jsonStr = mapper.writeValueAsString(taskObject);
            // 모든 제어문자와 특수문자를 Java 스트링 리터럴에서 안전하게 사용할 수 있는 형태로 변환
            taskJson = StringEscapeUtils.escapeJava(jsonStr);
            /*out.println("taskJSON : "+ taskJson);*/
        }catch (Exception e){
            e.printStackTrace();
        }
    }

%>

<button onclick ="saveData()" > 저장 </button>
<a href="/student/daily-task-list">글 목록으로 돌아가기</a>

<script type = "text/javascript">
    var editor;
//페이지가 로드 되면 실행 됨
window.onload = function(){
    var taskJsonStrEscaped = '<%=taskJson%>';
    //이스케이프 처리된 문자열에서 역슬래시와 따옴표(\') 조합을 일반 따옴표(')로 치환하여 원래 형태로 복원합니다.
    var taskJsonStrUnescaped = String(taskJsonStrEscaped).replace(/\\'/g, "'");
    try{
        var task = JSON.parse(taskJsonStrUnescaped); //복원된 JSON 문자열을 JavaScript 객체로 변환합니다.

        //에디터 인스턴스를 생성하고 초기화 한다
        editor = new toastui.Editor({
            el:document.querySelector('#editor'),
            initialEditType: 'markdown',
            previewStyle: 'vertical',
            height: '700px',
            initialValue: task.content,
            readOnly: false, // 수정이 가능해야 하므로 false 로 설정
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

        }//editor.setMarkdown() + AWS 이미지 저장 완료;

    }catch(e){
        console.error(e);
        console.log(taskJsonStrUnescaped);
    }
};
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
            console.log('Data sent successfully!');
            window.location.href=response;
        },
        error: function (xhr, status, error) {
            console.error('Error occurred while sending data:', error);
        }
    });
}

</script>


</body>
</html>
