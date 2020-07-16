<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function confirm() {
		if (!frm.member_id.value) {
			alert("아이디 입력한 후에 체크하시오");
			frm.member_id.focus();
			return false;
		}
		window.open("confirm.member?member_id="+frm.member_id.value,"",
				"width=300 height=300");
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
</head><body>
<!-- Header, NavBar -->
<%@ include file="../mainPage/nav.jsp" %>

<div align="center" style="margin: 100px;">
<form action="join.member" method="post" name="frm" onsubmit="return chk()">
<table class="w3-table w3-centered w3-bordered"><caption>회원가입</caption>
	<tr><th>아이디</th><td>
		<input type="text" name="member_id" required="required" autofocus="autofocus">
		<input type="button" value="아이디중복 " onclick="return confirm()"></td></tr>		
	<tr><th>암호</th><td>
		<input type="password" name="password" required="required"></td></tr>
	<tr><th>암호 확인</th><td>
		<input type="password" name="confrimPass" required="required"></td></tr>
	<tr><th>이름</th><td>
		<input type="text" name="name" required="required"></td></tr>
	<tr><th>성별</th><td>	
		<label for="g1">남자</label>
		<input type="radio" name="gender" value="m" id="g1" required="required">
		<label for="g2">여자</label>
		<input type="radio" name="gender" value="f" id="g2" required="required"></td></tr>
	<tr><th>이메일</th><td>
		<input type="text" name="email" required="required">
	<tr><th>전화번호</th><td>
		<input type="tel" name="tel" required="required" pattern="\d{3}-\d{3,4}-\d{4}"
			placeholder="xxx-xxxx-xxxxx" title="전화번호 형식 xxx-xxxx-xxxx">	
	<tr><th>주소</th>
		<td><select name="location_no">
			<option value="2">서울<option value="31">경기
			<option value="32">인천<option value="41">충남
			<option value="42">대전<option value="43">충북
			<option value="44">세종<option value="51">부산
			<option value="52">울산<option value="53">대구
			<option value="54">경북<option value="55">경남
			<option value="61">전남<option value="62">광주
			<option value="63">전북<option value="64">제주
		</select></td></tr>
	<tr><th>경험</th>
	<td><label for="e1">유</label>
		<input type="radio" name="experience" value="y" id="e1" required="required">
		<label for="e2">무</label>
		<input type="radio" name="experience" value="n" id="e2" required="required">
	<tr><th colspan="2"><input type="submit" value="확인"></th></tr>
</table>	
</form>
</div>

<!-- Footer -->
<%@ include file="../mainPage/footer.jsp" %>
</body>
</html>