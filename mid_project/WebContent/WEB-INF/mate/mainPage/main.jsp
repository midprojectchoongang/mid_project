<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- Header, NavBar -->
<%@ include file="nav.jsp" %>

<!-- Image Header -->
<div class="w3-display-container w3-animate-opacity">
  <img src="images/dog.jpg" alt="" style="width:100%; min-height:500px;">
  <div class="w3-container w3-display-bottomleft w3-margin-bottom">  
    <button onclick="location.href='adoptList.adopt'" class="w3-button w3-xlarge w3-theme w3-hover-teal">공고 보기</button>
  </div>
</div>

<!-- Footer -->
<%@ include file="footer.jsp" %>
</body>
</html>
