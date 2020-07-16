<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">@import url("temp.css");</style>
<script type="text/javascript">
	function cl() {
		opener.frm.member_id.value="${member_id}";
		window.close();
	}
</script>
</head>
<body>
<c:if test="${not empty member}">
	<h2>이미 사용중인 아이디입니다</h2>
	<form action="">
	<table>
		<tr><th>아이디</th><td><input type="text" name="member_id"
			required="required" autofocus="autofocus"></td></tr>
		<tr><th colspan="2"><input type="submit">
	</table>
	</form>
</c:if>
<c:if test="${empty member}">
	<h2>사용 가능한 아이디입니다</h2>
	<button onclick="cl()">닫기</button>
</c:if>
</body>
</html>