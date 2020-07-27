<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MATE</title>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript">

$(function() {
	var loc = "${apply.location_no}";
	$('select>option[value="'+loc+'"]').attr('selected','selected');
	
	var exper = "${apply.experience}";
	$('.exper[value="'+exper+'"]').attr('checked','checked');
});

</script>
</head>
<body>
<!-- Header, NavBar -->
<%@ include file="../mainPage/nav.jsp" %>

<div align="center" style="margin: 100px;">
<form action="update.application" method="post">
	<input type="hidden" name="pageNum" value="${pageNum }">
	<input type="hidden" name="application_no" value="${apply.application_no }">
	<table class="w3-table w3-centered w3-bordered">
		<tr><th>분류</th>
			<td>
				<c:if test="${apply.largecate_id == 'd'}">강아지</c:if>
				<c:if test="${apply.largecate_id == 'c'}">고양이</c:if>
			</td>
			<th>품종</th>
			<td>
				<c:if test="${apply.smallcate_id == 'd1'}">대형견</c:if>										
				<c:if test="${apply.smallcate_id == 'd2'}">중형견</c:if>										
				<c:if test="${apply.smallcate_id == 'd3'}">소형견</c:if>										
				<c:if test="${apply.smallcate_id == 'c1'}">장모</c:if>										
				<c:if test="${apply.smallcate_id == 'c2'}">단모</c:if>										
			</td>
		</tr>
		<tr>
			<th>성별</th>
			<td>
			${apply.gender }
			</td>
			<th>반려동물 경험</th>
			<td>
			<label for="e1">유</label>
			<input type="radio" class="exper" name="experience" value="y" id="e1" required="required">
			<label for="e2">무</label>
			<input type="radio" class="exper" name="experience" value="n" id="e2" required="required">
			</td>
		</tr>
		<tr>
			<th colspan="2">거주지</th>
			<td colspan="2"><select name="location_no">
				<option value="2">서울</option>
				<option value="31">경기</option>
				<option value="32">인천</option>
				<option value="41">충남</option>
				<option value="42">대전</option>
				<option value="43">충북</option>
				<option value="44">세종</option>
				<option value="51">부산</option>
				<option value="52">울산</option>
				<option value="53">대구</option>
				<option value="54">경북</option>
				<option value="55">경남</option>
				<option value="61">전남</option>
				<option value="62">광주</option>
				<option value="63">전북</option>
				<option value="64">제주</option>
			</select></td>
		</tr>
		<tr>
			<th colspan="2">이메일</th>
			<td colspan="2">
			<input type="text" name="email" required="required" value="${apply.email }">
			</td>
		</tr>
		<tr>
			<th colspan="2">전화번호</th>
			<td colspan="2">
			<input type="tel" name="tel" required="required" pattern="\d{3}-\d{3,4}-\d{4}"
				value="${apply.tel }" title="전화번호 형식 xxx-xxxx-xxxx">
			</td>
		</tr>
		<tr><th colspan="2">제목</th>
			<td colspan="4"><input type="text" name="subject" required="required" autofocus="autofocus" value="${apply.subject }"></td>
		</tr>
		<tr><th colspan="2">내용</th>
			<td colspan="4"><textarea name="content" rows="10" cols="50" required="required">${apply.content }</textarea></td>
		</tr>
	</table><p>
		<input type="submit" value="등록" class="btn-two mini blue rounded"
		onclick="location.href='update.application?application_no=${apply.application_no }&pageNum=${pageNum}'">
		<input type="button" value="취소" class="btn-two mini red rounded" 
		onclick="location.href='appContent.application?application_no=${apply.application_no }&pageNum=${pageNum}'">
</form>
</div>

<!-- Footer -->
<%@ include file="../mainPage/footer.jsp" %>
</body>
</html>