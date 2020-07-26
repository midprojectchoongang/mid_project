<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript">
	$(function() {
	    
	    var fno = "${free.free_no}";
		var cno = $('#cno').val();

		function getComm() {
		    $('#commListDisp').load('commList.comm?free_no='+fno);
		}
		getComm();
		
		$('#cInsert').click(function() {
			if ($('#comm_content').val() == "") {
				alert("댓글을 입력하세요");
				$('#comm_content').focus(); 
				return false; 
			}
			var sendData = $('#frm').serialize();
			$.post('writeComm.comm',sendData, function(data) {
			    alert("댓글이 작성되었습니다");
				getComm();
				$('#comm_content').val("");
			});
		});
		
	});
	
	function delmsg() {
	    var msg = "게시물을 삭제합니다";
		if (confirm(msg)) {
		    location.href = 'delete.free?free_no=${free.free_no}&pageNum=${pageNum}';
		} else {
			return;
		}
	}
</script>
</head>
<body>
<!-- Header, NavBar -->
<%@ include file="../mainPage/nav.jsp" %>

<fmt:formatDate value="${free.reg_date }" pattern="yyyy.MM.dd  HH:mm" var="date"/>
<div style=" position: absolute; margin-left: 25%; margin-top: -100px">
	<b style="font-size: 24px; margin-right: 20px">HOT 게시판</b>
	<span style="font-weight: 900; color: grey;	">
		<c:if test="${free.category == 'f'}">자유 게시판</c:if>
		<c:if test="${free.category == 'i'}">정보 게시판</c:if>
		<c:if test="${free.category == 'a'}">입양 후기</c:if>
	</span>
</div>

	<!-- 리스트 -->
<div align="center" style="margin-top: 200px; position: relative; min-height: 400px;">
	<input type="hidden" name="pageNum" value="${pageNum }">
	<table class="w3-table w3-centered w3-bordered">
		<tr><th width="100">제목</th>
			<td style="left-margin: 50px; text-align: left">${free.subject }</td>
			<td width="150">${free.member_id }<br>${date }</td></tr>
		<tr height="300"><td colspan="6" style="text-align: left; padding: 50px;"><pre>${free.content }</pre></td></tr>
	</table><p>
		<c:if test="${member_id == free.member_id }">
			<a href="location.href='updateForm.free?free_no=${free.free_no }&pageNum=${pageNum }" class="btn-two mini blue rounded">수정</a>
			<a href="delmsg()" class="btn-two mini red rounded">삭제</a>
		</c:if>
		<c:if test="${not empty master_id }">
			<a href="delmsg()" class="btn-two mini red rounded">삭제</a>
		</c:if>
		<c:if test="${not empty member_id && member_id != free.member_id}">
			<a href="location.href='scrapChk.freeS?free_no=${free.free_no }&pageNum=${pageNum }" class="btn-two mini blue rounded">스크랩</a>
		</c:if>
		<a href="hotList.free?pageNum=${pageNum}" class="btn-two mini charcoal rounded">목록</a>
</div>

  	<!-- 댓글 목록 -->
<div id="commListDisp" align="center" style="margin-top: 50px; position: relative;"></div>
	<!-- 댓글  작성 -->
<div id="writeArea" align="center" style="margin-top: 10px; margin-bottom: 50px; position: relative;">
	<form id="frm">
	<input type="hidden" name="member_id" id="member_id" value="${member_id}">
	<input type="hidden" name="free_no" id="free_no" value="${free.free_no}">
	<c:if test="${not empty member_id }">
		<table class="w3-table w3-centered w3-bordered">
			<tr>
				<td><textarea rows="3" cols="50" name="comm_content" id="comm_content"></textarea></td>
				<td><input type="button" value="댓글입력" id="cInsert" class="btn-two mini charcoal rounded"></td>
			</tr>
		</table>
	</c:if>
	</form>
</div>

<!-- Footer -->
<%@ include file="../mainPage/footer.jsp" %>
</body>
</html>