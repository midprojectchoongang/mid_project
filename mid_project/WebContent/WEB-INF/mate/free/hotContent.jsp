<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../sessions/memberSession.jsp" %>
<%@ include file="../sessions/masterSession.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">@import url("temp.css");</style>
<script type="text/javascript">
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
<fmt:formatDate value="${free.reg_date }" pattern="yyyy.MM.dd  HH:mm" var="date"/>
<div>
	<input type="hidden" name="pageNum" value="${pageNum }">
	<table>
		<tr><th>카테고리</th>
			<td><c:if test="${free.category == 'f'}">잡담</c:if>
				<c:if test="${free.category == 'i'}">정보</c:if>
				<c:if test="${free.category == 'a'}">후기</c:if></td>
			<th>작성일</th><td>${date }</td>
			<th>조회수</th><td>${free.cnt }</td>
		</tr>
		<tr>
			<th>제목</th><td colspan="3">${free.subject }</td>
			<th>작성자</th><td>${free.member_id }</td>
		<tr><td colspan="6">${free.content }</td></tr>
	</table><p>
<c:if test="${member_id == free.member_id }">
	<input type="button" value="수정" onclick="location.href='updateForm.free?free_no=${free.free_no }&pageNum=${pageNum }'">&emsp;
	<input type="button" value="삭제" onclick="delmsg()">&emsp;
</c:if>
<c:if test="${not empty master_id }">
	<input type="button" value="삭제" onclick="delmsg()">&emsp;
</c:if>
<c:if test="${not empty member_id && member_id != free.member_id}">
	<input type="button" value="스크랩" onclick="location.href='scrapChk.freeS?free_no=${free.free_no }&pageNum=${pageNum }'">&emsp;
</c:if>
	<input type="button" value="목록보기" onclick="location.href='hotList.free?pageNum=${pageNum}'">
</div>
</body>
</html>