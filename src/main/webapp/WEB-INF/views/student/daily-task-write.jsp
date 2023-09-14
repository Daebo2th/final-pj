<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 2023-09-09
  Time: PM 3:47
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>Title</title>
  <style type="text/css">
    body, html {
      margin: 0;
      padding: 0;
      width:100%;
      height:100%;
    }
    #wrap{
      width:100%;
      height:auto; /* 높이를 auto로 변경 */
      font-size:40px;
      color:#005B23;
    }
    .contents{
      float:left;
      width :calc(100% - 240px); /* contents 너비를 계산식으로 변경 */
      height :92vh; /* vh 단위로 변경하여 전체 화면의 나머지 부분을 차지하도록 설정 */
      line-height:normal;
      background-color:#fff;
    }
  </style>
  <!-- Editor's Style -->
  <link rel="stylesheet" href="https://uicdn.toast.com/editor/latest/toastui-editor.min.css" />
</head>
<body>
<div id="wrap">
  <%--들어갈 내용 --%>
  <div class="contents" >
    <h2>일일과제 작성 페이지 </h2>
    <div> (임의) 작성자 <input type ="text" id="author" value="테스트1">  </div>
    <div> userId <input type ="text" id="userid" value="${userId}">  </div>
    <div> 제목 : <input type="text" id="title"> </div>

    <!-- 에디터를 적용할 요소 (컨테이너) -->
    <div id="editor">

    </div>

    <button onclick ="sendData()" > 글등록 </button>
    <a href ="/student/daily-task-list">글 목록 보기 링크 </a>

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
            console.log('Data sent successfully!');
            window.location.href=response;
          },
          error: function (xhr, status, error) {
            console.error('Error occurred while sending data:', error);
          }
        });
      }
    </script>
  </div>
</div>   <%--End Contents--%>

<!-- jquery CDN -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

</html>
