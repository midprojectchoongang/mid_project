<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../sessions/memberSession.jsp" %>
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
		<tr>
			<th>번호</th>
			<th>지역</th>
			<th>대분류</th>
			<th>소분류</th>	
			<th>제목</th>
			<th>작성일</th>
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
					<td>
					<c:if test="${adopt.location_no == 2}">서울</c:if>
					<c:if test="${adopt.location_no == 31}">경기</c:if>
					<c:if test="${adopt.location_no == 32}">인천</c:if>
					<c:if test="${adopt.location_no == 41}">충남</c:if>
					<c:if test="${adopt.location_no == 42}">대전</c:if>
					<c:if test="${adopt.location_no == 43}">충북</c:if>
					<c:if test="${adopt.location_no == 44}">세종</c:if>
					<c:if test="${adopt.location_no == 51}">부산</c:if>
					<c:if test="${adopt.location_no == 52}">울산</c:if>
					<c:if test="${adopt.location_no == 53}">대구</c:if>
					<c:if test="${adopt.location_no == 54}">경북</c:if>
					<c:if test="${adopt.location_no == 55}">경남</c:if>
					<c:if test="${adopt.location_no == 61}">전남</c:if>
					<c:if test="${adopt.location_no == 62}">광주</c:if>
					<c:if test="${adopt.location_no == 63}">전북</c:if>
					<c:if test="${adopt.location_no == 64}">제주</c:if>
					</td>
					<td>
					<c:if test="${adopt.largecate_id == 'd'}">강아지</c:if>
					<c:if test="${adopt.largecate_id == 'c'}">고양이</c:if>
					</td>
					<td>
					<c:if test="${adopt.smallcate_id == 'd1'}">대형견</c:if>										
					<c:if test="${adopt.smallcate_id == 'd2'}">중형견</c:if>										
					<c:if test="${adopt.smallcate_id == 'd3'}">소형견</c:if>										
					<c:if test="${adopt.smallcate_id == 'c1'}">장모</c:if>										
					<c:if test="${adopt.smallcate_id == 'c2'}">단모</c:if>										
					</td>
					<td><a href="adoptContent.adopt?adopt_no=${adopt.adopt_no }&pageNum=${pageNum }">${adopt.subject }</a></td>
					<td>${adopt.reg_date }</td>
				</tr>
			</c:forEach>
		</c:if>
	</table>
	<p>
	<div align="center">
		<input type="button" value="공고글 작성" onclick="location.href='writeForm.adopt'">
	</div>
	
	<!-- 페이징 -->
	<c:if test="${startPage > pagePerBlock }">
	<button onclick="location.href='adoptList.adopt?pageNum=${startPage - 1 }'"><<</button>
	</c:if>
	
	<c:forEach var="i" begin="${startPage }" end="${endPage }">
		<c:if test="${i == currentPage }">
			<button onclick="location.href='adoptList.adopt?pageNum=${i }'" disabled="disabled">${ i }</button>
		</c:if>
		<c:if test="${i != currentPage }">
			<button onclick="location.href='adoptList.adopt?pageNum=${i }'">${i }</button>
		</c:if>
	</c:forEach>

	<c:if test="${endPage < totalPage }">
		<button onclick="location.href='adoptList.adopt?pageNum=${endPage + 1 }'">>></button>
	</c:if>
                                                    
</div>
<!-- Footer -->
<%@ include file="../mainPage/footer.jsp" %>
</body>
</html>