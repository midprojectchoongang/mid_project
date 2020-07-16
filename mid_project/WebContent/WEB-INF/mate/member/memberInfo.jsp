<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- Header, NavBar -->
<%@ include file="../mainPage/nav.jsp" %>

<div align="center" style="margin: 100px;">
	<h2>${member.name}님 환영합니다</h2>
	<table class="w3-table w3-centered w3-bordered">
		<tr><td><button onclick="location.href='viewInfo.member'">회원정보보기</button></td></tr>
		<tr><td><button onclick="location.href='updateForm.member'">회원정보수정</button></td></tr>
		<tr><td><button onclick="location.href='updatePwForm.member'">비밀번호수정</button></td></tr>	
		<tr><td><button onclick="location.href='delete.member'">회원탈퇴</button></td></tr>
		<tr><td><button onclick="location.href='logout.main'">로그아웃</button></td></tr>
	</table>
</div>

<!-- Footer -->
<%@ include file="../mainPage/footer.jsp" %>
</body>
</html>