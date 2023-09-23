<%--
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
    <title>회원 찾기</title>
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

        .gender-button {
            border-color: #eee;
            background-color: #eee;
            color: #003050;
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
            width: 90%;
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
            justify-content: space-between;
            width: 100%;
        }

        .w-5 {
            width: 48%;
        }

        .remember {
            display: flex;
            width: 100%;
            justify-content: center;
            align-items: center;
        }

        #remember-me {
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
<div class="container" id="container">
    <div class="form-container sign-up-container">
        <form>
            <h1>비밀번호 재설정</h1>
            <input type="text" placeholder="이름" name="findPwdName"/>
            <div class="box">
                <input class="w-5" type="text" placeholder="이메일" name="findPwdEmail"/>
                <button type="button" class="btn_custom w-5" onclick="sendEmail()">이메일 전송</button>
            </div>
            <input type="password" placeholder="인증번호" name="findPwdAuthCode"/>
            <button type="button" onclick="chkCertNumPwd()">인증</button>
        </form>
    </div>
    <div class="form-container sign-in-container">
        <form>
            <h1>아이디 찾기</h1>
            <input type="text" placeholder="이름" name="findIdName"/>
            <div class="box">
                <input class="w-5" type="email" placeholder="이메일" name="findIdEmail"/>
                <button type="button" class="btn_custom w-5" onclick="findEmail()">이메일 확인</button>
            </div>
        </form>
    </div>
    <div class="overlay-container">
        <div class="overlay">
            <div class="overlay-panel overlay-left">
                <h1>아이디를 모르시나요?</h1>
                <p>아래 버튼을 눌러 아이디를 찾아주세요!</p>
                <button class="ghost" id="findId">아이디 찾기</button>
            </div>
            <div class="overlay-panel overlay-right">
                <h2>이미 아이디를 <br>알고 계신가요?</h2>
                <p>비밀번호 찾기는<br> 아래 버튼을 눌러주세요.</p>
                <button class="ghost" id="findPwd">비밀번호 찾기</button>
            </div>
        </div>
    </div>
