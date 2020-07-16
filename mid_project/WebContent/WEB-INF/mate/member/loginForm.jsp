<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../sessions/memberSession.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:if test="${not empty member_id }">
	<script type="text/javascript">
		location.href="main.main";
	</script>
</c:if>
<!-- Header, NavBar -->
<%@ include file="../mainPage/nav.jsp" %>

<div align="center" style="margin: 100px;">
<form action="login.member">
	<table class="w3-table w3-centered w3-bordered">
		<caption>로그인</caption>
		<tr><th>아이디</th>
			<td><input type="text" name="member_id" required="required" autofocus="autofocus"></td></tr>
		<tr><th>암호</th>
			<td><input type="password" name="password" required="required"></td></tr>
		<tr><th colspan="2"><input type="submit"></th></tr>
	</table>
</form>
	<a href="joinForm.member">회원가입</a>&emsp;
	<a href="loginForm.master">관리자 로그인</a>
</div>

<!-- Footer -->
<%@ include file="../mainPage/footer.jsp" %>
</body>
</html>