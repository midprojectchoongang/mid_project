<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">@import url("btn.css");</style>
</head>
<body>
<c:if test="${result == 1 }">
<font color="red">
사용 중인 아이디입니다
</font>
</c:if>
<c:if test="${result == 0 }">
<font color="#555">
사용 가능한 아이디입니다
</font>
</c:if>
</body>
</html>