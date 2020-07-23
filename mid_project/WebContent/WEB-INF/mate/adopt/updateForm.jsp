<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript">

	$(function() {
		var loc = ${adopt.location_no};
		$('.location>option[value="'+loc+'"]').attr('selected','selected');
		
		var lcate = '${adopt.largecate_id}';
		$('.largecate>option[value="'+lcate+'"]').attr('selected','selected');
		
		var scate = '${adopt.smallcate_id}';
		$('.smallcate>option[value="'+scate+'"]').attr('selected','selected');
	});
	
	function changeCate(val) {
		if (val == 'd') {
			//뿌려줄값을 배열로정렬
			num = new Array("대형견","중형견","소형견");
			vnum = new Array("1","2","3");
		} else if (val == 'c') {
			num = new Array("장모종","단모종");
			vnum = new Array("1","2");
		}
		// 셀렉트안의 리스트를 기본값으로 한다..
		for(i=0; i<form.smallcate_id.length; i++) {
			form.smallcate_id.options[0] = null;
			form.smallcate_id.options[1] = null;
			form.smallcate_id.options[2] = null;
		}
		//포문을 이용하여 두번째(test2)셀렉트 박스에 값을 뿌려줍니당)
		for(i=0; i<num.length; i++) {
			document.form.smallcate_id.options[i] = new Option(num[i],vnum[i]);
			document.form.smallcate_id.options[i].value = document.form.largecate_id.value + (i+1);
		}
	}
	
</script>
</head>
<body>
<!-- Header, NavBar -->
<%@ include file="../mainPage/nav.jsp" %>

<div align="center" style="margin: 100px;">
<form action="update.adopt" method="post" name="form">
	<input type="hidden" name="pageNum" value="${pageNum}">
	<input type="hidden" name="adopt_no" value="${adopt.adopt_no}">
	<table class="w3-table w3-centered w3-bordered">
		<tr>
			<th>지역</th>
			<td>
				<select name="location_no" class="location">
				<option value="2">서울<option value="31">경기
				<option value="32">인천<option value="41">충남
				<option value="42">대전<option value="43">충북
				<option value="44">세종<option value="51">부산
				<option value="52">울산<option value="53">대구
				<option value="54">경북<option value="55">경남
				<option value="61">전남<option value="62">광주
				<option value="63">전북<option value="64">제주
				</select>
			</td>
		</tr>
		<tr>	
			<th>종류</th>

			<td><select size="1" name="largecate_id" class="largecate" onchange="changeCate(document.form.largecate_id.value)" required="required">
					<option value="d">강아지</option>
					<option value="c">고양이</option>
				</select>
				<select size="1" name="smallcate_id" class="smallcate" required="required">
					<c:if test="${adopt.largecate_id == 'd' }">
						<option value="d1">대형견</option>
						<option value="d2">중형견</option>
						<option value="d3">소형견</option>
					</c:if>
					<c:if test="${adopt.largecate_id == 'c' }">
						<option value="c1">장모종</option>
						<option value="c2">단모종</option>
					</c:if>
				</select>
			</td>									
		</tr>
		<tr>
			<th>제목</th>
			<td><input type="text" name="subject" value="${adopt.subject }" required="required" autofocus="autofocus"></td>
		</tr>
		<tr>
			<th>사진</th>
			<td><input type="file" name="adopt_image1"></td>
		</tr>
		<tr>
			<th>내용</th>
			<td><textarea name="content" rows="10" cols="50" required="required">${adopt.content }
			</textarea>
			</td>
		</tr>
	</table>

	<p>
	<div align="center">
		<input type="submit" value="수정하기" onclick="location.href='update.adopt?adopt_no=${adopt.adopt_no}'">
		<input type="button" value="목록보기" onclick="location.href='adoptList.adopt?pageNum=${pageNum}'">
	</div>
</form>
</div>

<!-- Footer -->
<%@ include file="../mainPage/footer.jsp" %>
</body>
</html>