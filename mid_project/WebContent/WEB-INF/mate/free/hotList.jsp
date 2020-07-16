<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../sessions/memberSession.jsp" %>
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
<div>
	<input type="hidden" name="pageNum" value="${pageNum }">
	<table>
		<%-- <caption>
			<c:if test="${param.category == 'f'}">잡담</c:if>
			<c:if test="${param.category == 'i'}">정보</c:if>
			<c:if test="${param.category == 'a'}">후기</c:if>
		</caption> --%>
			<tr><th>번호</th><th>제목</th><th>작성자</th><th>조회수</th><th>작성일</th></tr>
		<c:if test="${empty hotList }">
			<tr><th colspan="5">등록된 글이 없습니다</th></tr>
		</c:if>
		<c:if test="${not empty hotList }">
				<c:forEach var="hotList" items="${hotList }">
					<fmt:formatDate value="${hotList.reg_date }" pattern="yyyyMMdd" var="pastDate"/>
					<tr>
						<td>${hotList.free_no }</td>
						
						<td>
						<a href="hotContent.free?free_no=${hotList.free_no }&pageNum=${pageNum }">${hotList.subject }
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
	<div align="center">
	<span><button onclick="location.href='freeList.free?category=${category }'">Hot-</button></span>
	<span>
	<c:if test="${not empty member_id }">
		<input type="button" value="글쓰기" onclick="location.href='writeForm.free?=${member_id }'"><p>
	</c:if>
	</span>
	</div>
	
	<!-- 페이징 -->
	<div align="center">
	<c:if test="${startPage > pagePerBlock }">
	<button onclick="location.href='hotList.free?pageNum=${startPage - 1 }'">이전</button>
	</c:if>
	
	<c:forEach var="i" begin="${startPage }" end="${endPage }">
		<c:if test="${i == currentPage }">
			<button onclick="location.href='hotList.free?pageNum=${i }'" disabled="disabled">${ i }</button>
		</c:if>
		<c:if test="${i != currentPage }">
			<button onclick="location.href='hotList.free?pageNum=${i }'">${i }</button>
		</c:if>
	</c:forEach>

	<c:if test="${endPage < totalPage }">
		<button onclick="location.href='hotList.free?pageNum=${endPage + 1 }'">다음</button>
	</c:if>
	</div>
</div>
</body>
</html>