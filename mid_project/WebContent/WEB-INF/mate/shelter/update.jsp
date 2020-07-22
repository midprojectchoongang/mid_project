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
<div align="center">
<c:if test="${result > 0 }">
	<script type="text/javascript">
		location.href="shelterList.shelter?shelter_no=${shelter_no }&pageNum=${pageNum }";
	</script>
</c:if>
<c:if test="${result <= 0 }">
	<script type="text/javascript">
		alert("알수없는 오류로 작업이 취소되었습니다");
		history.go(-1);
	</script>
</c:if>
</div>
</body>
</html>