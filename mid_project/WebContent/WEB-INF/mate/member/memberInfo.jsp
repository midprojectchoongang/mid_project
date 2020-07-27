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

<div align="center" style="margin: 15% 100px 15% 100px;">
	<h2>${member.name}님 환영합니다</h2>
	<a href="#" class="btn-two charcoal rounded fixed">내 공고</a>
	<a href="myAppList.application" class="btn-two charcoal rounded fixed">내 지원서</a>
	<a href="scrapList.adoptS" class="btn-two charcoal rounded fixed">공고스크랩</a>
	<a href="scrapList.freeS" class="btn-two charcoal rounded fixed">자유스크랩</a><br>
	<a href="viewInfo.member" class="btn-two charcoal rounded fixed">내 정보보기</a>
	<a href="updateForm.member" class="btn-two charcoal rounded fixed">내 정보수정</a>
	<a href="updatePwForm.member" class="btn-two charcoal rounded fixed">비밀번호수정</a>
	<a href="delete.member" class="btn-two red rounded fixed">회원탈퇴</a>
</div>
<!-- Footer -->
<%@ include file="../mainPage/footer.jsp" %>
</body>
</html>