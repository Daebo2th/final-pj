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
    <h2> (임의) 작성자 <input type ="text" id="author" value="${userId}">  </h2>
    <h2> 제목 : <input type="text" id="title"> </h2>

    <!-- 에디터를 적용할 요소 (컨테이너) -->
    <div id="editor">

    </div>

    <button onclick ="sendData()" > 글등록 </button>
    <a href ="/student/daily-task-check">글 목록 보기 링크 </a>

        <!-- TUI 에디터 JS CDN -->
        <script src="https://uicdn.toast.com/editor/latest/toastui-editor-all.min.js"></script>
        <script type = "text/javascript">
            // Toast UI Editor 초기화
            const editor = new toastui.Editor({
                el: document.querySelector('#editor'), // 에디터를 적용할 요소 (컨테이너)
                height: '500px',                        // 에디터 영역의 높이 값 (OOOpx || auto)
                initialEditType: 'markdown',            // 최초로 보여줄 에디터 타입 (markdown || wysiwyg)
                initialValue: '일일 과제를 작성하세요.',     // 내용의 초기 값으로, 반드시 마크다운 문자열 형태여야 함
                previewStyle: 'vertical', // 마크다운 프리뷰 스타일 (tab || vertical
                hooks: {
                    addImageBlobHook:(blob, callback) => { /*이미지 추가 될때 호출 되는 콜백 함수 */
                        const fileData = new FormData(); /*이미지 파일을 담음*/
                        fileData.append('image', blob);

                        let url ="/images/";
                        $.ajax({
                            type:'POST',
                            enctype: 'multipart/form-data',
                            url: '/student/daily-task-file',
                            data: fileData,
                            dataType:'json',
                            processData: false,
                            contentType: false,
                            cache: false,
                            timeout: 60000,
                            success: function(data){
                                console.log('ajax 이미지 업로드 성공');
                                url += data.filename;

                                // callback : 에디터(마크다운 편집기)에 표시할 텍스트, 뷰어에는 imageUrl 주소에 저장된 사진으로 나옴
                                // 형식 : ![대체 텍스트](주소)
                                callback(url, '사진 대체 테스트 입력');
                            },
                            error: function(e){
                                console.log('ajax 이미지 업로드 실패');
                                callback('image_load_fail','사진 대체 텍스트 입력');
                            }
                        });
                    }
                }
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
                        window.location.href=response;
                    },
                    error: function (xhr, status, error) {
                        console.error('Error occurred while sending data:', error);
                    }
                });
            }

/*            document.getElementById("registerButton").addEventListener("click", function() {
                window.location.href = "/student/daily-task-check"; // 대상 페이지 URL로 변경해주세요
            });*/
        </script>
</body>
</html>