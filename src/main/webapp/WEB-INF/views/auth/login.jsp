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
            box-shadow: 0 14px 28px rgba(0,0,0,0.25),
            0 10px 10px rgba(0,0,0,0.22);
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

        .container.right-panel-active .overlay-container{
            transform: translateX(-100%);
        }

        .overlay {
            background: #005B23;
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
    </style>
</head>
<body>

<c:if test="${param.fail == true}">
    <div>
        로그인실패<br>
        <c:if test="${SPRING_SECURITY_LAST_EXCEPTION != null}">
            이유 : <c:out value="${SPRING_SECURITY_LAST_EXCEPTION.message}" />
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
        <form action="#">
            <input type="email" name="email" placeholder="이메일을 입력해주세요" value="ghgsb6200@gmail.com">
            <input type="password" name="pwd" placeholder="비밀번호를 입력해주세요" value="qwe">
            <input type="password" id="chkPwdVal" placeholder="비밀번호를 입력해주세요">
            <input type="text" name="name" placeholder="이름을 입력해주세요" value="test">
            <input type="date" name="birthday" placeholder="생일을 입력해주세요" value="1900-01-01">
            <select name="gender" id="gender">
                <option value="M" selected>남자</option>
                <option value="W">여자</option>
            </select>
            <input type="text" name="phone" placeholder="핸드폰 번호를 입력해주세요" value="010-0000-0000">
            <input type="text" id="postcode" name="postcode" placeholder="우편번호">
            <input type="button" onclick="DaumPostcode()" value="우편번호 찾기"><br>
            <input type="text" id="roadAddress" name="addr1" placeholder="도로명주소">
            <input type="text" id="detailAddress" name="addr2" placeholder="상세주소">
            <button>Sign Up</button>
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
            <input type="text" placeholder="Email" name="id" />
            <input type="password" placeholder="Password" name="pwd" />
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
</script>
</body>
</html>
