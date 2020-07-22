<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function deleteChk() {
		var msg = "삭제하시겠습니까?";
		if (confirm(msg)) {
			location.href="delete.notice?notice_no=${notice.notice_no }";
		} else {
			return;
		}
	}
</script>
</head>
<body>
<!-- Header, NavBar -->
<%@ include file="../mainPage/nav.jsp" %>

<fmt:formatDate value="${notice.reg_date }" pattern="yyyy.MM.dd  HH:mm" var="date"/>
<b style="font-size: 24px; position: absolute; margin-left: 25%; margin-top: -100px ">공지사항</b>

	<!-- 리스트 -->
<div align="center" style="margin-top: 200px; position: relative; min-height: 500px">
	<table class="w3-table w3-centered w3-bordered">
		<tr><th>${notice.subject }</th>
			<td>${date }</td></tr>
		<tr style="min-height: 300px"><td colspan="3" style="text-align: left; padding: 50px;"><pre>${notice.content }</pre></td></tr>	
	</table><p>
	<button onclick="location.href='noticeList.notice?category=${free.category }&pageNum=${pageNum }'">목록보기</button>
	<!-- 관리자용 수정 및 삭제 버튼 -->
	<c:if test="${not empty master_id }">
		<hr>
		<button onclick="location.href='updateForm.notice?notice_no=${notice.notice_no }&pageNum=${pageNum }'">수정</button>&emsp;
		<button onclick="deleteChk()">삭제</button>
	</c:if>
</div>

<!-- Footer -->
<%@ include file="../mainPage/footer.jsp" %>
</body>
</html>