<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MATE</title>
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

<div align="center" style="margin: 100px;">
		<input type="hidden" name="pageNum" value="${pageNum }">
		<input type="hidden" name="application_no" value="${apply.application_no }">
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
			<td>${location_name }
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
	<input type="button" value="수정" onclick="location.href='updateForm.adopt?adopt_no=${adopt.adopt_no }&pageNum=${pageNum }'"  class="btn-two mini blue rounded">&emsp;
	<input type="button" value="신청취소" onclick="delmsg()"  class="btn-two mini red rounded">&emsp;
</c:if>
<c:if test="${not empty master_id }">
	<input type="button" value="삭제" onclick="delmsg()" class="btn-two mini red rounded">&emsp;
</c:if>
	<a href="#" onclick="history.back()" class="btn-two mini charcoal rounded">목록</a>
</div>


</body>
</html>