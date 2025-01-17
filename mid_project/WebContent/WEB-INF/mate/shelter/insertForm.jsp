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

<div align="center" style="margin-top: 200px; position: relative; min-height: 450px">
<form action="insert.shelter" method="post">
	<table class="w3-table w3-centered w3-bordered" style="max-width: 400px">
		<tr><th>지역</th>
		<td><select name="location_no">
			<option value="2">서울<option value="31">경기
			<option value="32">인천<option value="41">충남
			<option value="42">대전<option value="43">충북
			<option value="44">세종<option value="51">부산
			<option value="52">울산<option value="53">대구
			<option value="54">경북<option value="55">경남
			<option value="61">전남<option value="62">광주
			<option value="63">전북<option value="64">제주
		</select></td></tr>
		<tr><th>이름</th><td><input type="text" name="name" required="required"></td></tr>
		<tr><th>전화번호</th><td>
		<input type="tel" name="tel" required="required" pattern="\d{2,3}-\d{3,4}-\d{4}"></td></tr>
	</table><p>
		<input type="submit" class="btn-two small blue rounded" value="확인">
	<button onclick="location.href='shelterList.shelter'" class="btn-two small red rounded">취소</button>
</form>
</div>

<!-- Footer -->
<%@ include file="../mainPage/footer.jsp" %>
</body>
</html>