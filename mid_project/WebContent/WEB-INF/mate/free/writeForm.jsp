<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MATE</title>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript">

	$(function() {
		var cate = "${category }";
		$('select>option[value="'+cate+'"]').attr('selected','selected');
	});
	
	$("#image").on("change", function() {
	    if($("#image")[0].files.length > 5) {
	    	alert("업로드 개수를 초과했습니다");
	    }
	});
	
</script>
</head>
<body>
<!-- Header, NavBar -->
<%@ include file="../mainPage/nav.jsp" %>

<c:if test="${category == 'f' }">
	<b style="font-size: 24px; position: absolute; margin-left: 25%; margin-top: -100px ">자유 게시판</b>
</c:if>
<c:if test="${category == 'i' }">
	<b style="font-size: 24px; position: absolute; margin-left: 25%; margin-top: -100px ">정보 게시판</b>
</c:if>
<c:if test="${category == 'a' }">
	<b style="font-size: 24px; position: absolute; margin-left: 25%; margin-top: -100px ">입양 후기</b>
</c:if>

	<!-- 리스트 -->
<div align="center" style="margin-top: 200px; position: relative; min-height: 400px; margin-bottom: 100px">
<form action="write.free" method="post">
	<input type="hidden" name="pageNum" value="${pageNum }">
	<input type="hidden" name="member_id" value="${member_id }">
	<table class="w3-table w3-centered w3-bordered">
		<tr><th>카테고리</th>
			<td><select size="1" name="category">
					<option value="f">자유</option>
					<option value="i">정보</option>
					<option value="a">후기</option>
			</select></td>
		</tr>
		<tr><th>제목</th>
			<td><input type="text" name="subject" required="required" autofocus="autofocus"></td>
		</tr>
		<tr><th>사진</th>
			<td><input type="file" id="image" name="free_image" accept=".jpg,.jpeg,.png,.gif" multiple="multiple"></td>
		</tr>
		<tr><th>내용</th>
			<td><textarea name="content" rows="10" cols="50" required="required"></textarea></td>
		</tr>
	</table><p>
		<input type="submit" value="등록" onclick="location.href='write.free?category=${category}'">
		<input type="button" value="취소" onclick="location.href='freeList.free?category=${category}'">
</form>
</div>

<!-- Footer -->
<%@ include file="../mainPage/footer.jsp" %>
</body>
</html>