<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MATE</title>
</head>
<body>
<!-- Header, NavBar -->
<%@ include file="../mainPage/nav.jsp" %>

<b style="font-size: 24px; position: absolute; margin: -100px 0 0 46%;">회원 관리</b>

	<!-- 리스트 -->
<div align="center" style="margin-top: 200px; position: relative; min-height: 450px">
	<input type="hidden" name="pageNum" value="${pageNum }">
		<table class="w3-table w3-centered w3-bordered" style="max-width: 500px">
			<tr>
				<th>아이디</th>
				<td>${updateMem.member_id }</td>
			</tr>
			<tr>
				<th>이름</th>
				<td>${updateMem.name}</td>
			</tr>
			<tr>
				<th>이메일</th>
				<td>${updateMem.email}</td>
			</tr>
			<tr>
				<th>전화</th>
				<td>${updateMem.tel}</td>
			<tr>
				<th>주소</th>
				<td>
					<c:if test="${updateMem.location_no == 2}">서울</c:if>
					<c:if test="${updateMem.location_no == 31}">경기</c:if>
					<c:if test="${updateMem.location_no == 32}">인천</c:if>
					<c:if test="${updateMem.location_no == 41}">충남</c:if>
					<c:if test="${updateMem.location_no == 42}">대전</c:if>
					<c:if test="${updateMem.location_no == 43}">충북</c:if>
					<c:if test="${updateMem.location_no == 44}">세종</c:if>
					<c:if test="${updateMem.location_no == 51}">부산</c:if>
					<c:if test="${updateMem.location_no == 52}">울산</c:if>
					<c:if test="${updateMem.location_no == 53}">대구</c:if>
					<c:if test="${updateMem.location_no == 54}">경북</c:if>
					<c:if test="${updateMem.location_no == 55}">경남</c:if>
					<c:if test="${updateMem.location_no == 61}">전남</c:if>
					<c:if test="${updateMem.location_no == 62}">광주</c:if>
					<c:if test="${updateMem.location_no == 63}">전북</c:if>
					<c:if test="${updateMem.location_no == 64}">제주</c:if>
				</td>
			</tr>
			<tr>
				<th>경험</th>
				<td>
					<c:if test="${updateMem.experience == 'y'}">유</c:if>
					<c:if test="${updateMem.experience == 'n'}">무</c:if>
				</td>
			</tr>
			<tr>
				<th>성별</th>
				<td>
					<c:if test="${updateMem.gender == 'm'}">남</c:if>
					<c:if test="${updateMem.gender == 'f'}">여</c:if>
				</td>
			</tr>
		</table><p>
		<a href="#" onclick="location.href='memberList.master?pageNum=${pageNum}'" class="btn-two small charcoal rounded">목록</a>
		<c:if test="${updateMem.del == 'n' }">
			<a href="#" onclick="location.href='updateMember.master?member_id=${updateMem.member_id}&pageNum=${pageNum}'" class="btn-two small charcoal rounded">탈퇴</a>
		</c:if>
		<c:if test="${updateMem.del == 'y' }">
			<a href="#" onclick="location.href='updateMember.master?member_id=${updateMem.member_id}&pageNum=${pageNum}'" class="btn-two small charcoal rounded">복구</a>
		</c:if>
	</div>

<!-- Footer -->
<%@ include file="../mainPage/footer.jsp" %>
</body>
</html>