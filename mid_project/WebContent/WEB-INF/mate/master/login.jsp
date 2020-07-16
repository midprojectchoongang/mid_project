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
<div>
<c:if test="${result > 0 }">
	<script type="text/javascript">
		location.href="main.main";
	</script>
</c:if>
<c:if test="${result <= 0 }">
	<script type="text/javascript">
		alert("ID와 비밀번호를 다시 확인하여 주십시오");
		history.back();
	</script>
</c:if>
</div>
</body>
</html>