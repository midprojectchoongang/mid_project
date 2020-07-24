<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../sessions/memberSession.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript">
	var fno = "${free.free_no}";
	var cno = $('#cno').val();

	function cDelete(cno) {
		var sendData="comment_no="+cno;
		$.post('commDelete.comm', sendData, function(data) {
			alert('삭제 되었습니다');
			$('#commListDisp').html(data);
		});
	}
	function cUpdate(cno) {
		var txt =$('#td_'+cno).text();
		$('#td_'+cno).html(
			'<textarea rows="3" cols="30" id="cUpdate">'+txt+'</textarea>');
		$('#btn_'+cno).html(
			'<button onclick="up('+cno+')" class="btn-two mini charcoal rounded">확인</button> '
			+'<button onclick="lst('+fno+')" class="btn-two mini charcoal rounded">취소</button>'
		);
	}
	
	function up(cno) {
		var sendData="content="+$('#cUpdate').val()+"&comment_no="+cno;
		$.post('commUpdate.comm', sendData, function(data) {
			alert('댓글 수정 되었습니다');
			$('#commListDisp').html(data);
		});
	}
	function lst(fno) {
	    $('#commListDisp').load('commList.comm?free_no='+fno);
	}
</script>
</head>
<body>
<input type="hidden" name="free_no" value="${free_no }">
<c:if test="${not empty commList }">
	<table class="w3-table w3-centered w3-bordered">
	<c:forEach var="comments" items="${commList }">
		<tr comm_type="main">
		<td style="text-align: left; margin-right: 10px;">${comments.member_id }</td>
		<td style="text-align: left; margin-left: 10px; margin-right: 10px;">${comments.comm_content }</td>
		<td style="text-align: right; margin-left: 10px;">${comments.reg_date }</td>
		<td>
			<input type="button" id="reComm" value="댓글" class="btn-two mini charcoal rounded">
			<c:if test="${member_id == comments.member_id }">
			<input type="button" id="reComm" value="수정" class="btn-two mini charcoal rounded"
			onclick="cUpdate(${comments.comment_no})">
			<input type="button" id="reComm" value="삭제" class="btn-two mini charcoal rounded"
			onclick="cDelete(${comments.comment_no})">
			</c:if>	
		</td>
		</tr>
	</c:forEach>
	</table>
</c:if>
</body>
</html>

