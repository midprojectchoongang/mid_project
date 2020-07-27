<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MATE</title>
<script type="text/javascript">
	function chk() {
		if (frm.password.value != frm.confirmPass.value) {
			alert("암호와 암호 확인이 다릅니다");
			frm.password.focus();
			frm.password.value="";
			return false;
		}
	}
</script>
</head>
<body>
	<!-- Header, NavBar -->
	<%@ include file="../mainPage/nav.jsp"%>

	<div align="center" style="margin-top: 15%; margin-bottom: 15%;">
		<form action="updatePw.member" method="post" name="frm"
			onsubmit="return chk()">
			<input type="hidden" name="member_id" value="${member_id }">
			<table class="w3-table w3-centered" style="max-width: 400px">
				<tr>
					<th>아이디</th>
					<td>${member_id }</td>
				</tr>
				<tr>
					<th>변경할 암호</th>
					<td><input type="password" name="password" required="required"
						autofocus="autofocus"></td>
				</tr>
				<tr>
					<th>변경할 암호 확인</th>
					<td><input type="password" name="confirmPass"
						required="required"></td>
				</tr>
			</table>
			<p>
				<input type="submit" class="btn-two small blue rounded" value="확인">
				<button onclick="location.href='memberInfo.member'"
					class="btn-two small red rounded">취소</button>
		</form>
	</div>

	<!-- Footer -->
	<%@ include file="../mainPage/footer.jsp"%>
</body>
</html>