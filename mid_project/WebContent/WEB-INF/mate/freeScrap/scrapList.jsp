<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../sessions/memberSession.jsp" %>
<%@ include file="../sessions/masterSession.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="now" class="java.util.Date"/>
<fmt:formatDate value="${now }" pattern="yyyyMMdd" var="nowDate"/>

<!-- Header, NavBar -->
<%@ include file="../mainPage/nav.jsp" %>

<b style="font-size: 24px; position: absolute; margin-left: 25%; margin-top: -100px ">게시판 스크랩</b>

<div align="center" style="margin-top: 200px; position: relative; min-height: 500px">
	<input type="hidden" name="pageNum" value="${pageNum }">
	<table class="w3-table w3-centered w3-bordered">
		<tr>
			<th>번호</th>
			<th style="width:60%">제목</th>
			<th>작성일</th>
			<th>삭제</th>
		</tr>
		<c:if test="${empty list }">
			<tr>
				<th colspan="3">스크랩 글이 없습니다</th>
			</tr>
		</c:if>
		<c:if test="${not empty list }">
			<c:forEach var="free_scrap" items="${list }">
			<c:if test="${free_scrap.member_id == member_id }">
				<tr>
					<td>${free_scrap.free_no }</td>
					<td style="text-align: left">
						<a href="freeContent.free?free_no=${free_scrap.free_no }&pageNum=${pageNum }" style="margin-left: 20px">${free_scrap.subject }</a>
					</td>
					<td>${free_scrap.reg_date }</td>
					<td><button onclick="location.href='scrapDel.freeS?free_no=${free_scrap.free_no}&&pageNum=${pageNum }'">삭제</button></td>
			</c:if>
			</c:forEach>
		</c:if>
	</table><p>
</div>

	<!-- 페이징 -->
<div id="page1">
	<c:if test="${startPage > pagePerBlock }">
		<a href="freeList.free?pageNum=${startPage - 1 }"><<</a>
	</c:if>
	<c:forEach var="i" begin="${startPage }" end="${endPage }">
		<c:if test="${i == currentPage }">
			<b>${ i }</b>
		</c:if>
		<c:if test="${i != currentPage }">
			<a href="freeList.free?pageNum=${i }">${i }</a>
		</c:if>
	</c:forEach>
	<c:if test="${endPage < totalPage }">
		<a href="freeList.free?pageNum=${endPage + 1 }">>></a>
	</c:if>
</div>

<!-- Footer -->
<%@ include file="../mainPage/footer.jsp" %>
</body>
</html>