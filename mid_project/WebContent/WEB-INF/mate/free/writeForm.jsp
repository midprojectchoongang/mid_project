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
		var cate = "${category }";
		$('select>option[value="' + cate + '"]').attr('selected', 'selected');
	});
</script>
</head>
<body>
	<!-- Header, NavBar -->
	<%@ include file="../mainPage/nav.jsp"%>

	<c:if test="${category == 'f' }">
		<b
			style="font-size: 24px; position: absolute; margin-left: 25%; margin-top: -100px">자유
			게시판</b>
	</c:if>
	<c:if test="${category == 'i' }">
		<b
			style="font-size: 24px; position: absolute; margin-left: 25%; margin-top: -100px">정보
			게시판</b>
	</c:if>
	<c:if test="${category == 'a' }">
		<b
			style="font-size: 24px; position: absolute; margin-left: 25%; margin-top: -100px">입양
			후기</b>
	</c:if>

	<div align="center"
		style="margin-top: 200px; position: relative; min-height: 400px; margin-bottom: 100px">
		<form action="write.free" method="post">
			<input type="hidden" name="pageNum" value="${pageNum }"> <input
				type="hidden" name="member_id" value="${member_id }">
			<table class="w3-table w3-centered" style="max-width: 900px">
				<tr>
					<th>카테고리&emsp; <select size="1" name="category">
							<option value="f">자유</option>
							<option value="i">정보</option>
							<option value="a">후기</option>
					</select></th>
				</tr>
				<tr>
					<td><div class="textbox">
							<label for="sj_input">제목</label> <input type="text"
								name="subject" required="required" id="sj_input"
								style="width: 100%">
						</div></td>
				</tr>
				<tr>
					<td style="text-align: justify;"><textarea id="summernote"
							name="content"></textarea></td>
				</tr>
			</table>
			<p>
				<input type="submit" class="btn-two small blue rounded" value="확인">
				<button
					onclick="location.href='freeList.free?category=${category }'"
					class="btn-two small red rounded">취소</button>
		</form>
	</div>

	<!-- Footer -->
	<%@ include file="../mainPage/footer.jsp"%>
</body>
</html>