<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:if test="${result > 0 }">
<script type="text/javascript">
	var msg = "내 지원서 보기";
	if (confirm(msg)) {
	    location.href="myAppList.application";
	}
	else {
		location.href="adoptList.adopt?pageNum=${pageNum}";
	}
</script>
</c:if>
<c:if test="${result == 0 }">
<script type="text/javascript">
	history.go(-1);
</script>
</c:if>
</body>
</html>