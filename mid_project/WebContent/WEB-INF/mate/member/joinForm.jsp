<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MATE</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
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
    
	function confirm() {
		if (!frm.member_id.value) {
			alert("아이디 입력한 후에 체크하시오");
			frm.member_id.focus();
			return false;
		} else {
			idChk();
		}
	}
	
	function idChk() {
	    $.post('confirm.member', 'member_id='+frm.member_id.value, function(data) {
		    $('#msg').html(data);
		});
	}
	
	function chk() {
		if (frm.password.value != frm.confirmPass.value) {
			alert("암호와 암호확인이 다릅니다");
			frm.password.fous();
			frm.pasword.value="";
			return false;
		}
		if (!frm.gender.value) {
			alert("성별을 체크해 주세요");
			return false;
		}
	}z
</script>
</head>
<body>
	<!-- Header, NavBar -->
	<%@ include file="../mainPage/nav.jsp"%>

	<b style="font-size: 24px; position: absolute; margin: -100px 0 0 47%;">회원가입</b>

	<div align="center" style="margin-top: 200px; position: relative; min-height: 450px; margin-bottom: 100px">
		<form action="join.member" method="post" name="frm" onsubmit="return chk()">
			<div class="textbox" style="max-width: 300px;">
				<label for="id_input">아이디</label>
				<input type="text" name="member_id" required="required" id="id_input">
				<a href="#" onclick="confirm()" style="margin-left: 10px; font-size: 14px; font-weight: 900; color: gray;">중복확인</a>
				<div id="msg" style="margin: 0px; padding: 5px;"></div>
			</div>
			<div class="textbox" style="max-width: 300px;">
				<label for="pw_input">비밀번호</label>
				<input type="password" name="password" required="required" id="pw_input">
			</div>
			<div class="textbox" style="max-width: 300px; margin-bottom: 30px">
				<label for="pw_input">암호 확인</label>
				<input type="password" name="confrimPass" required="required" id="pw_input">
			</div>
			<div class="textbox" style="max-width: 300px;">
				<label for="id_input">이름</label>
				<input type="text" name="name" required="required" id="id_input">
			</div>
			<div class="textbox" style="max-width: 300px;">
				<label for="id_input">이메일</label>
				<input type="text" name="email" required="required" id="id_input">
			</div>
			<div class="textbox" style="max-width: 300px;">
				<label for="id_input">연락처 ex) 010-0000-0000</label>
				<input type="text" name="tel" required="required" id="id_input">
			</div>
			<table style="max-width: 300px; text-align: center;">
				<tr><th>성별</th><td><label for="g1">MALE&nbsp;</label><input type="radio" name="gender" checked="checked" value="m" id="g1"/>
				&emsp;<label for="g2">FEMALE&nbsp;</label><input type="radio" name="gender" value="f" id="g2"/></td></tr>
				<tr><th>반려동물 입양 경험</th><td><label for="e1">유&nbsp;</label><input type="radio" name="experience" checked="checked" value="y"	id="e1">
				&emsp;<label for="e2">무&nbsp;</label><input type="radio" name="experience" value="n" id="e2"></td></tr>
				<tr><th>거주 지역</th><td>
						<select name="location_no">
							<option value="2">서울
							<option value="31">경기
							<option value="32">인천
							<option value="41">충남
							<option value="42">대전
							<option value="43">충북
							<option value="44">세종
							<option value="51">부산
							<option value="52">울산
							<option value="53">대구
							<option value="54">경북
							<option value="55">경남
							<option value="61">전남
							<option value="62">광주
							<option value="63">전북
							<option value="64">제주
					</select></td></tr>
			</table>
			
			
			<p><p>
				<input type="submit" value="회원가입"
					class="btn-two rounded charcoal small">
		</form>
	</div>

	<!-- Footer -->
	<%@ include file="../mainPage/footer.jsp"%>
</body>
</html>