<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MATE</title>re</title>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript">

	$(function() {
		var cate = "${free.category }";
		$('select>option[value="'+cate+'"]').attr('selected','selected');
	});

</script>
</head>
<body>
<!-- Header, NavBar -->
<%@ include file="../mainPage/nav.jsp" %>

<c:if test="${free.category == 'f' }">
	<b style="font-size: 24px; position: absolute; margin-left: 25%; margin-top: -100px ">자유 게시판</b>
</c:if>
<c:if test="${free.category == 'i' }">
	<b style="font-size: 24px; position: absolute; margin-left: 25%; margin-top: -100px ">정보 게시판</b>
</c:if>
<c:if test="${free.category == 'a' }">
	<b style="font-size: 24px; position: absolute; margin-left: 25%; margin-top: -100px ">입양 후기</b>
</c:if>

	<!-- 리스트 -->
<div align="center" style="margin-top: 200px; position: relative; min-height: 400px;">
<form action="update.free" method="post">
	<input type="hidden" name="pageNum" value="${pageNum}">
	<input type="hidden" name="free_no" value="${free.free_no}">
	<table class="w3-table w3-centered w3-bordered">
		<tr>
			<th>카테고리</th>
			<td><select size="1" name="category">
				<option value="f">자유</option>
				<option value="i">정보</option>
				<option value="a">후기</option>	
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