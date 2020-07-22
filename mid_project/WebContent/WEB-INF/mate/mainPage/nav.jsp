<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../sessions/memberSession.jsp" %>
<%@ include file="../sessions/masterSession.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">@import url("main.css");@import url("btn.css");</style>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body id="Top">
<div class="w3-top">
	<div class="w3-bar w3-theme-d2 w3-left-align">
		<a href="main.main" class="w3-bar-item w3-button w3-teal"><i class="fa fa-home w3-margin-right"></i>홈</a>
		<a href="noticeList.notice" class="w3-bar-item w3-button w3-hide-small w3-hover-white">공지사항</a>
		<a href="adoptList.adopt" class="w3-bar-item w3-button w3-hide-small w3-hover-white">공고</a>
		<div class="w3-dropdown-hover w3-hide-small">
    		<button class="w3-button w3-hide-small w3-hover-white">게시판 <i class="fa fa-caret-down"></i></button>     
			<div class="w3-dropdown-content w3-card-4 w3-bar-block">
				<a href="hotList.free" class="w3-bar-item w3-button">HOT</a>
				<a href="freeList.free?category=f" class="w3-bar-item w3-button">자유</a>
				<a href="freeList.free?category=i" class="w3-bar-item w3-button">정보</a>
				<a href="freeList.free?category=a" class="w3-bar-item w3-button">입양 후기</a>
			</div>
		</div>
		<a href="shelterList.shelter" class="w3-bar-item w3-button w3-hide-small w3-hover-white">보호소</a>
		<c:if test="${empty member_id && empty master_id }">
			<a href="loginForm.member" class="w3-bar-item w3-button w3-hide-small w3-right w3-hover-teal">로그인</a>
		</c:if>
		<c:if test="${not empty member_id }">
			<a href="logout.main" class="w3-bar-item w3-button w3-hide-small w3-right w3-hover-teal">로그아웃</a>
			<a href="memberInfo.member" class="w3-bar-item w3-button w3-hide-small w3-right w3-hover-teal">내 정보보기</a>
		</c:if>
		<c:if test="${not empty master_id }">
			<a href="masterMenu.master" class="w3-bar-item w3-button w3-hide-small w3-right w3-hover-teal">관리자 메뉴보기</a>
		</c:if>
	</div>
</div>
</body>
</html>