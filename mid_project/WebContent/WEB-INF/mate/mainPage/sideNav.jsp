<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="../js/jquery.js"></script>
<script type="text/javascript">
	$(function() {
		$('#dog').click(function() {
			$(this).next().toggle('slow', function() {
			}); // toggle : show + hide
		});
		$('#cat').click(function() {
			$(this).next().toggle('slow', function() {
			}); // toggle : show + hide
		});
	});
</script>
</head>
<body>
	<div id="mysidenav" class="sidenav">
		<a href="#" id="All" class="parent">All</a>
		<a href="#" id="dog" class="parent">Dog</a>
		<div><br>
			<a href="#" class="child">대형견</a><br>
			<a href="#" class="child">중형견</a><br>
			<a href="#" class="child">소형견</a><p>
		</div>
		<a href="#" id="cat" class="parent">Cat</a>
		<div><br>
			<a href="#" class="child">장모종</a><br>
			<a href="#" class="child">단모종</a>
		</div>
	</div>
</body>
</html>