<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- Header, NavBar -->
<%@ include file="../mainPage/nav.jsp" %>

<b style="font-size: 24px; position: absolute; margin: -100px 0 0 47%;">회원정보</b>

<div align="center" style="margin-top: 200px; position: relative; min-height: 450px">
	<table class="w3-table w3-centered w3-bordered" style="max-width: 300px">
		<tr><th>아이디</th><td>${member.member_id}</td></tr>
		<tr><th>이름</th><td>${member.name}</td></tr>
		
		<tr><th>성별</th>
			<td><c:if test="${member.gender=='m' }">남자</c:if>
				<c:if test="${member.gender=='f' }">여자</c:if></td>
		</tr>
		
		<tr><th>이메일</th><td>${member.email}</td></tr>
		<tr><th>전화</th><td>${member.tel}</td></tr>
		<tr><th>거주 지역</th><td>${location}</td></tr>
		
		<tr><th>경험</th>
			<td><c:if test="${member.experience=='y' }">유</c:if>
				<c:if test="${member.experience=='n' }">무</c:if></td>
		</tr>
		
		<tr><th>가입일</th><td>${member.reg_date}</td></tr>
	</table><p>
	<button onclick="location.href='memberInfo.member'" class="btn-two small charcoal rounded">뒤로가기</button>
</div>

<!-- Footer -->
<%@ include file="../mainPage/footer.jsp" %>
</body>
</html>