<%@page import="dao.Adopt_scrapDao" %>
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
	<c:if test="${not empty list }">
		<c:if test="${list.del == 'y' }">
			<script type="text/javascript">
			location.href = 'scrapChange.adoptS?adopt_no=${adopt_no }&pageNum=${pageNum }';
			</script>
		</c:if>
		<c:if test="${list.del == 'n' }">
			<script type="text/javascript">
		    alert('이미 스크랩 한 글입니다');
		    history.go(-1);
			</script>
		</c:if>
	</c:if>
</body>
</html>