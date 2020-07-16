<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../sessions/masterSession.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- Header, NavBar -->
<%@ include file="../mainPage/nav.jsp" %>

<jsp:useBean id="now" class="java.util.Date"/>
<fmt:formatDate value="${now }" pattern="yyyyMMdd" var="nowDate"/>
<div align="center" style="margin: 100px;">
	<!-- 리스트 -->
	<table class="w3-table w3-centered w3-bordered">
		<tr><th>번호</th><th>제목</th><th>작성일</th></tr>
		<c:if test="${empty list }">
			<tr><th colspan="3">작성된 공지사항이 없습니다</th></tr>
		</c:if>
		<c:if test="${not empty list }">
		<c:forEach items="${list }" var="notice">
			<fmt:formatDate value="${notice.reg_date }" pattern="yyyyMMdd" var="pastDate"/>
			<tr><th>${notice.notice_no }</th>
				<td><a href="noticeContent.notice?notice_no=${notice.notice_no }&pageNum=${pageNum }">${notice.subject }</a></td>
				<c:if test="${nowDate > pastDate }">
				<td><fmt:formatDate value="${notice.reg_date }" type="date" pattern="yyyy/MM/dd"/></td>
				</c:if>
				<c:if test="${nowDate == pastDate }">
				<td><fmt:formatDate value="${notice.reg_date }" type="time" pattern="HH:mm"/></td>
				</c:if></tr>
			</c:forEach>
		</c:if>
	</table><p>
	<!-- 페이지 -->
	<c:if test="${startPage > pagePerBlock }">
		<button onclick="location.href='noticeList.notice?pageNum=${startPage - 1 }'">이전</button>
	</c:if>
	<c:forEach var="i" begin="${startPage }" end="${endPage }">
		<c:if test="${i == currentPage }">
			<button onclick="location.href='noticeList.notice?pageNum=${i }'" disabled="disabled">${ i }</button>
		</c:if>
		<c:if test="${i != currentPage }">
			<button onclick="location.href='noticeList.notice?pageNum=${i }'">${i }</button>
		</c:if>
	</c:forEach>
	<c:if test="${endPage < totalPage }">
		<button onclick="location.href='noticeList.notice?pageNum=${endPage + 1 }'">다음</button>
	</c:if>
	<!-- 관리자용 작성버튼 -->
	<c:if test="${not empty master_id }">
		<hr>
		<button onclick="location.href='insertForm.notice'">공지 작성</button>
	</c:if>
</div>

<!-- Footer -->
<%@ include file="../mainPage/footer.jsp" %>
</body>
</html>