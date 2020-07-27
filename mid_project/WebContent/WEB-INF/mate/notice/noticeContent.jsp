<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MATE</title>
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
<fmt:formatDate value="${notice.reg_date }" pattern="yyyy.MM.dd  HH:mm" var="date"/>

<!-- Header, NavBar -->
<%@ include file="../mainPage/nav.jsp" %>

<b style="font-size: 24px; position: absolute; margin-left: 25%; margin-top: -100px ">공지사항</b>

<div align="center" style="margin-top: 200px; position: relative; min-height: 450px; margin-bottom: 100px;">
	<table class="w3-table w3-centered w3-bordered">
		<tr><th width="100">제목</th>
			<td style="left-margin: 50px; text-align: left">${notice.subject }</td>
			<td width="150">${date }</td></tr>
		<tr height="300"><td colspan="3" style="text-align: left; padding: 50px;"><pre>${notice.content }</pre></td></tr>	
	</table><p>
	
	<!-- 관리자용 수정 및 삭제 버튼 -->
	<c:if test="${not empty master_id }">
		<a href="updateForm.notice?notice_no=${notice.notice_no }&pageNum=${pageNum }" class="btn-two mini blue rounded">수정</a>
		<a href="#" onclick="deleteChk()" class="btn-two mini red rounded">삭제</a>
	</c:if>
	<a href="noticeList.notice?pageNum=${pageNum }" class="btn-two mini charcoal rounded">목록으로</a>
</div>

<!-- Footer -->
<%@ include file="../mainPage/footer.jsp" %>
</body>
</html>