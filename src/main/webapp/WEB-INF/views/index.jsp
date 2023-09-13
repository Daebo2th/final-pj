<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
    <style>
        #container {
            display: flex;
            flex-direction: column;
            align-items: center;
        }
    </style>
</head>
<body>
<c:if test="${user[0] != null}">
    <c:choose>
        <c:when test="${user[0] == 'ROLE_ADMIN'}">
<%--            <c:redirect url="/teacher" />--%>
        </c:when>
        <c:when test="${user[0] == 'ROLE_USER'}">
<%--            <c:redirect url="/student" />--%>
        </c:when>
        <c:when test="${user[0] == 'ROLE_GUEST'}">

        </c:when>
    </c:choose>
</c:if>
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

    <a href ="/schedule/main">일정관리 페이지</a>
    <a href ="/admin/student-record">학생기록부 페이지</a>

    <a href="/student/todolist">칸반보드</a>


    <a href ="/student/daily-task">학생 일일과제 작성 페이지</a>
    <hr>
    <a href="/student/SMain"> 학생 LayoutForm</a>
    <a href="teacher/TMain"> 교직원 LayoutForm</a>

</div>
</body>
</html>