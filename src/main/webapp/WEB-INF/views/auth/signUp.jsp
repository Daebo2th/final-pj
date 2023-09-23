<%--
  Created by IntelliJ IDEA.
  User: KOSA
  Date: 2023-08-11
  Time: 오후 6:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>회원가입 페이지</title>
    <script src="https://code.jquery.com/jquery-latest.min.js" ></script>
</head>
<body>
<h1>회원가입 페이지</h1>

<form action="/auth/sign-up" id="frm" method="post">
    <table border="1" align="center">
        <tbody>
        <tr>
            <th>이메일(ID)</th>
            <td>
                <input type="email" name="email" placeholder="이메일을 작성해주세요." value="ghgsb6200@gmail.com">
                <input type="button" value="인증번호 전송" onclick="mailCheck()">
            </td>
        </tr>
        <tr>
            <th>비밀번호</th>
            <td><input type="password" name="pwd" value="qwe"></td>
        </tr>
        <tr>
            <th>비밀번호 확인</th>
            <td><input type="password" value="qwe"></td>
        </tr>
        <tr>
            <th>이름</th>
            <td><input type="text" name="name" value="test"></td>
        </tr>
        <tr>
            <th>생년월일</th>
            <td><input type="date" name="birthday" value="1900-01-01"></td>
        </tr>
        <tr>
            <th>성별</th>
            <td>
                <select name="gender" id="gender">
                    <option value="M" selected>남자</option>
                    <option value="W">여자</option>
                </select>
            </td>
        </tr>
        <tr>
            <th>연락처</th>
            <td><input type="text" name="phone" value="010-0000-0000"></td>
        </tr>
        <tr>
            <th>주소</th>
            <td>
                <input type="text" id="postcode" name="postcode" placeholder="우편번호">
                <input type="button" onclick="DaumPostcode()" value="우편번호 찾기"><br>
                <input type="text" id="roadAddress" name="addr1" placeholder="도로명주소">
                <input type="text" id="detailAddress" name="addr2" placeholder="상세주소">
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <button type="button" onclick="submitBtn()">가입</button>
            </td>
        </tr>
        </tbody>
    </table>
</form>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function mailCheck() {
        let to = $("#frm input[name='email']").val();

        let emailPattern = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;

        // 이메일 유효성 검사
        if (!emailPattern.test(email)) {
            $('#emailError').text('올바른 이메일 형식이 아닙니다.');
            return;
        }

        console.log(to)
        $.ajax({
            url: "/auth/mail-check",
            type: "post",
            data: to,
            contentType: "text/plain",
            dataType: "json",
            success: function (response) {
                if (response.status == "sucess") {
                    alert("이메일 전송에 성공하셧습니다.")
                } else {
                    alert(response.status)
                }
            },
            error: function (xhr, status, error) {
                console.error(error);
                alert("오류가 발생했습니다. 다시 시도해주세요.");
            }
        });
    }

    function submitBtn() {
        // 폼 데이터 객체 생성
        var formData = {};

        formData.userId = $("#frm input[name='email']").val();
        formData.userPwd = $("#frm input[name='pwd']").val();
        // formData.confirmPassword = $("#frm input[type='password']").eq(1).val();
        formData.name = $("#frm input[name='name']").val();
        formData.birthday = $("#frm input[name='birthday']").val();
        formData.gender = $("#gender").val();
        formData.phone = $("#frm input[name='phone']").val();
        formData.postCode = $("#frm input[name='postCode']").val();
        formData.addr1 = $("#frm input[name='addr1']").val();
        formData.addr2 = $("#frm input[name='addr2']").val();

        $.ajax({
            url: "/auth/sign-up",
            type: "POST",
            data: JSON.stringify(formData),
            contentType: "application/json",
            dataType: "json",
            success: function (response) {
                if (response.status == "sucess") {
                    alert("회원가입에 성공하셧습니다.")
                    location.href = "/";
                } else {
                    alert(response.status)
                }
            },
            error: function (xhr, status, error) {
                console.error(error);
            }
        });
    }

    function DaumPostcode() {
        new daum.Postcode({
            oncomplete: function (data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if (data.buildingName !== '' && data.apartment === 'Y') {
                    extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('postcode').value = data.zonecode;
                document.getElementById("roadAddress").value = roadAddr;

                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.

                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if (data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if (data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        }).open();
    }
</script>
</body>
</html>
