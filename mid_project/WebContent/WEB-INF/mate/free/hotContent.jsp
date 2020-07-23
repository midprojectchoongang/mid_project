<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
<!-- Header, NavBar -->
<%@ include file="../mainPage/nav.jsp" %>

<fmt:formatDate value="${free.reg_date }" pattern="yyyy.MM.dd  HH:mm" var="date"/>
<b style="font-size: 24px; position: absolute; margin-left: 25%; margin-top: -100px ">HOT 게시판</b>

	<!-- 리스트 -->
<div align="center" style="margin-top: 200px; position: relative; min-height: 500px">
	<input type="hidden" name="pageNum" value="${pageNum }">
	<table class="w3-table w3-centered w3-bordered">
		<tr><th>카테고리</th>
			<td><c:if test="${free.category == 'f'}">잡담</c:if>
				<c:if test="${free.category == 'i'}">정보</c:if>
				<c:if test="${free.category == 'a'}">후기</c:if></td>
			<th>작성일</th><td>${date }</td><td style="width: 100px"></td>
			<th>조회수</th><td>${free.cnt }</td>
		</tr>
		<tr>
			<th>제목</th><td colspan="4">${free.subject }</td>
			<th>작성자</th><td>${free.member_id }</td>
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

<!-- Footer -->
<%@ include file="../mainPage/footer.jsp" %>
</body>
</html>