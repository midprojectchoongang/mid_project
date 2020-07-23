<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="mysidenav" class="sidenav">
		<a href="adoptList.adopt" id="All" class="parent">All</a>
		<a href="adoptList.adopt?category=d" id="dog" class="parent">Dog</a>
		<div><br>
			<a href="adoptList.adopt?category=d1" class="child">대형견</a><br>
			<a href="adoptList.adopt?category=d2" class="child">중형견</a><br>
			<a href="adoptList.adopt?category=d3" class="child">소형견</a><p>
		</div>
		<a href="adoptList.adopt?category=c" id="cat" class="parent">Cat</a>
		<div><br>
			<a href="adoptList.adopt?category=c1" class="child">장모종</a><br>
			<a href="adoptList.adopt?category=c2" class="child">단모종</a>
		</div>
	</div>
</body>
</html>