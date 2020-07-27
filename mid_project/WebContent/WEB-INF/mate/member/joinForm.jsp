<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MATE</title>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript">
    
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
	}
</script>
</head>
<body>
	<!-- Header, NavBar -->
	<%@ include file="../mainPage/nav.jsp"%>

	<b style="font-size: 24px; position: absolute; margin: -100px 0 0 47%;">회원가입</b>

	<div align="center"
		style="margin-top: 200px; position: relative; min-height: 450px; margin-bottom: 100px">
		<form action="join.member" method="post" name="frm"
			onsubmit="return chk()">
			<table class="w3-table w3-centered w3-bordered"
				style="max-width: 450px">
				<tr>
					<th style="min-width: 125px">아이디</th>
					<td style="text-align: left; margin-left: 20px"><input
						type="text" name="member_id" required="required"
						autofocus="autofocus"> <a href="#" onclick="confirm()"
						style="margin-left: 10px; font-size: 14px; font-weight: 900; color: gray;">중복
							확인</a>
					<div id="msg" style="margin: 0px; padding: 5px;"></div>
							</td>
				</tr>
				<tr>
					<th>암호</th>
					<td style="text-align: left; margin-left: 20px"><input
						type="password" name="password" required="required"></td>
				</tr>
				<tr>
					<th>암호 확인</th>
					<td style="text-align: left; margin-left: 20px"><input
						type="password" name="confrimPass" required="required"></td>
				</tr>
				<tr>
					<th>이름</th>
					<td style="text-align: left; margin-left: 20px"><input
						type="text" name="name" required="required"></td>
				</tr>
				<tr>
					<th>성별</th>
					<td style="text-align: left; margin-left: 20px"><label
						for="g1">남자</label> <input type="radio" name="gender" value="m"
						id="g1" required="required"> <label for="g2">여자</label> <input
						type="radio" name="gender" value="f" id="g2" required="required"></td>
				</tr>
				<tr>
					<th>이메일</th>
					<td style="text-align: left; margin-left: 20px"><input
						type="text" name="email" required="required">
				<tr>
					<th>전화번호</th>
					<td style="text-align: left; margin-left: 20px"><input
						type="tel" name="tel" required="required"
						pattern="\d{3}-\d{3,4}-\d{4}" placeholder="xxx-xxxx-xxxxx"
						title="전화번호 형식 xxx-xxxx-xxxx">
				<tr>
					<th>주소</th>
					<td style="text-align: left; margin-left: 20px"><select
						name="location_no">
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
					</select></td>
				</tr>
				<tr>
					<th>경험</th>
					<td style="text-align: left; margin-left: 20px"><label
						for="e1">유</label> <input type="radio" name="experience" value="y"
						id="e1" required="required"> <label for="e2">무</label> <input
						type="radio" name="experience" value="n" id="e2"
						required="required"></td>
			</table>
			<p>
				<input type="submit" value="회원가입"
					class="btn-two rounded charcoal small">
		</form>
	</div>

	<!-- Footer -->
	<%@ include file="../mainPage/footer.jsp"%>
</body>
</html>