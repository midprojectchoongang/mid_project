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

<b style="font-size: 24px; position: absolute; margin-left: 25%; margin-top: -100px ">회원 관리</b>

	<!-- 리스트 -->
<div align="center" style="margin-top: 200px; position: relative; min-height: 450px">
	<table class="w3-table w3-centered w3-bordered">
		<tr><th>ID</th><th>가입일</th><th>탈퇴 여부</th></tr>
		<c:forEach items="${list }" var="member">
			<tr><td><a href="updateMemberForm.master?member_id=${member.member_id }&pageNum=${pageNum }">${member.member_id }</a></td>
				<td>${member.reg_date }</td><td>${member.del }</td><tr>
		</c:forEach>
	</table>
</div>

	<!-- 페이지 -->
<div id="page1">
	<c:if test="${startPage > pagePerBlock }">
		<a href="memberList.notice?pageNum=${startPage - 1 }"><<</a>
	</c:if>
	<c:forEach var="i" begin="${startPage }" end="${endPage }">
		<c:if test="${i == currentPage }">
			<b>${ i }</b>
		</c:if>
		<c:if test="${i != currentPage }">
			<a href="memberList.notice?pageNum=${i }">${i }</a>
		</c:if>
	</c:forEach>
	<c:if test="${endPage < totalPage }">
		<a href="memberList.notice?pageNum=${endPage + 1 }">>></a>
	</c:if>
</div>

<!-- Footer -->
<%@ include file="../mainPage/footer.jsp" %>
</body>
</html>