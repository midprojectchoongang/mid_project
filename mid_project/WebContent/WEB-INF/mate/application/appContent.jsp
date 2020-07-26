<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function delmsg() {
	    var msg = "지원서를 삭제합니다";
		if (confirm(msg)) {
		    location.href = 'delete.application?application_no=${application_no}&pageNum=${pageNum}';
		} else {
		    return;
		}
	}
</script>
</head>
<body>
<!-- Header, NavBar -->
<%@ include file="../mainPage/nav.jsp" %>

<fmt:formatDate value="${apply.reg_date }" pattern="yyyy.MM.dd  HH:mm" var="date"/>
<c:if test="${member_id == apply.member_id }">
	<div style=" position: absolute; margin-left: 25%; margin-top: -100px">
		<b style="font-size: 24px; margin-right: 20px">내 지원서</b>
		<span style="font-weight: 900; color: grey;	">
			<c:if test="${apply.location_no == 2}">서울</c:if>
			<c:if test="${apply.location_no == 31}">경기</c:if>
			<c:if test="${apply.location_no == 32}">인천</c:if>
			<c:if test="${apply.location_no == 41}">충남</c:if>
			<c:if test="${apply.location_no == 42}">대전</c:if>
			<c:if test="${apply.location_no == 43}">충북</c:if>
			<c:if test="${apply.location_no == 44}">세종</c:if>
			<c:if test="${apply.location_no == 51}">부산</c:if>
			<c:if test="${apply.location_no == 52}">울산</c:if>
			<c:if test="${apply.location_no == 53}">대구</c:if>
			<c:if test="${apply.location_no == 54}">경북</c:if>
			<c:if test="${apply.location_no == 55}">경남</c:if>
			<c:if test="${apply.location_no == 61}">전남</c:if>
			<c:if test="${apply.location_no == 62}">광주</c:if>
			<c:if test="${apply.location_no == 63}">전북</c:if>
			<c:if test="${apply.location_no == 64}">제주</c:if>
			&emsp;-&emsp;
			<c:if test="${apply.largecate_id == 'd'}">강아지</c:if>
			<c:if test="${apply.largecate_id == 'c'}">고양이</c:if>
			&emsp;-&emsp;
			<c:if test="${apply.smallcate_id == 'd1'}">대형견</c:if>										
			<c:if test="${apply.smallcate_id == 'd2'}">중형견</c:if>										
			<c:if test="${apply.smallcate_id == 'd3'}">소형견</c:if>										
			<c:if test="${apply.smallcate_id == 'c1'}">장모종</c:if>										
			<c:if test="${apply.smallcate_id == 'c2'}">단모종</c:if>
		</span>
	</div>
</c:if>
<c:if test="${member_id != apply.member_id }">
	<div style=" position: absolute; margin-left: 25%; margin-top: -100px">
		<b style="font-size: 24px; margin-right: 20px">지원서 보기</b>
		<span style="font-weight: 900; color: grey;	">
			<c:if test="${apply.location_no == 2}">서울</c:if>
			<c:if test="${apply.location_no == 31}">경기</c:if>
			<c:if test="${apply.location_no == 32}">인천</c:if>
			<c:if test="${apply.location_no == 41}">충남</c:if>
			<c:if test="${apply.location_no == 42}">대전</c:if>
			<c:if test="${apply.location_no == 43}">충북</c:if>
			<c:if test="${apply.location_no == 44}">세종</c:if>
			<c:if test="${apply.location_no == 51}">부산</c:if>
			<c:if test="${apply.location_no == 52}">울산</c:if>
			<c:if test="${apply.location_no == 53}">대구</c:if>
			<c:if test="${apply.location_no == 54}">경북</c:if>
			<c:if test="${apply.location_no == 55}">경남</c:if>
			<c:if test="${apply.location_no == 61}">전남</c:if>
			<c:if test="${apply.location_no == 62}">광주</c:if>
			<c:if test="${apply.location_no == 63}">전북</c:if>
			<c:if test="${apply.location_no == 64}">제주</c:if>
			&emsp;-&emsp;
			<c:if test="${apply.largecate_id == 'd'}">강아지</c:if>
			<c:if test="${apply.largecate_id == 'c'}">고양이</c:if>
			&emsp;-&emsp;
			<c:if test="${apply.smallcate_id == 'd1'}">대형견</c:if>										
			<c:if test="${apply.smallcate_id == 'd2'}">중형견</c:if>										
			<c:if test="${apply.smallcate_id == 'd3'}">소형견</c:if>										
			<c:if test="${apply.smallcate_id == 'c1'}">장모종</c:if>										
			<c:if test="${apply.smallcate_id == 'c2'}">단모종</c:if>
		</span>
	</div>
</c:if>

	<!-- 리스트 -->
<div align="center" style="margin-top: 200px; position: relative; min-height: 400px;">
		<input type="hidden" name="pageNum" value="${pageNum }">
		<input type="hidden" name="application_no" value="${apply.application_no }">
	<table class="w3-table w3-centered w3-bordered"> 	
		<tr>
			<th width="100">제목</th>
			<td style="text-align:left">${apply.subject }</td>
			<td width="150">${apply.member_id }<br>${date }</td>
		</tr>
		<tr height="300">
			<td colspan="3" style="text-align: left; padding: 50px"><pre>${apply.content }</pre></td>
		</tr>
	</table>
	<p>

<c:if test="${member_id == apply.member_id }">
	<a href="updateForm.adopt?adopt_no=${adopt.adopt_no }&pageNum=${pageNum }" class="btn-two mini blue rounded">수정</a>
	<a href="delmsg()" class="btn-two mini red rounded">신청 취소</a>
</c:if>
<c:if test="${not empty master_id }">
	<a href="delmsg()" class="btn-two mini red rounded">삭제</a>
</c:if>
	<a href="#" onclick="history.back()" class="btn-two mini charcoal rounded">목록</a>
</div>


</body>
</html>