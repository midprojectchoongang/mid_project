<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">@import url("btn.css");</style>
</head>
<body>
<!-- Header, NavBar -->
<%@ include file="../mainPage/nav.jsp" %>

<div align="center" style="margin: 100px;">
	<h2 style="margin: 50px">${member.name}님 환영합니다</h2>
	<div class="button-4"><div class="eff-4"></div><a href="viewInfo.member">회원정보보기</a></div>
	<div class="button-4"><div class="eff-4"></div><a href="updateForm.member">회원정보수정</a></div>
	<div class="button-4"><div class="eff-4"></div><a href="updatePwForm.member">비밀번호수정</a></div>
	<div class="button-4"><div class="eff-4"></div><a href="delete.member">회원탈퇴</a></div>
	<div class="button-4"><div class="eff-4"></div><a href="logout.main">로그아웃</a></div>
</div>

<!-- Footer -->
<%@ include file="../mainPage/footer.jsp" %>
</body>
</html>