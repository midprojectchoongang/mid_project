<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../sessions/masterSession.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:if test="${not empty master_id }">
	<script type="text/javascript">
		location.href="main.main";
	</script>
</c:if>
<!-- Header, NavBar -->
<%@ include file="../mainPage/nav.jsp" %>

<div align="center" style="margin: 100px;">
<form action="login.master" method="post">
<table class="w3-table w3-centered w3-bordered"><caption>관리자 로그인</caption>
	<tr><th>관리자 계정</th><td><input type="text" name="master_id" autofocus="autofocus" required="required"></td></tr>
	<tr><th>비밀번호</th><td><input type="password" name="password" required="required"></td></tr>
	<tr><th colspan="2"><input type="submit" value="로그인"></th></tr>
</table>
</form>
</div>

<!-- Footer -->
<%@ include file="../mainPage/footer.jsp" %>
</body>
</html>