<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<b style="font-size:24px; margin-left:25%; margin-top:4%; position: absolute;">공지사항</b>

<!-- 관리자용 작성버튼 -->
<c:if test="${not empty master_id }">
	<a href="insertForm.notice" class="btn-two small charcoal rounded" style="position: absolute; margin-top: 6%; margin-left: 70%">공지 작성</a>
</c:if>

<div align="center" style="margin: 150px 100PX 0 100px;">
	<!-- 리스트 -->
	<table class="w3-table w3-centered w3-bordered">
		<tr><th>번호</th><th>제목</th><th>등록일</th></tr>
		<c:if test="${empty list }">
			<tr><th colspan="3">작성된 공지사항이 없습니다</th></tr>
		</c:if>
		<c:if test="${not empty list }">
		<c:forEach items="${list }" var="notice">
			<fmt:formatDate value="${notice.reg_date }" pattern="yyyyMMdd" var="pastDate"/>
			<tr><th>${notice.notice_no }</th>
				<td style="width: 600px; text-align: left;"><a href="noticeContent.notice?notice_no=${notice.notice_no }&pageNum=${pageNum }">${notice.subject }</a></td>
				<c:if test="${nowDate > pastDate }">
				<td><fmt:formatDate value="${notice.reg_date }" type="date" pattern="yyyy/MM/dd"/></td>
				</c:if>
				<c:if test="${nowDate == pastDate }">
				<td><fmt:formatDate value="${notice.reg_date }" type="time" pattern="HH:mm"/></td>
				</c:if></tr>
			</c:forEach>
		</c:if>
	</table><p>
</div>

	<!-- 페이지 -->
<div id="page1">
	<c:if test="${startPage > pagePerBlock }">
		<a href="noticeList.notice?pageNum=${startPage - 1 }" class="btn-two page charcoal rounded">이전</a>
	</c:if>
	<c:forEach var="i" begin="${startPage }" end="${endPage }">
		<c:if test="${i == currentPage }">
			<b>${ i }</b>
		</c:if>
		<c:if test="${i != currentPage }">
			<a href="noticeList.notice?pageNum=${i }">${i }</a>
		</c:if>
	</c:forEach>
	<c:if test="${endPage < totalPage }">
		<a href="noticeList.notice?pageNum=${endPage + 1 }" class="btn-two page charcoal rounded">다음</a>
	</c:if>
</div>

<!-- Footer -->
<%@ include file="../mainPage/footer.jsp" %>
</body>
</html>