<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MATE</title>
  <!-- include libraries(jQuery, bootstrap) -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 

<!-- include summernote css/js-->
<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.js"></script>

<!-- include summernote-ko-KR -->
<script src="js/summernote-ko-KR.js"></script>
<script type="text/javascript">

	$(document).ready(function() {
		$('#summernote').summernote({
			height: 300,
			minHeight: null,
			maxHeight: null,
			focus: true,
			callbacks: {
				onImageUpload: function(files, editor, welEditable) {
					for (var i = files.length - 1; i >= 0; i--) {
						sendFile(files[i], this);
					}
				}
			}
		});
	});

	$(function() {
		var cate = "${category }";
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
<div align="center" style="margin-top: 200px; position: relative; min-height: 400px; margin-bottom: 100px">
<form action="update.free" method="post">
	<input type="hidden" name="pageNum" value="${pageNum}">
	<input type="hidden" name="free_no" value="${free.free_no}">
	<table class="w3-table w3-centered" style="max-width: 900px">
		<tr>
		<tr><th>카테고리&emsp;
				<select size="1" name="category">
					<option value="f">자유</option>
					<option value="i">정보</option>
					<option value="a">후기</option>
			</select></th>
		<tr><td><div class="textbox">
			<input type="text" name="subject" required="required" value="${free.subject }"></div></td>
		</tr>
		<tr><td style="text-align: justify;"><textarea id="summernote" name="content">${free.content }</textarea></td></tr>
	</table><p>
	<input type="submit" class="btn-two small blue rounded" value="확인">
	<button onclick="location.href='freeContent.free?free_no=${free.free_no }&pageNum=${pageNum}'" class="btn-two small red rounded">취소</button>
</form>
</div>

<!-- Footer -->
<%@ include file="../mainPage/footer.jsp" %>
</body>
</html>