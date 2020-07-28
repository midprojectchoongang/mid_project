<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../sessions/memberSession.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript">
	var fno = "${free_no}";
	var cno = $('#cno').val();
	
	function reComm(cno) {
		$('#comm_content').text('@' +cno+ " ");
		location.herf="#cTab";
	}
	
	function cDelete(cno) {
		var sendData="comment_no="+cno;
		$.post('deleteComm.comm', sendData, function(data) {
			alert('삭제 되었습니다');
			location.reload();
		});
	}
	function cUpdate(cno) {
		var txt =$('#td_'+cno).text().trim();
		$('#td_'+cno).html('<textarea rows="3" cols="30" id="cUpdate">'+txt+'</textarea>');
		$('#btn_'+cno).html(
			'<button onclick="up('+cno+')" class="btn-two mini charcoal rounded">확인</button> '
			+'<button onclick="lst('+fno+')" class="btn-two mini charcoal rounded">취소</button>'
		);
	}
	
	function up(cno) {
		var sendData="comm_content="+$('#cUpdate').val()+"&comment_no="+cno;
		$.post('updateComm.comm', sendData, function(data) {
			alert('댓글 수정 되었습니다');
			location.reload();
		});
	}
	function lst(fno) {
	    $('#commListDisp').load('commList.comm?free_no='+fno);
	}
	
	// paging
	function forword(cPage) {
	    $('#commListDisp').load('commList.comm?free_no='+fno+'&c_pageNum='+cPage);
	    return false;
	}
	
	function backword(cPage) {
	    $('#commListDisp').load('commList.comm?free_no='+fno+'&c_pageNum='+cPage);
	    return false;
	}
	
	function pageN(sp, ep) {
	    for (i=sp; i<=ep; i++) {
			$('#commListDisp').load('commList.comm?free_no='+fno+'&c_pageNum='+i);
	    }
	    return false;
	}
</script>
</head>
<body>
<jsp:useBean id="now" class="java.util.Date"/>
<fmt:formatDate value="${now }" pattern="yyyyMMdd" var="nowDate"/>

<input type="hidden" id="free_no" value="${free_no }">
<input type="hidden" id="c_pageNum" value="${c_pageNum }">
<c:if test="${not empty commList }">
	<table class="w3-table w3-centered" style="max-width: 1000px">
	<c:forEach var="comments" items="${commList }">
		<tr id="tr_${comments.comment_no }">
		<td id="cno">${comments.comment_no }</td>
		<td style="text-align: left; margin-right: 10px;">${comments.member_id }</td>
		<td id="td_${comments.comment_no }" style="text-align: left; width:55%;">
		<c:if test="${comments.re_level > 0 }">
		<img src="images/level.gif" width="${comments.re_level * 18}" height="8px">
		</c:if>
		<c:if test="${comments.del == 'n' }">
		${comments.comm_content }
		</c:if>
		<c:if test="${comments.del == 'y' }">
		<font style="color: #999; font-style: italic;">삭제한 댓글입니다</font>
		</c:if>
		</td>
		<fmt:formatDate value="${comments.reg_date }" pattern="yyyyMMdd" var="pastDate"/>
		<c:if test="${nowDate > pastDate }">
			<td style="text-align: right; margin-left: 10px;">
			<fmt:formatDate value="${comments.reg_date }" type="date" pattern="yyyy/MM/dd"/></td>
		</c:if>
		<c:if test="${nowDate == pastDate }">
			<td style="text-align: right; margin-left: 10px;"><fmt:formatDate value="${comments.reg_date }" type="time" pattern="HH:mm"/></td>
		</c:if>
		</tr>
		<tr class="w3-comment">
		<td colspan="2"></td>
		<td id="btn_${comments.comment_no }" colspan="2" style="text-align:right;">
		<c:if test="${not empty member_id && comments.del == 'n'}">
			<input type="button" id="reComm" value="댓글" class="btn-two comm charcoal rounded"
			onclick="reComm(${comments.comment_no})">
			<c:if test="${member_id == comments.member_id }">
			<input type="button" id="updateComm" value="수정" class="btn-two comm blue rounded"
			onclick="cUpdate(${comments.comment_no})">
			<input type="button" id="deleteComm" value="삭제" class="btn-two comm red rounded"
			onclick="cDelete(${comments.comment_no})">
			</c:if>	
		</c:if>
		</td>
		</tr>
	</c:forEach>
	</table>
</c:if>

<div id="commPage" style="margin-top:10px">
	<c:if test="${startPage > pagePerBlock }">
		<a href="#" onclick="return forword(${startPage - 1 })"><<</a>
	</c:if>
	<c:forEach var="i" begin="${startPage }" end="${endPage }">
		<c:if test="${i == currentPage }">
			<b>${ i }</b>
		</c:if>
		<c:if test="${i != currentPage }">
			<a href="#" onclick="return pageN(${startPage},${endPage})">${i }</a>
		</c:if>
	</c:forEach>
	<c:if test="${endPage < totalPage }">
		<a href="#" onclick="return backword(${endPage+1})">>></a>
	</c:if>
</div>

<div id="cTab"></div>
</body>
</html>

