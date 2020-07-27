<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MATE</title>
<script type="text/javascript">
	function delmsg(appNo) {
	    var msg = "지원서를 삭제합니다";
		if (confirm(msg)) {
		    location.href = 'delete.application?application_no='+appNo+'&pageNum=${pageNum}';
		} else {
		    return;
		}
	}
</script>
</head>
<body>
<jsp:useBean id="now" class="java.util.Date"/>
<fmt:formatDate value="${now }" pattern="yyyyMMdd" var="nowDate"/>

<!-- Header, NavBar -->
<%@ include file="../mainPage/nav.jsp" %>

<b style="font-size: 24px; position: absolute; margin-left: 25%; margin-top: -100px ">내 지원현황</b>

<div align="center" style="margin-top: 200px; position: relative; min-height: 500px">
	<input type="hidden" name="pageNum" value="${pageNum }">
	<table class="w3-table w3-centered w3-bordered">
		<tr>
			<th>공고번호</th>
			<th>분류</th>
			<th>품종</th>
			<th>지역</th>
			<th style="width: 40%">제목</th>
			<th>작성일</th>
			<th>신청취소</th>
		</tr>
		<c:if test="${empty list }">
			<tr>
				<th colspan="7">등록한 지원서가 없습니다</th>
			</tr>
		</c:if>
		<c:if test="${not empty list }">
			<c:forEach var="application" items="${list }">
				<tr>
					<td>${application.adopt_no }</td>
					<td>
					<c:if test="${application.largecate_id == 'd'}">강아지</c:if>
					<c:if test="${application.largecate_id == 'c'}">고양이</c:if>
					</td>
					<td>
					<c:if test="${application.smallcate_id == 'd1'}">대형견</c:if>										
					<c:if test="${application.smallcate_id == 'd2'}">중형견</c:if>										
					<c:if test="${application.smallcate_id == 'd3'}">소형견</c:if>										
					<c:if test="${application.smallcate_id == 'c1'}">장모</c:if>										
					<c:if test="${application.smallcate_id == 'c2'}">단모</c:if>
					</td>
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
					<td style="text-align: left;">
					<a href="appContent.application?application_no=${application.application_no }&pageNum=${pageNum }" style="margin-left: 20px">
					${application.subject }</a>
					</td>
					<td>${application.reg_date }</td>
					<td>
						<a href="#" onclick="delmsg(${application.application_no})" style="font-size:16px; font-weight: 900; color: red">삭제</a>
					</td>
				</tr>
			</c:forEach>
		</c:if>
	</table><p>
</div>	

	<!-- 페이징 -->
<div id="page1">
	<c:if test="${startPage > pagePerBlock }">
		<a href="myAppList.application?pageNum=${startPage - 1 }"><<</a>
	</c:if>
	<c:forEach var="i" begin="${startPage }" end="${endPage }">
		<c:if test="${i == currentPage }">
			<b>${ i }</b>
		</c:if>
		<c:if test="${i != currentPage }">
			<a href="myAppList.application?pageNum=${i }">${i }</a>
		</c:if>
	</c:forEach>
	<c:if test="${endPage < totalPage }">
		<a href="myAppList.application?pageNum=${endPage + 1 }">>></a>
	</c:if>
</div>

<!-- Footer -->
<%@ include file="../mainPage/footer.jsp" %>
</body>
</html>