<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">@import url("temp.css");</style>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript">
	function delmsg() {
	    var msg = "게시물을 삭제합니다";
		if (confirm(msg)) {
		    location.href = 'delete.adopt?adopt_no=${adopt.adopt_no}&pageNum=${pageNum}';
		} else {
		    return;
		}
	}
	
	$(function() {
	    var writer = "${adopt.member_id}";
	    var loginId = "${member_id}";  
	    if (writer == loginId) {
			$('#showList').load('applicationList.application?adopt_no=${adopt.adopt_no}');
	    }
	});
</script>
</head>
<body>
<!-- Header, NavBar -->
<%@ include file="../mainPage/nav.jsp" %>

<div align="center" style="margin: 100px;">
		<input type="hidden" name="pageNum" value="${pageNum }">
		<input type="hidden" name="adopt_no" value="${adopt.adopt_no }">
	<table class="w3-table w3-centered w3-bordered">
		<tr>
			<th>카테고리</th>
			<td>
				<c:if test="${adopt.largecate_id == 'd'}">강아지</c:if>
				<c:if test="${adopt.largecate_id == 'c'}">고양이</c:if>
			</td>
			<td>
				<c:if test="${adopt.smallcate_id == 'd1'}">대형견</c:if>										
				<c:if test="${adopt.smallcate_id == 'd2'}">중형견</c:if>										
				<c:if test="${adopt.smallcate_id == 'd3'}">소형견</c:if>										
				<c:if test="${adopt.smallcate_id == 'c1'}">장모</c:if>										
				<c:if test="${adopt.smallcate_id == 'c2'}">단모</c:if>										
			</td>
			<th>제목</th>
			<td>${adopt.subject }</td>
		</tr>
		<tr>
			<th>작성자</th>
			<td colspan="2">${adopt.member_id }</td>
			<th>작성일</th>
			<td>${adopt.reg_date }</td>
		</tr>
		<tr>
			<td colspan="5">${adopt.content }</td>
		</tr>
	</table>
	<p>
	<c:if test="${member_id == adopt.member_id }">
		<a href="updateForm.adopt?adopt_no=${adopt.adopt_no }&pageNum=${pageNum }" class="btn-two mini blue rounded">수정</a>
		<a href="delmsg()" class="btn-two mini red rounded">삭제</a>
	</c:if>
	<c:if test="${not empty master_id }">
		<a href="delmsg()" class="btn-two mini red rounded">삭제</a>
	</c:if>
	<c:if test="${not empty member_id && member_id != adopt.member_id}">
		<a href="scrapChk.adoptS?adopt_no=${adopt.adopt_no }&pageNum=${pageNum }" class="btn-two mini blue rounded">스크랩</a>
		<a href="writeForm.application?adopt_no=${adopt.adopt_no }&pageNum=${pageNum }" class="btn-two mini blue rounded">지원하기	</a>
	</c:if>
		<a href="#" onclick="history.back()" class="btn-two mini charcoal rounded">목록</a>
</div>

<div id="showList">
</div>

<!-- Footer -->
<%@ include file="../mainPage/footer.jsp" %>
</body>
</html>