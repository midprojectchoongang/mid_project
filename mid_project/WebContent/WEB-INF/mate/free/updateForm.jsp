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
<form action="update.free" method="post">
	<input type="hidden" name="pageNum" value="${pageNum}">
	<input type="hidden" name="free_no" value="${free.free_no}">
	<table class="w3-table w3-centered w3-bordered">
		<tr>
			<th>카테고리</th>
			<td><select size="1" name="category">
				<c:if test="${free.category == 'f'}"><option value="f" selected="selected">잡담</option></c:if>
				<c:if test="${free.category == 'i'}"><option value="i" selected="selected">정보</option></c:if>
				<c:if test="${free.category == 'a'}"><option value="a" selected="selected">후기</option></c:if>
				<c:if test="${free.category != 'f'}"><option value="f">잡담</option></c:if>
				<c:if test="${free.category != 'i'}"><option value="i">정보</option></c:if>
				<c:if test="${free.category != 'a'}"><option value="a">후기</option></c:if>
					
					
			</select></td>
		</tr>
		<tr>
			<th>제목</th>
			<td><input type="text" name="subject" value="${free.subject }" required="required" autofocus="autofocus"></td>
		</tr>
		<tr>
			<th>사진</th>
			<td><input type="file" name="free_image1"></td>
		</tr>
		<tr>
			<th>내용</th>
			<td><textarea name="content" rows="10" cols="50" required="required">${free.content }
			</textarea>
			</td>
		</tr>
	</table>

	<p>
		<input type="submit" value="수정" onclick="location.href='update.free?free_no=${free.free_no}'">
		<input type="button" value="취소" onclick="location.href='freeContent.free?free_no=${free.free_no }&pageNum=${pageNum}'">
</form>
</div>

<!-- Footer -->
<%@ include file="../mainPage/footer.jsp" %>
</body>
</html>