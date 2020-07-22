<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../sessions/masterSession.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function deleteChk() {
		var msg = "삭제하시겠습니까?";
		if (confirm(msg)) {
			location.href="delete.shelter?shelter_no=${shelter.shelter_no }";
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
	<table class="w3-table w3-centered w3-bordered">
	
		<tr>
			<th>${shelter.location_name }</th>
			<td>${shelter.name }</td>
			<td>${tel }</td>
		</tr>
		
	</table><p>
	<button onclick="location.href='shelterList.shelter?pageNum=${pageNum }'">목록보기</button>
	<!-- 관리자용 수정 및 삭제 버튼 -->
	<c:if test="${not empty master_id }">
		<hr>
		<button onclick="location.href='updateForm.shelter?shelter_no=${shelter.shelter_no }&pageNum=${pageNum }'">수정</button>&emsp;
		<button onclick="deleteChk()">삭제</button>
	</c:if>
</div>

<!-- Footer -->
<%@ include file="../mainPage/footer.jsp" %>
</body>
</html>