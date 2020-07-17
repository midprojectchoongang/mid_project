<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../sessions/memberSession.jsp" %>
<%@ include file="../sessions/masterSession.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">@import url("temp.css");</style>
<script type="text/javascript">
	function delmsg() {
	    var msg = "게시물을 삭제합니다";
		if (confirm(msg)) {
		    location.href = 'delete.adopt?adopt_no=${adopt.adopt_no}&pageNum=${pageNum}';
		} else {
		    return;
		}
	}
</script>
</head>
<body>
<!-- Header, NavBar -->
<%@ include file="../mainPage/nav.jsp" %>

<div align="center" style="margin: 100px;">
		<input type="hidden" name="pageNum" value="${pageNum }">
		<input type="hidden" name="adopt_no" value="${adopt.adopt_no }">
	<table class="w3-table w3-centered w3-bordered">
		<tr>
			<th>카테고리</th>
			<td>
				<c:if test="${adopt.largecate_id == 'd'}">강아지</c:if>
				<c:if test="${adopt.smallcate_id == 'c'}">고양이</c:if>
			</td>
			<td>
				<c:if test="${adopt.smallcate_id == 'd1'}">대형견</c:if>										
				<c:if test="${adopt.smallcate_id == 'd2'}">중형견</c:if>										
				<c:if test="${adopt.smallcate_id == 'd3'}">소형견</c:if>										
				<c:if test="${adopt.smallcate_id == 'c1'}">장모</c:if>										
				<c:if test="${adopt.smallcate_id == 'c2'}">단모</c:if>										
			</td>
			<th>제목</th>
			<td>${adopt.subject }</td>
		</tr>
		<tr>
			<th>작성자</th>
			<td colspan="2">${adopt.member_id }</td>
			<th>작성일</th>
			<td>${adopt.reg_date }</td>
		</tr>
		<tr>
			<td colspan="5">${adopt.content }</td>
		</tr>
	</table>
	<p>

<c:if test="${member_id == adopt.member_id }">
	<input type="button" value="수정" onclick="location.href='updateForm.adopt?adopt_no=${adopt.adopt_no }&pageNum=${pageNum }'">&emsp;
	<input type="button" value="삭제" onclick="delmsg()">&emsp;
</c:if>
<c:if test="${not empty master_id }">
	<input type="button" value="삭제" onclick="delmsg()">&emsp;
</c:if>
<c:if test="${not empty member_id && member_id != adopt.member_id}">
	<input type="button" value="스크랩" onclick="location.href='scrapChk.adoptS?adopt_no=${adopt.adopt_no }&pageNum=${pageNum }'">&emsp;
</c:if>
	<input type="button" value="목록보기" onclick="location.href='adoptList.adopt?pageNum=${pageNum}'">
</div>
	
</body>
</html>