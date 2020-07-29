<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MATE</title>
<!-- include libraries(jQuery, bootstrap) -->
<link
	href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css"
	rel="stylesheet">
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script
	src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>

<!-- include summernote css/js-->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.css"
	rel="stylesheet">
<script
	src="js/summernote-bs4.js"></script>

<!-- include summernote-ko-KR -->
<script src="js/summernote-ko-KR.js"></script>
<script type="text/javascript">
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
		}
		//포문을 이용하여 두번째(test2)셀렉트 박스에 값을 뿌려줍니당)
		for(i=0; i<num.length; i++) {
			document.form.smallcate_id.options[i] = new Option(num[i],vnum[i]);
			document.form.smallcate_id.options[i].value = document.form.largecate_id.value + (i+1);
		}
	}
	
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
	
	$(document).ready(function() {
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
</script>
</head>

<body>
<!-- Header, NavBar -->
<%@ include file="../mainPage/nav.jsp" %>
<div style=" position: absolute; margin-left: 25%; margin-top: -100px">
	<b style="font-size: 24px; margin-right: 20px">공고 게시판</b>
</div>
<div align="center" style="margin-top: 200px; position: relative; min-height: 400px; margin-bottom: 100px">
<form action="write.adopt" method="post" name="form">
	<input type="hidden" name="member_id" value="${member_id }">
	<input type="hidden" name="pageNum" value="${pageNum }">
	<table class="w3-table w3-centered" style="max-width: 900px">
		<tr>
			<td>지역&emsp;
				<select name="location_no">
				<option value="2">서울<option value="31">경기
				<option value="32">인천<option value="41">충남
				<option value="42">대전<option value="43">충북
				<option value="44">세종<option value="51">부산
				<option value="52">울산<option value="53">대구
				<option value="54">경북<option value="55">경남
				<option value="61">전남<option value="62">광주
				<option value="63">전북<option value="64">제주
				</select>&emsp;	&emsp;
				종류&emsp;<select size="1" name="largecate_id" class="largecate" onchange="changeCate(document.form.largecate_id.value)" required="required">
					<option value="" selected="selected">--1차 카테고리--</option>
					<option value="d">강아지</option>
					<option value="c">고양이</option>
				</select>
				<select size="1" name="smallcate_id" required="required">
					<option>--1차 카테고리 먼저 선택--</option>
				</select>
			</td>
				
		</tr>
		<tr><td><div class="textbox"><label for="sj_input">제목</label>
			<input type="text" name="subject" required="required" id="sj_input"></div></td>
		</tr>
		<tr>
			<td style="text-align: justify;">
			<textarea id="summernote" name="content"></textarea></td>
		</tr>
	</table>

	<p>
	<div align="center">
		<input type="submit" class="btn-two small blue rounded" value="등록하기"
		onclick="location.href='write.adopt'">
		<input type="button" value="목록보기" class="btn-two small charcoal rounded"
		onclick="location.href='adoptList.adopt'">
	</div>
</form>
</div>

<!-- Footer -->
<%@ include file="../mainPage/footer.jsp" %>
</body>
</html>