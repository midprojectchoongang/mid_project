<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- include libraries(jQuery, bootstrap) -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 

<!-- include summernote css/js-->
<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.js"></script>

<!-- include summernote-ko-KR -->
<script src="js/summernote-ko-KR.js"></script>
<script>

	$(document).ready(function() {
		$('#summernote').summernote({
			height: 300,
			minHeight: null,
			maxHeight: null,
			focus: true,
			callbacks: {
				onImageUpload: function(files, editor, welEditable) {
					for (var i = files.length - 1; i >= 0; i--) {
						sendFile(files[i], this);
					}
				}
			}
		});
	});

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

<b style="font-size: 24px; position: absolute; margin-left: 25%; margin-top: -100px ">공지사항</b>

<div align="center" style="margin-top: 200px; position: relative; min-height: 400px; margin-bottom: 100px">
<form action="insert.notice" method="post">
	<table class="w3-table w3-centered style="max-width: 900px">
		<tr><td><div class="textbox"><label for="sj_input">제목</label>
			<input type="text" name="subject" required="required" id="sj_input"></div></td>
		</tr>
		<tr><td style="text-align: justify;"><textarea id="summernote" name="content"></textarea></td></tr>
	</table><p>
	<input type="submit" class="btn-two small blue rounded" value="확인">
	<button onclick="location.href='noticeList.notice'" class="btn-two small red rounded">취소</button>
</form>
</div>

<!-- Footer -->
<%@ include file="../mainPage/footer.jsp" %>
</body>
</html>