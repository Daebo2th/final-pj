<%@ page import="java.security.Principal" %><%--
  Created by IntelliJ IDEA.
  User: KOSA
  Date: 2023-08-11
  Time: 오후 6:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <script src="https://code.jquery.com/jquery-latest.min.js"></script>
    <style>
        @import url('https://fonts.googleapis.com/css?family=Montserrat:400,800');

        * {
            box-sizing: border-box;
        }

        body {
            background: #f6f5f7;
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
            font-family: 'Montserrat', sans-serif;
            height: 100vh;
            margin: -20px 0 50px;
        }

        h1 {
            font-weight: bold;
            margin: 0;
        }

        h2 {
            text-align: center;
        }

        p {
            font-size: 14px;
            font-weight: 100;
            line-height: 20px;
            letter-spacing: 0.5px;
            margin: 20px 0 30px;
        }

        span {
            font-size: 12px;
        }

        a {
            color: #333;
            font-size: 14px;
            text-decoration: none;
            margin: 15px 0;
        }

        button {
            border-radius: 20px;
            border: 3px solid #003050;
            background-color: #003050;
            color: #FFFFFF;
            font-size: 12px;
            font-weight: bold;
            padding: 12px 45px;
            letter-spacing: 1px;
            text-transform: uppercase;
            transition: transform 80ms ease-in;
        }

        .btn_custom {
            border-radius: 0px;
            padding: 12px 15px;
            margin: 8px 0;
        }

        button:active {
            transform: scale(0.95);
        }

        button:focus {
            outline: none;
        }

        button.ghost {
            background-color: transparent;
            border-color: #FFFFFF;
        }

        form {
            background-color: #FFFFFF;
            display: flex;
            align-items: center;
            justify-content: center;
            flex-direction: column;
            padding: 0 50px;
            height: 100%;
            text-align: center;
        }

        input {
            background-color: #eee;
            border: none;
            padding: 12px 15px;
            margin: 8px 0;
            width: 100%;
        }

        .container {
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 14px 28px rgba(0, 0, 0, 0.25),
            0 10px 10px rgba(0, 0, 0, 0.22);
            position: relative;
            overflow: hidden;
            width: 1080px;
            max-width: 100%;
            min-height: 720px;
        }

        .form-container {
            position: absolute;
            top: 0;
            height: 100%;
            transition: all 0.6s ease-in-out;
        }

        .sign-in-container {
            left: 0;
            width: 50%;
            z-index: 2;
        }

        .container.right-panel-active .sign-in-container {
            transform: translateX(100%);
        }

        .sign-up-container {
            left: 0;
            width: 50%;
            opacity: 0;
            z-index: 1;
        }

        .container.right-panel-active .sign-up-container {
            transform: translateX(100%);
            opacity: 1;
            z-index: 5;
            animation: show 0.6s;
        }

        @keyframes show {
            0%, 49.99% {
                opacity: 0;
                z-index: 1;
            }

            50%, 100% {
                opacity: 1;
                z-index: 5;
            }
        }

        .overlay-container {
            position: absolute;
            top: 0;
            left: 50%;
            width: 50%;
            height: 100%;
            overflow: hidden;
            transition: transform 0.6s ease-in-out;
            z-index: 100;
        }

        .container.right-panel-active .overlay-container {
            transform: translateX(-100%);
        }

        .overlay {
            background: #3CB371;
            /*background: -webkit-linear-gradient(to right, #005B23, #003050);*/
            /*background: linear-gradient(to right, #005B23, #003050);*/
            background-repeat: no-repeat;
            background-size: cover;
            background-position: 0 0;
            color: #FFFFFF;
            position: relative;
            left: -100%;
            height: 100%;
            width: 200%;
            transform: translateX(0);
            transition: transform 0.6s ease-in-out;
        }

        .container.right-panel-active .overlay {
            transform: translateX(50%);
        }

        .overlay-panel {
            position: absolute;
            display: flex;
            align-items: center;
            justify-content: center;
            flex-direction: column;
            padding: 0 40px;
            text-align: center;
            top: 0;
            height: 100%;
            width: 50%;
            transform: translateX(0);
            transition: transform 0.6s ease-in-out;
        }

        .overlay-left {
            transform: translateX(-20%);
        }

        .container.right-panel-active .overlay-left {
            transform: translateX(0);
        }

        .overlay-right {
            right: 0;
            transform: translateX(0);
        }

        .container.right-panel-active .overlay-right {
            transform: translateX(20%);
        }

        .social-container {
            margin: 20px 0;
        }

        .social-container a {
            border: 1px solid #DDDDDD;
            border-radius: 50%;
            display: inline-flex;
            justify-content: center;
            align-items: center;
            margin: 0 5px;
            height: 40px;
            width: 40px;
        }

        footer {
            background-color: #222;
            color: #fff;
            font-size: 14px;
            bottom: 0;
            position: fixed;
            left: 0;
            right: 0;
            text-align: center;
            z-index: 999;
        }

        footer p {
            margin: 10px 0;
        }

        footer i {
            color: red;
        }

        footer a {
            color: #3c97bf;
            text-decoration: none;
        }

        .box {
            display: flex;
            flex-wrap: wrap;
            width: 100%;
        }

        .w-5 {
            width: 50%;
        }
        .remember{
            display: flex;
            width: 100%;
            justify-content: center;
            align-items: center;
        }
        #remember-me{
            width: auto;
        }
    </style>
