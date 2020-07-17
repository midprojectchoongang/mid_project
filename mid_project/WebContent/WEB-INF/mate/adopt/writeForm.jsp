<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
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
<form action="write.adopt" method="post">
	<input type="hidden" name="member_id" value="${member_id }">
	<input type="hidden" name="pageNum" value="${pageNum }">
	<table class="w3-table w3-centered w3-bordered">
		<tr>
			<th>지역</th>
			<td>
				<select name="location_no">
				<option value="2">서울<option value="31">경기
				<option value="32">인천<option value="41">충남
				<option value="42">대전<option value="43">충북
				<option value="44">세종<option value="51">부산
				<option value="52">울산<option value="53">대구
				<option value="54">경북<option value="55">경남
				<option value="61">전남<option value="62">광주
				<option value="63">전북<option value="64">제주
				</select>
			</td>
		</tr>
		<tr>	
			<th>대분류</th>
			<td><select size="1" name="largecate_id">
					<option value="d" selected="selected">강아지</option>
					<option value="c">고양이</option>
			</select></td>
		</tr>
		<tr>
			<th>소분류</th>
			<td><select size="1" name="smallcate_id">
					<option value="d1" selected="selected">대형견</option>
					<option value="d2">중형견</option>
					<option value="d3">소형견</option>
					<option value="c1">장모</option>
					<option value="c2">단모</option>
			</select></td>
		</tr>
		<tr>
			<th>제목</th>
			<td><input type="text" name="subject" required="required" autofocus="autofocus"></td>
		</tr>
		<tr>
			<th>사진</th>
			<td><input type="file" name="adopt_image1"></td>
		</tr>
		<tr>
			<th>내용</th>
			<td><textarea name="content" rows="10" cols="50" required="required"></textarea></td>
		</tr>
	</table>

	<p>
	<div align="center">
		<input type="submit" value="등록하기" onclick="location.href='write.adopt'">
		<input type="button" value="목록보기" onclick="location.href='adoptList.adopt'">
	</div>
</form>
</div>

<!-- Footer -->
<%@ include file="../mainPage/footer.jsp" %>
</body>
</html>