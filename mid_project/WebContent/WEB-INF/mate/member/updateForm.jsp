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
<%@ include file="../mainPage/nav.jsp" %>

<b style="font-size: 24px; position: absolute; margin: -100px 0 0 45%;">회원정보수정</b>

<div align="center" style="margin-top: 200px; position: relative; min-height: 450px;">
<form action="update.member" method="post">
	<table class="w3-table w3-centered w3-bordered" style="max-width: 400px">
		<tr><th>아이디</th><td>${member_id }</td></tr>
		<tr><th>이름</th><td>
			<input type="text" name="name" required="required" value="${member.name}"></td></tr>
		<tr><th>이메일</th><td>
			<input type="text" name="email" required="required" value="${member.email}"></td></tr>
		<tr><th>전화</th><td>
			<input type="tel" name="tel" required="required" pattern="\d{3}-\d{3,4}-\d{4}"
				value="${member.tel}" title="전화번호 형식 xxx-xxxx-xxxx">
		<tr><th>거주 지역</th>
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
				<c:if test="${member.experience == 'y' }">
					<input type="radio" name="experience" value="y" id="e1" checked="checked">
				</c:if>
				<c:if test="${member.experience != 'y' }">
					<input type="radio" name="experience" value="y" id="e1">
				</c:if>
				<label for="e2">무</label>
				<c:if test="${member.experience == 'n' }">
					<input type="radio" name="experience" value="n" id="e2" checked="checked">
				</c:if>
				<c:if test="${member.experience != 'n' }">
					<input type="radio" name="experience" value="n" id="e2">
				</c:if>
			</td>
		</tr>
	</table><p>
	<input type="submit" class="btn-two small blue rounded" value="확인">
	<a href='memberInfo.member' class="btn-two small red rounded" style="border:0;">취소</a>
</form>
</div>

<!-- Footer -->
<%@ include file="../mainPage/footer.jsp" %>
</body>
</html>