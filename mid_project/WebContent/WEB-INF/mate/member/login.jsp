<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:if test="${result > 0 }">
	<script type="text/javascript">
		location.href="main.main"
	</script>
</c:if>
<c:if test="${result == 0 }">
	<script type="text/javascript">
		alert("암호가 다릅니다");
		location.href="loginForm.member"
	</script>
</c:if>
<c:if test="${result == -1 }">
	<script type="text/javascript">
		alert("없는 아이디입니다");
		location.href="loginForm.member"
	</script>
</c:if>
</body>
</html>