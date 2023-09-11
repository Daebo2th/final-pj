<%--
  Created by IntelliJ IDEA.
  User: KOSA
  Date: 2023-09-10
  Time: 오후 4:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>교육생 관리</title>
</head>
<body>
    <h2>${list[0].groupName} + 학생명단</h2>
    <table>
        <tr>
            <td>번호</td>
            <td>이름</td>
            <td>연락처</td>
            <td>바로가기 링크</td>
        </tr>
        <%-- rownum, 이름, 연락처, 바로가기 링크 가져오기 --%>
        <c:forEach var="student" items="${list}">
            <tr>
                <td>${student.rownum}</td>
                <td>${student.name}</td>
                <td>${student.phone}</td>
                <td>
                    <%--<a href="<c:url value='/student/${student.id}' />">바로가기</a>--%>
                </td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>
