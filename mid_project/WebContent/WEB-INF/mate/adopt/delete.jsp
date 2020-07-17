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
	location.href="adoptList.adopt?adopt_no=${adopt_no}&pageNum=${pageNum}";
</script>
</c:if>
<c:if test="${result == 0 }">
<script type="text/javascript">
	alert('삭제 오류가 발생했습니다');
	history.go(-1);
</script>
</c:if>
</body>
</html>