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

<div align="center" style="margin: 100px;">
<form action="update.notice" method="post">
	<input type="hidden" name="notice_no" value="${notice.notice_no }">
	<input type="hidden" name="pageNum" value="${pageNum }">
	<table class="w3-table w3-centered w3-bordered">
		<tr><th>제목</th>
			<td><input type="text" name="subject" required="required" autofocus="autofocus" value=${notice.subject }></td></tr>
		<tr><th>내용</th>
			<td><textarea cols="30" rows="5" name="content" required="required">${notice.content }</textarea></td></tr>
	</table><p>
	<input type="submit" value="확인">&emsp;
	<button onclick="location.href='noticeContent.notice?notice_no=${notice.notice_no }&pageNum=${pageNum }'">취소</button>
</form>
</div>

<!-- Footer -->
<%@ include file="../mainPage/footer.jsp" %>
</body>
</html>