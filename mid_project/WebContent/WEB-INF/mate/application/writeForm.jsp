<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MATE</title>
 <!-- include libraries(jQuery, bootstrap) -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 

<!-- include summernote css/js-->
<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.js"></script>

<!-- include summernote-ko-KR -->
<script src="js/summernote-ko-KR.js"></script>
<script type="text/javascript">

	$(document).ready(function() {
		//여기 아래 부분
		$('#summernote').summernote({
			height : 500, // 에디터 높이
			minHeight : null, // 최소 높이
			maxHeight : null, // 최대 높이
			focus : true, // 에디터 로딩후 포커스를 맞출지 여부
			lang : "ko-KR", // 한글 설정
			placeholder : '최대 2048자까지 쓸 수 있습니다' //placeholder 설정	
	
		});
	});
	
	/**
	* 이미지 파일 업로드
	*/
	function uploadSummernoteImageFile(file, editor) {
		data = new FormData();
		data.append("file", file);
		$.ajax({
			data : data,
			type : "POST",
			url : "/uploadFile",
			cache: false,
			contentType : false,
			processData : false,
			maximumFileSize : 1 * 1024 * 1024,
			maximumFileSizeError: '최대 파일 크기를 초과했습니다.',
			success : function(data) {
		//항상 업로드된 파일의 url이 있어야 한다.
				$(editor).summernote('insertImage', data.url);
			}
		});
	}
	
	$(document)
			.ready(
					function() {
						var placeholderTarget = $('.textbox input[type="text"], .textbox input[type="password"]');
	
						//포커스시
						placeholderTarget.on('focus', function() {
							$(this).siblings('label').fadeOut('fast');
						});
	
						//포커스아웃시
						placeholderTarget.on('focusout', function() {
							if ($(this).val() == '') {
								$(this).siblings('label').fadeIn('fast');
							}
						});
					});

	$(function() {
		var loc = ${member.location_no};
		$('select>option[value="'+loc+'"]').attr('selected','selected');
	
		var exper = "${member.experience}";
		$('.exper[value="'+exper+'"]').attr('checked','checked');
	});

</script>
</head>
<body>
<!-- Header, NavBar -->
<%@ include file="../mainPage/nav.jsp" %>

<b style="font-size: 24px; position: absolute; margin-left: 25%; margin-top: -100px ">공고 게시판</b>

<div align="center" style="margin-top: 200px; position: relative; min-height: 400px; margin-bottom: 100px">
<form action="write.application" method="post">
	<input type="hidden" name="pageNum" value="${pageNum }">
	<input type="hidden" name="adopt_no" value="${adopt.adopt_no }">
	<table class="w3-table w3-centered" style="max-width: 900px">
		<tr><th>분류</th>
			<td>
				<c:if test="${adopt.largecate_id == 'd'}">강아지</c:if>
				<c:if test="${adopt.largecate_id == 'c'}">고양이</c:if>
				&emsp;-&emsp;
				<c:if test="${adopt.smallcate_id == 'd1'}">대형견</c:if>										
				<c:if test="${adopt.smallcate_id == 'd2'}">중형견</c:if>										
				<c:if test="${adopt.smallcate_id == 'd3'}">소형견</c:if>										
				<c:if test="${adopt.smallcate_id == 'c1'}">장모종</c:if>										
				<c:if test="${adopt.smallcate_id == 'c2'}">단모종</c:if>										
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
			<th>입양 희망자 성별</th>
			<td>
			<input type="hidden" name="gender" value="${member.gender}">
			<c:if test="${member.gender == 'm'}">남자</c:if>
			<c:if test="${member.gender == 'f'}">여자</c:if>
			</td>
			<th>거주지</th>
			<td ><select name="location_no">
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
			<th>이메일</th>
			<td>
			<input type="text" name="email" required="required" value="${member.email }">
			</td>
			<th>전화번호</th>
			<td>
			<input type="tel" name="tel" required="required" pattern="\d{3}-\d{3,4}-\d{4}"
				placeholder="xxx-xxxx-xxxxx" title="전화번호 형식 xxx-xxxx-xxxx" value="${member.tel }">
			</td>
		</tr>
		<tr><td colspan="4"><div class="textbox"><label for="sj_input">제목</label>
			<input type="text" name="subject" required="required" id="sj_input"></div></td>
		</tr>
		<tr><td style="text-align: justify;" colspan="4"><textarea id="summernote" name="content"></textarea></td></tr>
	</table><p>
		<input type="submit" class="btn-two small blue rounded" value="지원">
		<button onclick="history.back()" class="btn-two small red rounded">취소</button>
</form>
</div>

<!-- Footer -->
<%@ include file="../mainPage/footer.jsp" %>
</body>
</html>