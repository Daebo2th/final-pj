<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
    <style>
        #container{
            display: flex;
            flex-direction: column;
            align-items: center;
        }
    </style>
</head>
<body>
<div id="container">
    <h1><%= "Hello World!" %>
    </h1>
    <br/>
    <a href="hello-servlet">Hello Servlet</a>

    <table border="1" align="center" style="width: 30%;">
        <thead>
        <tr>
            <th>아이디</th>
            <th>비번</th>
            <th>가입일</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="list" items="${test}">
            <tr>
                <td>${list.id}</td>
                <td>${list.pwd}</td>
                <td>${list.regdate}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

    <a href="/auth/logout">로그아웃</a>
</div>
</body>
</html>