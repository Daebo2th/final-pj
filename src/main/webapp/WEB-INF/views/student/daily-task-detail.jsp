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
    <%-- JavaScript 변수에 서버에서 전달한 메시지 저장 --%>
</head>
<body>
<h1>일일과제 상세보기</h1>

<a href="/student/daily-task-list">글 목록으로 돌아가기</a>
<!-- 작성자와 제목을 보여줄 요소 -->
<div id ="detailAuthor">작성자 : ${taskVO.author}</div>
<div id ="detailTitle">제목 : ${taskVO.title} </div>

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
<button id="editButton" type="button" onclick="location.href='/student/daily-task-update?taskSeq=${taskVO.taskSeq}'">수정페이지로이동</button>
<button id="deleteButton" type="button" onclick="location.href='/student/daily-task-delete?taskSeq=${taskVO.taskSeq}'">삭 제 </button>

<script type = "text/javascript">

//페이지가 로드 되면 실행 됨
window.onload = function(){
    var taskJsonStrEscaped = '<%=taskJson%>';
    //이스케이프 처리된 문자열에서 역슬래시와 따옴표(\') 조합을 일반 따옴표(')로 치환하여 원래 형태로 복원합니다.
    var taskJsonStrUnescaped = String(taskJsonStrEscaped).replace(/\\'/g, "'");

    try{
        var task = JSON.parse(taskJsonStrUnescaped); //복원된 JSON 문자열을 JavaScript 객체로 변환합니다.

        //에디터 인스턴스를 생성하고 초기화 한다
        var editor = new toastui.Editor({
            el:document.querySelector('#editor'),
            initialEditType: 'markdown',
            previewStyle: 'vertical',
            height: '700px',
            initialValue: task.content,
            readOnly: true // 읽기 전용으로 설정하면 사용자가 내용을 변경할 수 없습니다.

        });
        //editor.setMarkdown();
        // message 값이 존재하면 alert 창을 띄웁니다.
        if (message) {
            alert(message);
        }
    }catch(e){
        console.error(e);
        console.log(taskJsonStrUnescaped);
    }

};

// 삭제 버튼 클릭 이벤트 핸들러
$('#deleteButton').click(function() {
    $.ajax({
        url: '/student/daily-task-delete',
        type: 'GET',
        data: { taskSeq: ${taskVO.taskSeq} },
        success: function() {
            alert('삭제 성공 !!!!!!');
            location.href = '/student/daily-task-list';
        },
        error: function() {
            alert('삭제 실패');
        }
    });
});

</script>
</body>
</html>
