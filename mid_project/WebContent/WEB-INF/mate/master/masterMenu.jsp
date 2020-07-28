<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MATE</title>
</head>
<body>
<!-- Header, NavBar -->
<%@ include file="../mainPage/nav.jsp" %>

	<!-- 리스트 -->
<div align="center" style="margin-top: 15%; position: relative; margin-bottom: 15%">
	<a href="memberList.master" class="btn-two charcoal rounded"><i class="fa fa-pencil"></i> 회원 관리</a><br>
	<a href="#" class="btn-two charcoal rounded"><i class="fa fa-pencil"></i>관리자 비밀번호 수정</a><br>
	<a href="logout.main" class="btn-two red rounded"><i class="fa fa-times-circle"></i> 로그아웃</a>
</div>

<!-- Footer -->
<%@ include file="../mainPage/footer.jsp" %>
</body>
</html>