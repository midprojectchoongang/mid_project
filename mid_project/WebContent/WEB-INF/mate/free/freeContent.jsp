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
$("#enterComm").click(function(){
    var no = ${free.free_no};
    var id = "${member_id}";
	if($("#comm_content").val().trim() == ""){
		alert("댓글을 입력하세요.");
		$("#comm_content").val("").focus();
	}else{
		$.ajax({
			url: "writeComm.comm?free_no=${free.free_no}",
            type: "POST",
            data: {
	        	free_no : no,
	        	member_id : id,
	        	comm_content : $("#comm_content").val()
            },
            success: function () {
            	alert("댓글 등록 완료");
            	$("#comm_content").val("");
            	//getComm();
            }
		});
	}
});

function delmsg() {
    var msg = "게시물을 삭제합니다";
	if (confirm(msg)) {
	    location.href = 'delete.free?category=${free.category}&free_no=${free.free_no}&pageNum=${pageNum}';
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
<c:if test="${free.category == 'f' }">
	<b style="font-size: 24px; position: absolute; margin-left: 25%; margin-top: -100px ">자유게시판</b>
</c:if>
<c:if test="${free.category == 'i' }">
	<b style="font-size: 24px; position: absolute; margin-left: 25%; margin-top: -100px ">정보게시판</b>
</c:if>
<c:if test="${free.category == 'a' }">
	<b style="font-size: 24px; position: absolute; margin-left: 25%; margin-top: -100px ">입양 후기</b>
</c:if>

	<!-- 리스트 -->
<div align="center" style="margin-top: 200px; position: relative; min-height: 500px">
	<input type="hidden" name="pageNum" value="${pageNum }">
	<input type="hidden" name="free_no" value="${free.free_no }">
	<table class="w3-table w3-centered w3-bordered">
		<tr><th>카테고리</th>
			<td><c:if test="${free.category == 'f'}">잡담</c:if>
				<c:if test="${free.category == 'i'}">정보</c:if>
				<c:if test="${free.category == 'a'}">후기</c:if></td>
			<th>작성일</th><td>${date }</td>
		</tr>
		<tr>
			<th>제목</th><td>${free.subject }</td>
			<th>작성자</th><td>${free.member_id }</td>
		<tr height="300"><td colspan="4" style="text-align: left; padding: 50px;"><pre>${free.content }</pre></td></tr>	
		<!-- 댓글  작성 -->
		<c:if test="${not empty member_id }">
		<tr>
		<td colspan="2">
		<textarea rows="4" cols="50" name="comm_content" id="comm_content"></textarea>
		<td>
		<td>
		<input type="button" class="btn-two mini charcoal rounded" id="enterComm" value="댓글등록">
		</td>
		</tr>
		</c:if>
	</table><p>
	<c:if test="${member_id == free.member_id }">
		<a href="updateForm.free?free_no=${free.free_no }&pageNum=${pageNum }" class="btn-two mini blue rounded">수정</a>
		<a href="delmsg()" class="btn-two mini red rounded">삭제</a>
	</c:if>
	<c:if test="${not empty master_id }">
		<a href="delmsg()" class="btn-two mini red rounded">삭제</a>
	</c:if>
	<c:if test="${not empty member_id && member_id != free.member_id}">
		<a href="scrapChk.freeS?free_no=${free.free_no }&pageNum=${pageNum }" class="btn-two mini blue rounded">스크랩</a>
	</c:if>
		<a href="freeList.free?category=${free.category }&pageNum=${pageNum}" class="btn-two mini charcoal rounded">목록</a>
</div>

<!-- Footer -->
<%@ include file="../mainPage/footer.jsp" %>
</body>
</html>