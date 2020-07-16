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
<style type="text/css">
@import url("temp.css");
</style>
</head>
<body>
	<table>
	<input type="hidden" name="pageNum" value="${pageNum }">
		<tr>
			<th>번호</th>
			<th>제목</th>
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
					<td><a href="freeContent.free?free_no=${free_scrap.free_no }&pageNum=${pageNum }">${free_scrap.subject }</td>
					<td>${free_scrap.reg_date }</td>
					<td><button onclick="location.href='scrapDel.freeS?free_no=${free_scrap.free_no}&pageNum=${pageNum }'">삭제</button></td>
			</c:if>
			</c:forEach>
		</c:if>
	</table>
	
	<!-- 페이징 -->
	<p>
	<div align="center">
	<c:if test="${startPage > pagePerBlock }">
	<button onclick="location.href='freeList.free?pageNum=${startPage - 1 }'"><<</button>
	</c:if>
	
	<c:forEach var="i" begin="${startPage }" end="${endPage }">
		<c:if test="${i == currentPage }">
			<button onclick="location.href='freeList.free?pageNum=${i }'" disabled="disabled">${ i }</button>
		</c:if>
		<c:if test="${i != currentPage }">
			<button onclick="location.href='freeList.free?pageNum=${i }'">${i }</button>
		</c:if>
	</c:forEach>

	<c:if test="${endPage < totalPage }">
		<button onclick="location.href='freeList.free?pageNum=${endPage + 1 }'">>></button>
	</c:if>
	</div>
</body>
</html>