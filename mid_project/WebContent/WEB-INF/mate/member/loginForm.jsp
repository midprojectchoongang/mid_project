<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- Header, NavBar -->
<%@ include file="../mainPage/nav.jsp" %>

<div align="center" style="margin-top: 15%; margin-bottom: 15%;">
<form action="login.member">
	<table class="w3-table w3-centered" style="max-width:400px">
		<caption style="font-size: 25px; font-weight: 900;">로그인</caption>
		<tr><th>아이디</th>
			<td><input type="text" name="member_id" required="required" autofocus="autofocus"></td></tr>
		<tr><th>암호</th>
			<td><input type="password" name="password" required="required"></td></tr>
		<tr><th colspan="2"><input type="submit" class="btn-two small charcoal rounded" value="로그인">
			<button onclick="location.href='joinForm.member'" class="btn-two small charcoal rounded">회원가입</button></th></tr>
	</table>
</form>
</div>

<!-- Footer -->
<%@ include file="../mainPage/footer.jsp" %>
</body>
</html>