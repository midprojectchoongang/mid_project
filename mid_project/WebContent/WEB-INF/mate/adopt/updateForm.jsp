<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<form action="update.adopt" method="post">
	<table class="w3-table w3-centered w3-bordered">
	<input type="hidden" name="pageNum" value="${pageNum}">
	<input type="hidden" name="adopt_no" value="${adopt.adopt_no}">
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
			<td>
				<select size="1" name="largecate_id">
				<c:if test="${adopt.largecate_id == 'd'}"><option value="d" selected="selected">강아지</option></c:if>
				<c:if test="${adopt.largecate_id == 'c'}"><option value="c" selected="selected">고양이</option></c:if>
				<c:if test="${adopt.largecate_id != 'd'}"><option value="d">강아지</option></c:if>
				<c:if test="${adopt.largecate_id != 'c'}"><option value="c">고양이</option></c:if>
				</select>
			</td>
		</tr>
		<tr>
			<th>소분류</th>
			</td>
				<select size="1" name="smallcate_id">
				<c:if test="${adopt.largecate_id == 'd1'}"><option value="d1" selected="selected">대형견</option></c:if>
				<c:if test="${adopt.largecate_id == 'd2'}"><option value="d2" selected="selected">중형견</option></c:if>
				<c:if test="${adopt.largecate_id == 'd3'}"><option value="d3" selected="selected">소형견</option></c:if>
				<c:if test="${adopt.largecate_id == 'c1'}"><option value="c1" selected="selected">장모</option></c:if>
				<c:if test="${adopt.smallcate_id == 'c2'}"><option value="c2" selected="selected">단모</option></c:if>
				<c:if test="${adopt.smallcate_id != 'd1'}"><option value="d1">대형견</option></c:if>
				<c:if test="${adopt.smallcate_id != 'd2'}"><option value="d2">중형견</option></c:if>
				<c:if test="${adopt.smallcate_id != 'd3'}"><option value="d3">소형견</option></c:if>
				<c:if test="${adopt.smallcate_id != 'c1'}"><option value="c1">장모</option></c:if>
				<c:if test="${adopt.smallcate_id != 'c2'}"><option value="c2">단모</option></c:if>
				</select>
			</td>									
		</tr>
		<tr>
			<th>제목</th>
			<td><input type="text" name="subject" value="${adopt.subject }" required="required" autofocus="autofocus"></td>
		</tr>
		<tr>
			<th>사진</th>
			<td><input type="file" name="adopt_image1"></td>
		</tr>
		<tr>
			<th>내용</th>
			<td><textarea name="content" rows="10" cols="50" required="required">${adopt.content }
			</textarea>
			</td>
		</tr>
	</table>

	<p>
	<div align="center">
		<input type="submit" value="수정하기" onclick="location.href='update.adopt?adopt_no=${adopt.adopt_no}'">
		<input type="button" value="목록보기" onclick="location.href='adoptList.adopt?pageNum=${pageNum}'">
	</div>
</form>
</div>

<!-- Footer -->
<%@ include file="../mainPage/footer.jsp" %>
</body>
</html>