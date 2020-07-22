<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">@import url("temp.css");</style>
</head>
<body>
<!-- Header, NavBar -->
<%@ include file="../mainPage/nav.jsp" %>

<jsp:useBean id="now" class="java.util.Date"/>
<fmt:formatDate value="${now }" pattern="yyyyMMdd" var="nowDate"/>
<b style="font-size:24px; margin-left:25%; margin-top:4%; position: absolute;">HOT 게시판</b>

<div align="center" style="margin: 150px 100PX 0 100px;">
	<input type="hidden" name="pageNum" value="${pageNum }">
	<table class="w3-table w3-centered w3-bordered">
		<%-- <caption>
			<c:if test="${param.category == 'f'}">잡담</c:if>
			<c:if test="${param.category == 'i'}">정보</c:if>
			<c:if test="${param.category == 'a'}">후기</c:if>
		</caption> --%>
			<tr><th>번호</th><th>카테고리</th><th>제목</th><th>작성자</th><th>조회수</th><th>작성일</th></tr>
		<c:if test="${empty hotList }">
			<tr><th colspan="5">등록된 글이 없습니다</th></tr>
		</c:if>
		<c:if test="${not empty hotList }">
				<c:forEach var="hotList" items="${hotList }">
					<fmt:formatDate value="${hotList.reg_date }" pattern="yyyyMMdd" var="pastDate"/>
					<tr>
						<td>${hotList.free_no }</td>
						<c:if test="${hotList.category == 'f' }"><td>자유</td></c:if>
						<c:if test="${hotList.category == 'i' }"><td>정보</td></c:if>
						<c:if test="${hotList.category == 'a' }"><td>후기</td></c:if>
						<td style="width: 50%; text-align: left;">
							<a href="hotContent.free?free_no=${hotList.free_no }&pageNum=${pageNum }" style="margin-left: 20px">${hotList.subject }</a>
						</td>
						<td>${hotList.member_id }</td>
						<td>${hotList.cnt }</td>
						<c:if test="${nowDate > pastDate }">
							<td><fmt:formatDate value="${hotList.reg_date }" type="date" pattern="yyyy/MM/dd" />
							</td>
						</c:if>
						<c:if test="${nowDate == pastDate }">
							<td><fmt:formatDate value="${hotList.reg_date }" type="time" pattern="HH:mm" />
							</td>
						</c:if>
					</tr>
				</c:forEach>
			</c:if>
	</table><p>
</div>

<div id="page1">
	<c:if test="${startPage > pagePerBlock }">
		<a href="hotList.free?pageNum=${startPage - 1 }" class="btn-two page charcoal rounded">이전</a>
	</c:if>
	<c:forEach var="i" begin="${startPage }" end="${endPage }">
		<c:if test="${i == currentPage }">
			<b>${ i }</b>
		</c:if>
		<c:if test="${i != currentPage }">
			<a href="hotList.free?category=${param.category}&pageNum=${i }">${i }</a>
		</c:if>
	</c:forEach>
	<c:if test="${endPage < totalPage }">
		<a href="hotList.free?pageNum=${endPage + 1 }" class="btn-two page charcoal rounded">다음</a>
	</c:if>
</div>

<!-- Footer -->
<%@ include file="../mainPage/footer.jsp" %>
</body>
</html>