<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../sessions/memberSession.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">@import url("temp.css");</style>
</head>
<body>
<jsp:useBean id="now" class="java.util.Date"/>
<fmt:formatDate value="${now }" pattern="yyyyMMdd" var="nowDate"/>
<!-- Header, NavBar -->
<%@ include file="../mainPage/nav.jsp" %>

<div align="center" style="margin: 100px;">
	<input type="hidden" name="pageNum" value="${pageNum }">
	<table class="w3-table w3-centered w3-bordered">
		<tr><th>번호</th><th>카테고리</th><th>제목</th><th>작성자</th><th>조회수</th><th>작성일</th></tr>
		<c:if test="${empty list }">
			<tr><th colspan="6">등록된 글이 없습니다</th></tr>
		</c:if>
		<c:if test="${not empty list }">
			<c:if test="${param.category == 'f' }">
				<c:forEach var="free" items="${list }">
				<c:if test="${free.category == 'f' }">
				<fmt:formatDate value="${free.reg_date }" pattern="yyyyMMdd" var="pastDate"/>
					<tr><td>${free.free_no }</td>
						<td><c:if test="${free.category == 'f'}">잡담</c:if>
							<c:if test="${free.category == 'i'}">정보</c:if>
							<c:if test="${free.category == 'a'}">후기</c:if>
						</td>
						<td><a href="freeContent.free?free_no=${free.free_no }&pageNum=${pageNum }">${free.subject }</td>
						<td>${free.member_id }</td>
						<td>${free.cnt }</td>
						<c:if test="${nowDate > pastDate }">
							<td><fmt:formatDate value="${free.reg_date }" type="date" pattern="yyyy/MM/dd"/></td>
						</c:if>
						<c:if test="${nowDate == pastDate }">
							<td><fmt:formatDate value="${free.reg_date }" type="time" pattern="HH:mm"/></td>
						</c:if></tr>
				</c:if>
				</c:forEach>
			</c:if>
			<c:if test="${param.category == 'i' }">
				<c:forEach var="free" items="${list }">
				<c:if test="${free.category == 'i' }">
				<fmt:formatDate value="${free.reg_date }" pattern="yyyyMMdd" var="pastDate"/>
					<tr><td>${free.free_no }</td>
						<td><c:if test="${free.category == 'f'}">잡담</c:if>
							<c:if test="${free.category == 'i'}">정보</c:if>
							<c:if test="${free.category == 'a'}">후기</c:if>
						</td>
						<td><a href="freeContent.free?free_no=${free.free_no }&pageNum=${pageNum }">${free.subject }</td>
						<td>${free.member_id }</td>
						<td>${free.cnt }</td>
						<c:if test="${nowDate > pastDate }">
							<td><fmt:formatDate value="${free.reg_date }" type="date" pattern="yyyy/MM/dd"/></td>
						</c:if>
						<c:if test="${nowDate == pastDate }">
							<td><fmt:formatDate value="${free.reg_date }" type="time" pattern="HH:mm"/></td>
						</c:if></tr>
				</c:if>
				</c:forEach>
			</c:if>
			<c:if test="${param.category == 'a' }">
				<c:forEach var="free" items="${list }">
				<c:if test="${free.category == 'a' }">
				<fmt:formatDate value="${free.reg_date }" pattern="yyyyMMdd" var="pastDate"/>
					<tr><td>${free.free_no }</td>
						<td><c:if test="${free.category == 'f'}">잡담</c:if>
							<c:if test="${free.category == 'i'}">정보</c:if>
							<c:if test="${free.category == 'a'}">후기</c:if>
						</td>
						<td><a href="freeContent.free?free_no=${free.free_no }&pageNum=${pageNum }">${free.subject }</td>
						<td>${free.member_id }</td>
						<td>${free.cnt }</td>
						<c:if test="${nowDate > pastDate }">
							<td><fmt:formatDate value="${free.reg_date }" type="date" pattern="yyyy/MM/dd"/></td>
						</c:if>
						<c:if test="${nowDate == pastDate }">
							<td><fmt:formatDate value="${free.reg_date }" type="time" pattern="HH:mm"/></td>
						</c:if></tr>
				</c:if>
				</c:forEach>
			</c:if>
		</c:if>
	</table><p>
	<button onclick="location.href='hotList.free?category=${param.category}'">Hot</button>
	<c:if test="${not empty member_id }">
		<input type="button" value="글쓰기" onclick="location.href='writeForm.free?category=${param.category }'"><p>
	</c:if>
	
	<!-- 페이징 -->
	<c:if test="${startPage > pagePerBlock }">
	<button onclick="location.href='freeList.free?pageNum=${startPage - 1 }'">이전</button>
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
		<button onclick="location.href='freeList.free?pageNum=${endPage + 1 }'">다음</button>
	</c:if>
</div>

<!-- Footer -->
<%@ include file="../mainPage/footer.jsp" %>
</body>
</html>