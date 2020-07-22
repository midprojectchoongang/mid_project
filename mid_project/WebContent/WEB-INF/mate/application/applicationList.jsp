<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<div align="center" style="margin-top: 200px; position: relative; min-height: 500px">
	<input type="hidden" name="pageNum" value="${pageNum }">
	<table class="w3-table w3-centered w3-bordered">
		<c:if test="${empty appList}">
			<tr>
				<th colspan="5">등록된 지원서가 없습니다</th>
			</tr>
		</c:if>
		
		<c:if test="${not empty appList}">
		<tr>
			<th>지역</th>
			<th>성별</th>
			<th>반려동물 경험</th>
			<th style="width: 50%">제목</th>
			<th>작성일</th>
		</tr>
			<c:forEach var="application" items="${appList }">
				<tr>
					<td>
					<c:if test="${application.location_no == 2}">서울</c:if>
					<c:if test="${application.location_no == 31}">경기</c:if>
					<c:if test="${application.location_no == 32}">인천</c:if>
					<c:if test="${application.location_no == 41}">충남</c:if>
					<c:if test="${application.location_no == 42}">대전</c:if>
					<c:if test="${application.location_no == 43}">충북</c:if>
					<c:if test="${application.location_no == 44}">세종</c:if>
					<c:if test="${application.location_no == 51}">부산</c:if>
					<c:if test="${application.location_no == 52}">울산</c:if>
					<c:if test="${application.location_no == 53}">대구</c:if>
					<c:if test="${application.location_no == 54}">경북</c:if>
					<c:if test="${application.location_no == 55}">경남</c:if>
					<c:if test="${application.location_no == 61}">전남</c:if>
					<c:if test="${application.location_no == 62}">광주</c:if>
					<c:if test="${application.location_no == 63}">전북</c:if>
					<c:if test="${application.location_no == 64}">제주</c:if>
					</td>
					<td>
					<c:if test="${application.gender == 'm'}">남</c:if>
					<c:if test="${application.gender == 'f'}">여</c:if>
					</td>
					<td>
					<c:if test="${application.experience == 'y'}">유</c:if>
					<c:if test="${application.experience == 'n'}">무</c:if>
					</td>
					<td>
					<a href="appContent.application?application_no=${application.application_no }&pageNum=${pageNum }"></a>
					${application.subject }
					</td>
					<td>${application.reg_date }</td>
				</tr>
			</c:forEach>
		</c:if>
	</table><p>
</div>

	<!-- 페이징 -->
<div id="page1">
	<c:if test="${startPage > pagePerBlock }">
		<a href="applicationList.application?pageNum=${startPage - 1 }"><<</a>
	</c:if>
	<c:forEach var="i" begin="${startPage }" end="${endPage }">
		<c:if test="${i == currentPage }">
			<b>${ i }</b>
		</c:if>
		<c:if test="${i != currentPage }">
			<a href="applicationList.application?pageNum=${i }">${i }</a>
		</c:if>
	</c:forEach>
	<c:if test="${endPage < totalPage }">
		<a href="location.href='applicationList.application?pageNum=${endPage + 1 }">>></a>
	</c:if>
</div>

</body>
</html>