<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../sessions/memberSession.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript">
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

<div align="center" style="margin: 100px;">
<form action="write.free" method="post" enctype="multipart/form-data">
	<input type="hidden" name="pageNum" value="${pageNum }">
	<input type="hidden" name="member_id" value="${member_id }">
	<table class="w3-table w3-centered w3-bordered">
		<tr><th>카테고리</th>
			<c:if test="${category == 'f' }">
			<td><select size="1" name="category">
					<option value="f" selected="selected">잡담</option>
					<option value="i">정보</option>
					<option value="a">후기</option>
			</select></td>
			</c:if>
			<c:if test="${category == 'i' }">
			<td><select size="1" name="category">
					<option value="f">잡담</option>
					<option value="i" selected="selected">정보</option>
					<option value="a">후기</option>
			</select></td>
			</c:if>
			<c:if test="${category == 'a' }">
			<td><select size="1" name="category">
					<option value="f">잡담</option>
					<option value="i">정보</option>
					<option value="a" selected="selected">후기</option>
			</select></td>
			</c:if>
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
		<input type="submit" value="등록" onclick="location.href='write.free'">
		<input type="button" value="취소" onclick="location.href='freeList.free'">
</form>
</div>

<!-- Footer -->
<%@ include file="../mainPage/footer.jsp" %>
</body>
</html>