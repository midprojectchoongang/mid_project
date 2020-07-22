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
<jsp:useBean id="now" class="java.util.Date"/>
<fmt:formatDate value="${now }" pattern="yyyyMMdd" var="nowDate"/>
<!-- Header, NavBar -->
<%@ include file="../mainPage/nav.jsp" %>

<c:if test="${param.category == 'f' }">
	<b style="font-size: 24px; position: absolute; margin-left: 25%; margin-top: -100px ">자유게시판</b>
</c:if>
<c:if test="${param.category == 'i' }">
	<b style="font-size: 24px; position: absolute; margin-left: 25%; margin-top: -100px ">정보게시판</b>
</c:if>
<c:if test="${param.category == 'a' }">
	<b style="font-size: 24px; position: absolute; margin-left: 25%; margin-top: -100px ">입양 후기</b>
</c:if>
<div align="center" style="margin-top: 200px; position: relative; min-height: 500px">
	<input type="hidden" name="pageNum" value="${pageNum }">
	<table class="w3-table w3-centered w3-bordered">
		<tr><th>번호</th><th style="width: 50%">제목</th><th>작성자</th><th>조회수</th><th>작성일</th></tr>
		<c:if test="${empty list }">
			<tr><th colspan="6">등록된 글이 없습니다</th></tr>
		</c:if>
		<c:if test="${not empty list }">
			<c:if test="${param.category == 'f' }">
				<c:forEach var="free" items="${list }">
				<c:if test="${free.category == 'f' }">
				<fmt:formatDate value="${free.reg_date }" pattern="yyyyMMdd" var="pastDate"/>
					<tr><td>${free.free_no }</td>
						<td style="text-align: left;">
							<a href="freeContent.free?free_no=${free.free_no }&pageNum=${pageNum }" style="margin-left: 20px">${free.subject }</a>
						</td>
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
						<td style="width: 60%; text-align: left;">
							<a href="freeContent.free?free_no=${free.free_no }&pageNum=${pageNum }" style="margin-left: 20px">${free.subject }</a>
						</td>
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
						<td style="width: 60%; text-align: left;">
							<a href="freeContent.free?free_no=${free.free_no }&pageNum=${pageNum }" style="margin-left: 20px">${free.subject }</a>
						</td>
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
</div>

<c:if test="${not empty member_id }">
	<div style="text-align: center; height: 80px">
		<span style="float: right; margin-right: 20%">
			<a href="writeForm.free?category=${param.category }" class="btn-two small charcoal rounded">글쓰기</a>
		</span>
	</div>
</c:if>
	
<div id="page1">
	<c:if test="${startPage > pagePerBlock }">
		<a href="freeList.free?pageNum=${startPage - 1 }" class="btn-two page charcoal rounded">이전</a>
	</c:if>
	<c:forEach var="i" begin="${startPage }" end="${endPage }">
		<c:if test="${i == currentPage }">
			<b>${ i }</b>
		</c:if>
		<c:if test="${i != currentPage }">
			<a href="freeList.free?category=${param.category}&pageNum=${i }">${i }</a>
		</c:if>
	</c:forEach>
	<c:if test="${endPage < totalPage }">
		<a href="freeList.free?pageNum=${endPage + 1 }" class="btn-two page charcoal rounded">다음</a>
	</c:if>
</div>

<!-- Footer -->
<%@ include file="../mainPage/footer.jsp" %>
</body>
</html>