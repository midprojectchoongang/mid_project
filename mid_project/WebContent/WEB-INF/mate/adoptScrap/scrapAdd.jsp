<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../sessions/memberSession.jsp" %>
<%@ include file="../sessions/masterSession.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:if test="${result > 0 }">
	<script type="text/javascript">
		var msg = "스크랩함 보기";
		if (confirm(msg)) {
			location.href="scrapList.adoptS";
		}
		else {
		    history.go(-1);
		}
	</script>
</c:if>
<c:if test="${result == 0 }">
	<script type="text/javascript">
		alert('스크랩 오류입니다');
		history.go(-1);
	</script>
</c:if>
</body>
</html>