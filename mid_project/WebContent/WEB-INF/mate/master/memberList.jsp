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

<!-- 회원 목록 -->
<div align="center" style="margin: 100px;">
	<h3>회원 관리</h3>
	<table class="w3-table w3-centered w3-bordered">
		<tr><th>ID</th><th>가입일</th><th>탈퇴 여부</th></tr>
		<c:forEach items="${list }" var="member">
			<tr><td><a href="updateMemberForm.master?member_id=${member.member_id }">${member.member_id }</a></td>
				<td>${member.reg_date }</td><td>${member.del }</td><tr>
		</c:forEach>
	</table>
</div>

<!-- Footer -->
<%@ include file="../mainPage/footer.jsp" %>
</body>
</html>