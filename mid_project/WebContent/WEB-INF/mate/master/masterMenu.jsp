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

<div align="center" style="margin: 100px;">
	<h2>관리자 메뉴</h2>
	<a href="memberList.master" class="btn-two charcoal rounded"><i class="fa fa-pencil"></i> 회원 관리</a><br>
	<a href="#" class="btn-two charcoal rounded"><i class="fa fa-pencil"></i> 삭제된 게시물 관리</a><br>
	<a href="#" class="btn-two charcoal rounded"><i class="fa fa-pencil"></i> 관리자 비밀번호 수정</a><br>
	<a href="logout.main" class="btn-two red rounded"><i class="fa fa-times-circle"></i> 로그아웃</a>
</div>

<!-- Footer -->
<%@ include file="../mainPage/footer.jsp" %>
</body>
</html>