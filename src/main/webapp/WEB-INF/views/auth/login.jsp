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
    <title>Title</title>
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

<form action="/auth/login_check" method="post">
    <table border="1" align="center">
        <tbody>
        <tr>
            <th>아이디:</th>
            <td><input type="text" name="id"></td>
        </tr>
        <tr>
            <th>비밀번호:</th>
            <td><input type="password" name="pwd"></td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <input type="submit" value="로그인">
                <input type="button" onclick="location.href='/auth/sign-up'" value="회원가입">
            </td>
        </tr>
        </tbody>
    </table>
</form>

</body>
</html>
