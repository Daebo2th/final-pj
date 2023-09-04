<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 2023-09-02
  Time: PM 3:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>일일과제 작성</title>
    <!-- jQuery 라이브러리 추가 -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <!-- Editor's Style -->
    <link rel="stylesheet" href="https://uicdn.toast.com/editor/latest/toastui-editor.min.css" />
</head>
<body>
    <h1>일일과제 작성 페이지 </h1>
    <h2> (임의) 작성자 <input type ="text" id="author"> </h2>
    <h2> 제목 : <input type="text" id="title"> </h2>

    <!-- 에디터를 적용할 요소 (컨테이너) -->
    <div id="editor">

    </div>

    <button onclick ="sendData()" > 글등록 </button>

        <!-- TUI 에디터 JS CDN -->
        <script src="https://uicdn.toast.com/editor/latest/toastui-editor-all.min.js"></script>
        <script type = "text/javascript">
            // Toast UI Editor 초기화
            const editor = new toastui.Editor({
                el: document.querySelector('#editor'), // 에디터를 적용할 요소 (컨테이너)
                height: '500px',                        // 에디터 영역의 높이 값 (OOOpx || auto)
                initialEditType: 'markdown',            // 최초로 보여줄 에디터 타입 (markdown || wysiwyg)
                initialValue: '일일 과제를 작성하세요.',     // 내용의 초기 값으로, 반드시 마크다운 문자열 형태여야 함
                previewStyle: 'vertical' // 마크다운 프리뷰 스타일 (tab || vertical
            });

            //데이터 전송 함수
            function sendData() {
//                 var content =  editor.getMarkdown();// 에디터의 내용을 가져옵니다.

                const formData = {
                    author: $("#author").val(),
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
                        console.log('Data sent successfully!');
                    },
                    error: function (xhr, status, error) {
                        console.error('Error occurred while sending data:', error);
                    }
                });
            }
        </script>
</body>
</html>