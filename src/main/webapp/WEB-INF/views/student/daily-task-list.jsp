<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 2023-09-02
  Time: PM 7:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>daily-task-check</title>
</head>
<body>
<h1>daily-task-User-List</h1>
<a href ="/student/daily-task">일일과제 작성</a>

<table border="1">
    <tr>
    <th>번호</th>
    <th>일일과제제목</th>
    <th>작성일</th>
    <th>수정일</th>
    <th>상태</th>
    </tr>
    <c:forEach items="${taskUserList}" var="dailyTask">
        <tr>
            <td>${dailyTask.taskSeq}</td>
            <td><a href="/student/daily-task-detail?taskSeq=${dailyTask.taskSeq}">${dailyTask.title}</td>
            <td><fmt:formatDate value="${dailyTask.createDate}" pattern="yyyy-MM-dd"/></td>
            <td><fmt:formatDate value="${dailyTask.updateDate}" pattern="yyyy-MM-dd"/></td>
            <td>${dailyTask.status}</td>
        </tr>
    </c:forEach>
</body>
</html>
