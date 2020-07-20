<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function delmsg() {
	    var msg = "지원서를 삭제합니다";
		if (confirm(msg)) {
		    location.href = 'delete.adopt?adopt_no=${adopt.adopt_no}&pageNum=${pageNum}';
		} else {
		    return;
		}
	}
</script>
</head>
<body>
<!-- Header, NavBar -->
<%@ include file="../mainPage/nav.jsp" %>

<div align="center" style="margin: 100px;">
		<input type="hidden" name="pageNum" value="${pageNum }">
		<input type="hidden" name="adopt_no" value="${adopt.adopt_no }">
	<table class="w3-table w3-centered w3-bordered">
		<tr>
			<th>분류</th>
			<td>
				<c:if test="${apply.largecate_id == 'd'}">강아지</c:if>
				<c:if test="${apply.largecate_id == 'c'}">고양이</c:if>
			</td>
			<th>품종</th>
			<td>
				<c:if test="${apply.smallcate_id == 'd1'}">대형견</c:if>										
				<c:if test="${apply.smallcate_id == 'd2'}">중형견</c:if>										
				<c:if test="${apply.smallcate_id == 'd3'}">소형견</c:if>										
				<c:if test="${apply.smallcate_id == 'c1'}">장모</c:if>										
				<c:if test="${apply.smallcate_id == 'c2'}">단모</c:if>										
			</td>
			<th>지역</th>
			<td>
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
			</td>
		</tr>
		<tr>
			<th>제목</th>
			<td colspan="2">${apply.subject }</td>
			<th>작성일</th>
			<td colspan="2">${apply.reg_date }</td>
		</tr>
		<tr>
			<td colspan="6">${apply.content }</td>
		</tr>
	</table>
	<p>

<c:if test="${member_id == apply.member_id }">
	<input type="button" value="수정" onclick="location.href='updateForm.adopt?adopt_no=${adopt.adopt_no }&pageNum=${pageNum }'">&emsp;
	<input type="button" value="신청취소" onclick="delmsg()">&emsp;
</c:if>
<c:if test="${not empty master_id }">
	<input type="button" value="삭제" onclick="delmsg()">&emsp;
</c:if>
	<input type="button" value="목록보기" onclick="location.href='myAppList.application?pageNum=${pageNum}'">
</div>


</body>
</html>