<%--
  Created by IntelliJ IDEA.
  User: KOSA
  Date: 2023-09-12
  Time: 오후 1:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>보안 접근 거부</title>
    <style>
        body {
            background-color: #f2f2f2;
            font-family: Arial, sans-serif;
        }

        .container {
            max-width: 400px;
            margin: 100px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0px 0px 10px rgba(0,0,0,0.1);
        }

        h1 {
            color: #e74c3c;
            font-size: 24px;
        }

        p {
            color: #333333;
        }

        .button {
            display: inline-block;
            padding: 10px 20px;
            margin-top: 20px;
            background-color:#e74c3c;
            color:#fff;
            text-decoration:none;
            border-radius :4px;}

        .button:hover {background-color:#ff6655;}

    </style>
</head>
<body>
<div class="container">
    <h1>보안 접근 거부(<c:out value="${SPRING_SECURITY_403_EXCEPTION.getMessage()}"/>)</h1>
    <p><c:out value="${msg}"/></p>
    <a href="/" class="button">홈으로 돌아가기</a>
</div>

</body>
</html>