</head>
<body>
<c:if test="${user!=null}">
    <c:redirect url="/"/>
</c:if>

<c:if test="${param.fail == true}">
    <div>
        로그인실패<br>
        <c:if test="${SPRING_SECURITY_LAST_EXCEPTION != null}">
            이유 : <c:out value="${SPRING_SECURITY_LAST_EXCEPTION.message}"/>
        </c:if>
    </div>
</c:if>

<%--<form action="/auth/login_check" method="post">--%>
<%--    <table border="1" align="center">--%>
<%--        <tbody>--%>
<%--        <tr>--%>
<%--            <th>아이디:</th>--%>
<%--            <td><input type="text" name="id"></td>--%>
<%--        </tr>--%>
<%--        <tr>--%>
<%--            <th>비밀번호:</th>--%>
<%--            <td><input type="password" name="pwd"></td>--%>
<%--        </tr>--%>
<%--        <tr>--%>
<%--            <td colspan="2" align="center">--%>
<%--                <input type="submit" value="로그인">--%>
<%--                <input type="button" onclick="location.href='/auth/sign-up'" value="회원가입">--%>
<%--            </td>--%>
<%--        </tr>--%>
<%--        </tbody>--%>
<%--    </table>--%>
<%--</form>--%>


<div class="container" id="container">
    <div class="form-container sign-up-container">
        <form action="/auth/sign-up">
            <div class="box">
                <input class="w-5" type="email" name="email" placeholder="이메일을 입력해주세요">
                <button type="button" class="btn_custom w-5" onclick="sendEmail()">이메일 전송</button>
                <input class="w-5" type="text" name="authCode" placeholder="인증번호" maxlength="6">
                <button type="button" class="btn_custom w-5" onclick="chkCertNum()">인증 확인</button>
            </div>

            <input type="password" name="pwd" placeholder="비밀번호">
            <input type="password" id="chkPwdVal" placeholder="비밀번호 확인">
            <input type="text" name="name" placeholder="이름">
            <input type="date" name="birthday">
            <select name="gender" id="gender">
                <option value="M" selected>남자</option>
                <option value="W">여자</option>
            </select>
            <input type="text" name="phone" placeholder="000-0000-0000">
            <div class="box">
                <input style="width: 50%" type="text" id="postcode" name="postcode" placeholder="우편번호">
                <button style="width: 50%" type="button" class="btn_custom" onclick="DaumPostcode()">우편번호 찾기</button>
                <br>
                <input type="text" id="roadAddress" name="addr1" placeholder="도로명주소">
                <input type="text" id="detailAddress" name="addr2" placeholder="상세주소">
            </div>
            <button type="button" onclick="signUp()">Sign Up</button>
        </form>
    </div>
    <div class="form-container sign-in-container">
        <form action="/auth/login_check" method="post">
            <h1>Sign in</h1>
            <div class="social-container">
                <a href="#" class="social"><i class="fab fa-facebook-f"></i></a>
                <a href="#" class="social"><i class="fab fa-google-plus-g"></i></a>
                <a href="#" class="social"><i class="fab fa-linkedin-in"></i></a>
            </div>
            <span>or use your account</span>
            <input type="text" placeholder="Email" name="id"/>
            <input type="password" placeholder="Password" name="pwd"/>
            <div class="remember">
                <label for="remember-me" style>로그인 유지</label>
                <input type="checkbox" id="remember-me" name="remember-me" />
            </div>
            <a href="#">비밀번호를 잊어버리셧나요?</a>
            <button type="submit">로그인</button>
        </form>
    </div>
    <div class="overlay-container">
        <div class="overlay">
            <div class="overlay-panel overlay-left">
                <h1>이미 회원이신가요?</h1>
                <p>아래 버튼을 눌러 로그인을 해주세요!</p>
                <button class="ghost" id="signIn">로그인</button>
            </div>
            <div class="overlay-panel overlay-right">
                <h2>Daily Record에<br> 오신것을 환영합니다!</h2>
                <p>회원가입을 원하신다면<br> 아래 버튼을 눌러주세요.</p>
                <button class="ghost" id="signUp">회원 가입</button>
            </div>
        </div>
    </div>
