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
	<a href="viewInfo.member" class="btn-two charcoal rounded">회원정보보기</a><br>
	<a href="updateForm.member" class="btn-two charcoal rounded">회원정보수정</a><br>
	<a href="updatePwForm.member" class="btn-two charcoal rounded">비밀번호수정</a><br>
	<a href="scrapList.freeS" class="btn-two charcoal rounded">자유스크랩</a><br>
	<a href="myAppList.application" class="btn-two charcoal rounded">내 지원서</a><br>
	<a href="delete.member" class="btn-two red rounded">회원탈퇴</a>
</div>
<!-- Footer -->
<%@ include file="../mainPage/footer.jsp" %>
</body>
</html>