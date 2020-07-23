<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ include file="../sessions/memberSession.jsp" %>      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">@import url("temp.css");</style>
</head>
<body>
<!-- Header, NavBar -->
<%@ include file="../mainPage/nav.jsp" %>


<div align="center" style="margin: 100px;">
	<table class="w3-table w3-centered w3-bordered"><caption>회원정보</caption>
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
	</table>
<button onclick="location.href='memberInfo.member'">뒤로가기</button>
</div>

<!-- Footer -->
<%@ include file="../mainPage/footer.jsp" %>
</body>
</html>