</div>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    const signUpButton = document.getElementById('signUp');
    const signInButton = document.getElementById('signIn');
    const container = document.getElementById('container');

    signUpButton.addEventListener('click', () => {
        container.classList.add("right-panel-active");
    });

    signInButton.addEventListener('click', () => {
        container.classList.remove("right-panel-active");
    });

    function sendEmail() {
        console.log("이메일 전송 이벤트 시작")
        const to = $("input[name=email]");
        $.ajax({
            url: '/auth/mail-check',
            type: 'POST',
            contentType: 'plain/text',
            data: to.val(),
            success: function (response) {
                console.log('Data sent successfully!' + response.status);
                alert("이메일 전송!")
                if (response.status == "duplication") {
                    alert("중복된 이메일입니다.")
                    to.val('');
                    to.focus();
                    return false;
                }
                // window.location.href=response;
            },
            error: function (xhr, status, error) {
                console.error('Error occurred while sending data:', error);
            }
        });
    }

    let emailVerified = false;

    function chkCertNum() {

        let data = {};
        data.authCode = $('input[name="authCode"]').val();
        data.to = $('input[name="email"]').val()

        console.log(data)
        $.ajax({
            url: '/auth/verify-authCode',
            type: 'POST',
            contentType: 'application/json',
            data: JSON.stringify(data),
            success: function (response) {
                console.log('이메일 검증' + response.status);
                if (response.status == 'SUCCESS') {
                    emailVerified = true;
                    $('input[name="authCode"]').attr("disabled", "disabled")
                    alert("인증 완료");
                } else if(response.status == 'FAIL'){
                    alert("인증 실패");
                }
                // window.location.href=response;
            },
            error: function (xhr, status, error) {
                console.error('Error occurred while sending data:', error);
            }
        });
    }

    function signUp() {

        if (!emailVerified) {
            alert("이메일 인증을 완료해주세요.");
            return;
        }
        // 폼 내의 모든 필드 값 가져오기
        let email = $('input[name="email"]').val();
        let pwd = $('input[name="pwd"]').val();
        let chkPwdVal = $('#chkPwdVal').val();
        let name = $('input[name="name"]').val();
        let birthday = $('input[name="birthday"]').val();
        let gender = $('#gender').val();
        let phone = $('input[name="phone"]').val();
        let postcode = $('#postcode').val();
        let addr1 = $('#roadAddress').val();
        let addr2 = $('#detailAddress').val();

        // 비밀번호 확인
        if (pwd !== chkPwdVal) {
            alert("비밀번호가 일치하지 않습니다.");
            return;
        }

        // 필수항목 체크
        if (!email || !pwd || !name || !birthday || !gender || !phone || !postcode || !addr1) {
            alert("모든 필드를 채워주세요.");
            return;
        }

        // 회원 가입 데이터 객체 생성
        var registerData = {
            userId: email,
            userPwd: pwd,
            name: name,
            birthday: birthday,
            gender: gender,
            phone: phone,
            postcode: postcode,
            addr1: addr1,
            addr2: addr2
        };

        $.ajax({
            url: "/auth/sign-up",
            type: "POST",
            data: JSON.stringify(registerData),
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
