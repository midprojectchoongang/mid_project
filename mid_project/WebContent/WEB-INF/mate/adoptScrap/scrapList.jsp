<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MATE</title>
</head>
<body>
<jsp:useBean id="now" class="java.util.Date"/>
<fmt:formatDate value="${now }" pattern="yyyyMMdd" var="nowDate"/>

<!-- Header, NavBar -->
<%@ include file="../mainPage/nav.jsp" %>

<b style="font-size: 24px; position: absolute; margin-left: 25%; margin-top: -100px ">공고 스크랩</b>

<div align="center" style="margin-top: 200px; position: relative; min-height: 500px">
	<input type="hidden" name="pageNum" value="${pageNum }">
	<table class="w3-table w3-centered w3-bordered">
		<tr>
			<th>번호</th>
			<th style="background: #eee">지역</th>
			<th>대분류</th>
			<th style="background: #eee">소분류</th>	
			<th style="width: 50%">제목</th>
			<th>스크랩한 날짜</th>
		</tr>
		<c:if test="${empty list }">
			<tr>
				<th colspan="7">등록된 글이 없습니다</th>
			</tr>
		</c:if>
		<c:if test="${not empty list }">
			<c:forEach var="adopt" items="${list }">
				<tr>
					<td>${adopt.adopt_no }</td>
					<td style="background: #eee">${adopt.location_name }</td>
					<td>
					<c:if test="${adopt.largecate_id == 'd'}">강아지</c:if>
					<c:if test="${adopt.largecate_id == 'c'}">고양이</c:if>
					</td>
					<td style="background: #eee">
					<c:if test="${adopt.smallcate_id == 'd1'}">대형견</c:if>										
					<c:if test="${adopt.smallcate_id == 'd2'}">중형견</c:if>										
					<c:if test="${adopt.smallcate_id == 'd3'}">소형견</c:if>										
					<c:if test="${adopt.smallcate_id == 'c1'}">장모</c:if>										
					<c:if test="${adopt.smallcate_id == 'c2'}">단모</c:if>										
					</td>
					<td style="text-align: left">
						<a href="adoptContent.adopt?adopt_no=${adopt.adopt_no }&pageNum=${pageNum }" style="margin-left: 20px">${adopt.subject }</a>
					</td>
					<td>${adopt.reg_date }</td>
				</tr>
			</c:forEach>
		</c:if>
	</table><p>
</div>


	<!-- 페이징 -->
<div id="page1">
	<c:if test="${startPage > pagePerBlock }">
		<a href="adoptList.adopt?pageNum=${startPage - 1 }"><<</a>
	</c:if>
	<c:forEach var="i" begin="${startPage }" end="${endPage }">
		<c:if test="${i == currentPage }">
			<b>${ i }</b>
		</c:if>
		<c:if test="${i != currentPage }">
			<a href="adoptList.adopt?pageNum=${i }">${i }</a>
		</c:if>
	</c:forEach>
	<c:if test="${endPage < totalPage }">
		<a href="adoptList.adopt?pageNum=${endPage + 1 }">>></a>
	</c:if>
</div>	

<!-- Footer -->
<%@ include file="../mainPage/footer.jsp" %>
</body>
</html>