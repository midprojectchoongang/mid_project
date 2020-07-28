<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form id="frm">
	<input type="hidden" name="member_id" id="member_id" value="${member_id}">
	<input type="hidden" name="free_no" id="free_no" value="${free.free_no}">
	<c:if test="${not empty member_id }">
		<table class="w3-table w3-centered w3-bordered" style="max-width: 1000px">
			<tr>
				<td><textarea rows="3" cols="50" name="comm_content" id="comm_content"></textarea></td>
				<td><input type="button" value="댓글입력" id="cInsert" class="btn-two mini charcoal rounded"></td>
			</tr>
		</table>
	</c:if>
	</form>
</body>
</html>