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
                <td>${list.userId}</td>
                <td>${list.userPwd}</td>
                <td>${list.regDate}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

    <a href="/auth/logout">로그아웃</a>

    <hr>

    <a href ="/student/daily-taskform">학생 페이지- 일일과제 작성으로 일단 진행</a>
    <a href ="/schedule/main">일정관리 페이지</a>
    <a href ="/admin/student-record">학생기록부 페이지</a>
    <a href="/student/todolist">칸반보드</a>

</div>
</body>
</html>