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
<c:if test="${empty list }">
		<script type="text/javascript">
			location.href='scrapAdd.adoptS?adopt_no=${adopt_no }&pageNum=${pageNum }';
		</script>
</c:if>
<c:forEach var="adopt_chk" items="${list }">
	<c:if test="${adopt_chk.adopt_no == param.adopt_no }">
		<script type="text/javascript">
			alert('이미 스크랩 한 글입니다');
			history.go(-1);	
		</script>
	</c:if>
	<c:if test="${adopt_chk.adopt_no != param.adopt_no }">
		<script type="text/javascript">
			location.href='scrapAdd.adoptS?adopt_no=${adopt_no }&pageNum=${pageNum }';
		</script>
	</c:if>
</c:forEach>

</body>
</html>