</div>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>

    // 성별 선택 버튼 클릭 이벤트 처리
    const genderButtons = document.querySelectorAll('.gender-button');
    const selectedGenderInput = document.getElementById('selected-gender');

    genderButtons.forEach(button => {
        button.addEventListener('click', () => {
            // 선택한 버튼의 data-value 값을 hidden input에 저장
            const selectedGender = button.getAttribute('data-value');
            selectedGenderInput.value = selectedGender;

            // 버튼 스타일 변경 (선택한 버튼은 강조하고 나머지 버튼은 스타일 초기화)
            genderButtons.forEach(btn => {
                if (btn === button) {
                    btn.classList.add('selected');
                    $(btn).css({"color": "#eee", "background-color": "#003050", "border-color": "#003050"});
                } else {
                    btn.classList.remove('selected');
                    $(btn).css({"color": "#003050", "background-color": "#eee", "border-color": "#eee"});
                }
            });
        });
    });

    const findPwdButton = document.getElementById('findPwd');
    const findIdButton = document.getElementById('findId');
    const container = document.getElementById('container');

    findPwdButton.addEventListener('click', () => {
        container.classList.add("right-panel-active");
    });

    findIdButton.addEventListener('click', () => {
        container.classList.remove("right-panel-active");
    });

    /* 아이디 찾기 DB 조회*/
    function findEmail() {
        var name = $("input[name='findIdName").val()
        var email = $("input[name='findIdEmail").val()
        if (validateForm(name, email)) {
            let formData = {};
            formData.name = $("input[name=findIdName]").val();
            formData.userId = $("input[name=findIdEmail]").val();

            $.ajax({
                url: '/auth/person-find-id',
                type: 'POST',
                contentType: 'application/json',
                data: JSON.stringify(formData),
                beforeSend: function (xhr) {
                    swal(
                        '잠시만 기다려주세요'
                    )
                },
                success: function (response) {
                    swal.close();
                    if (response.status == "notDuplication") {
                        swal({
                            text: "입력하신 정보와 일치하는 회원이 없습니다.", Buttons: [], closeOnClickOutside: false
                        })
                        return false;
                    }

                    if (response.status == "SUCCESS") {
                        swal({
                            text: "회원입니다!", Buttons: [], closeOnClickOutside: false
                        })
                    }
                    // window.location.href=response;
                },
                error: function (xhr, status, error) {
                    console.error('Error occurred while sending data:', error);
                }
            });
        }
    }

    /* 비밀번호 찾기 인증번호 전송 */
    function sendEmail() {
        let name = $("input[name=findPwdName]").val();
        let email = $("input[name=findPwdEmail]").val();
        if (validateForm(name, email)) {
            let formData = {};
            formData.name = $("input[name=findPwdName]").val();
            formData.userId = $("input[name=findPwdEmail]").val();

            $.ajax({
                url: '/auth/mail-check',
                type: 'POST',
                contentType: 'application/json',
                data: JSON.stringify(formData),
                beforeSend: function (xhr) {
                    swal(
                        '잠시만 기다려주세요'
                    )
                },
                success: function (response) {
                    swal.close();
                    console.log(response.status)
                    if (response.status == "duplication") {
                        swal({
                            text: "입력하신 정보와 일치하는 회원이 없어 인증번로를 발송할 수 없습니다.", Buttons: [], closeOnClickOutside: false
                        })
                        return false;
                    }

                    if (response.status == "SUCCESS") {
                        swal({
                            text: "이메일을 전송했습니다.", Buttons: [], closeOnClickOutside: false
                        })
                    }

                    if (response.status == "FAIL") {
                        swal({
                            text: "이메일 전송 실패...", Buttons: [], closeOnClickOutside: false
                        })
                    }
                    // window.location.href=response;
                },
                error: function (xhr, status, error) {
                    console.error('Error occurred while sending data:', error);
                }
            });
        }

    }


    // 비밀번호 찾기 인증번호 검증
    function chkCertNumPwd() {

        // 이름과 이메일 입력란의 값을 가져옵니다.
        let name = $("input[name='findPwdName']").val()
        let email = $("input[name='findPwdEmail']").val()
        if (validateForm(name, email)) {
            let data = {};
            data.authCode = $("input[name='findPwdAuthCode']").val();
            data.to = email;

            console.log(data)
            $.ajax({
                url: '/auth/verify-authCode',
                type: 'POST',
                contentType: 'application/json',
                data: JSON.stringify(data),
                success: function (response) {
                    if (response.status == 'SUCCESS') {
                        $('input[name="authCode"]').attr("disabled", "disabled")
                        AjaxPWReset(data.authCode);

                    } else if (response.status == 'FAIL') {

                        alert("인증 실패");
                    }
                },
                error: function (xhr, status, error) {
                    console.error('Error occurred while sending data:', error);
                }
            });
        }

    }

    function AjaxPWReset(key) {
        $.ajax({
            url: '/auth/verify-authCode',
            type: 'POST',
            contentType: 'application/json',
            data: JSON.stringify({authCode: key}),
            success: function (response) {

                if (response.status == 'SUCCESS') {
                    swal("이메일 검증이 완료되었습니다. 이메일로 전달드린 인증번호로 로그인해주세요.").then(result =>{
                        location.href = "/";
                    })

                }
            },
            error: function (xhr, status, error) {
                console.error('Error occurred while sending data:', error);
            }
        });
    }

    function validateForm(name, email) {

        // 이름과 이메일이 모두 입력되었는지 확인합니다.
        if (name === "" || email === "") {
            alert("이름과 이메일을 모두 입력하세요.");
            return false;
        }

        // 이메일 형식을 정규표현식을 사용하여 확인합니다.
        var emailPattern = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;
        if (!emailPattern.test(email)) {
            alert("올바른 이메일 주소를 입력하세요.");
            return false;
        }

        // 모든 유효성 검증을 통과하면 true를 반환합니다.
        return true;
    }
</script>
</body>
</html>
