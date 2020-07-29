<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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

<fmt:formatDate value="${apply.reg_date }" pattern="yyyy.MM.dd  HH:mm" var="date"/>
	<div style=" position: absolute; margin-left: 25%; margin-top: -100px">
		<c:if test="${member_id == apply.member_id }">
			<b style="font-size: 24px; margin-right: 20px">내 지원서</b>
			<span style="font-weight: 900; color: grey;	">
				<table>
				<tr><td>
					${location_name2 }
					&emsp;-&emsp;
					<c:if test="${apply.largecate_id == 'd'}">강아지</c:if>
					<c:if test="${apply.largecate_id == 'c'}">고양이</c:if>
					&emsp;-&emsp;
					<c:if test="${apply.smallcate_id == 'd1'}">대형견</c:if>										
					<c:if test="${apply.smallcate_id == 'd2'}">중형견</c:if>										
					<c:if test="${apply.smallcate_id == 'd3'}">소형견</c:if>										
					<c:if test="${apply.smallcate_id == 'c1'}">장모종</c:if>										
					<c:if test="${apply.smallcate_id == 'c2'}">단모종</c:if>
				</td>
				<td>&emsp; &emsp;[제목] ${adopt.subject }
					<a href="adoptContent.adopt?adopt_no=${adopt.adopt_no }&fromApp=y" style="text-decoration:underline; font-size:10px; color: red">보러가기</a></td>
				</table>
			</span>
		</c:if>
		<c:if test="${member_id != apply.member_id }">
			<b style="font-size: 24px; margin-right: 20px">지원서 보기</b>
			<span style="font-weight: 900; color: grey;	">
				${location_name2 }
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
		</c:if>
	</div>

	<!-- 리스트 -->
<div align="center" style="margin-top: 200px; position: relative; min-height: 400px; margin-bottom: 100px">
		<input type="hidden" name="pageNum" value="${pageNum }">
		<input type="hidden" name="application_no" value="${apply.application_no }">
	<table class="w3-table w3-centered" style="max-width: 500px;"> 	
	    <tr><th rowspan="5">지원자(${apply.member_id }) 정보</th>
			<th>성별</th>
			<td>
				<c:if test="${apply.gender == 'm'}">남성</c:if>
				<c:if test="${apply.gender == 'f'}">여성</c:if>
			</td></tr><tr>
			<th>거주 지역</th>
			<td>${location_name}</td></tr><tr>
			<th>입양 경험</th>
			<td><c:if test="${apply.experience == 'y'}">있음</c:if>
				<c:if test="${apply.experience == 'n'}">없음</c:if>
			</td></tr>
		<tr><th>이메일</th>
			<td colspan="2">${apply.email }</td></tr><tr>
			<th>연락처</th>
			<td colspan="2">${apply.tel }</td>
		</tr>
	</table><p>
	<table class="w3-table w3-centered w3-bordered" style="max-width: 1000px"> 	
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
	<a href="updateForm.application?application_no=${apply.application_no }&pageNum=${pageNum }" class="btn-two mini blue rounded">수정</a>
	<a href="delmsg()" class="btn-two mini red rounded">신청 취소</a>
</c:if>
<c:if test="${not empty master_id }">
	<a href="delmsg()" class="btn-two mini red rounded">삭제</a>
</c:if>
<c:if test="${member_id == apply.member_id }">
	<a href="myAppList.application" class="btn-two mini charcoal rounded">목록</a>
</c:if>
<c:if test="${member_id != apply.member_id }">
	<a href="#" onclick="history.back()" class="btn-two mini charcoal rounded">목록</a>
</c:if>
</div>

<%@ include file="../mainPage/footer.jsp" %>
</body>
</html>