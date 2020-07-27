<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MATE</title>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
	  var placeholderTarget = $('.textbox input[type="text"], .textbox input[type="password"]');
	  
	  //포커스시
	  placeholderTarget.on('focus', function(){
	    $(this).siblings('label').fadeOut('fast');
	  });
	
	  //포커스아웃시
	  placeholderTarget.on('focusout', function(){
	    if($(this).val() == ''){
	      $(this).siblings('label').fadeIn('fast');
	    }
	  });
	});
</script>
</head>
<body>
<!-- Header, NavBar -->
<%@ include file="../mainPage/nav.jsp" %>

<div align="center" style="margin-top: 15%; margin-bottom: 15%;">
<form action="login.member" method="post">
	<div class="textbox" style="max-width: 300px; margin-right: 15px">
		<label for="id_input">아이디</label>
		<input type="text" name="member_id" required="required" id="id_input">
	</div>
	<div class="textbox" style="max-width: 300px; margin-right: 15px">
		<label for="pw_input">비밀번호</label>
		<input type="password" name="password" required="required" id="pw_input">
	</div>
	<input type="submit" class="btn-two small charcoal rounded" value="로그인">
	<button onclick="location.href='joinForm.member'" class="btn-two small charcoal rounded">회원가입</button>
</form>
</div>

<!-- Footer -->
<%@ include file="../mainPage/footer.jsp" %>
</body>
</html>