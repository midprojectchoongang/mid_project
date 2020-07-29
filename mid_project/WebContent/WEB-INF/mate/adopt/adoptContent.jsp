<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MATE</title>
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
	    } else if (writer != loginId) {
	    	$('#showList').css('margin-bottom','100px');
	    }
	});
</script>
</head>
<body>
<fmt:formatDate value="${adopt.reg_date }" pattern="yyyy.MM.dd  HH:mm" var="date"/>
<!-- Header, NavBar -->
<%@ include file="../mainPage/nav.jsp" %>

<c:if test="${member_id != adopt.member_id }">
	<%@ include file="../mainPage/sideNav.jsp" %>
</c:if>

<div style=" position: absolute; margin-left: 25%; margin-top: -100px">
	<c:if test="${member_id != adopt.member_id }">
			<b style="font-size: 24px; margin-right: 20px">공고 게시판</b>
	</c:if>
	<c:if test="${member_id == adopt.member_id }">
		<b style="font-size: 24px; margin-right: 20px">내가 쓴 공고</b>
	</c:if>
	<span style="font-weight: 900; color: grey;	">
		<c:if test="${adopt.location_no == 2}">서울</c:if>
		<c:if test="${adopt.location_no == 31}">경기</c:if>
		<c:if test="${adopt.location_no == 32}">인천</c:if>
		<c:if test="${adopt.location_no == 41}">충남</c:if>
		<c:if test="${adopt.location_no == 42}">대전</c:if>
		<c:if test="${adopt.location_no == 43}">충북</c:if>
		<c:if test="${adopt.location_no == 44}">세종</c:if>
		<c:if test="${adopt.location_no == 51}">부산</c:if>
		<c:if test="${adopt.location_no == 52}">울산</c:if>
		<c:if test="${adopt.location_no == 53}">대구</c:if>
		<c:if test="${adopt.location_no == 54}">경북</c:if>
		<c:if test="${adopt.location_no == 55}">경남</c:if>
		<c:if test="${adopt.location_no == 61}">전남</c:if>
		<c:if test="${adopt.location_no == 62}">광주</c:if>
		<c:if test="${adopt.location_no == 63}">전북</c:if>
		<c:if test="${adopt.location_no == 64}">제주</c:if>
		&emsp;-&emsp;
		<c:if test="${adopt.largecate_id == 'd'}">강아지</c:if>
		<c:if test="${adopt.largecate_id == 'c'}">고양이</c:if>
		&emsp;-&emsp;
		<c:if test="${adopt.smallcate_id == 'd1'}">대형견</c:if>										
		<c:if test="${adopt.smallcate_id == 'd2'}">중형견</c:if>										
		<c:if test="${adopt.smallcate_id == 'd3'}">소형견</c:if>										
		<c:if test="${adopt.smallcate_id == 'c1'}">장모종</c:if>										
		<c:if test="${adopt.smallcate_id == 'c2'}">단모종</c:if>
	</span>
</div>

<div align="center" style="margin-top: 200px; position: relative; min-height: 450px">
		<input type="hidden" name="pageNum" value="${pageNum }">
		<input type="hidden" name="adopt_no" value="${adopt.adopt_no }">
	<table class="w3-table w3-centered w3-bordered" style="max-width: 1000px;">
		<tr>
			<th width="100">제목</th>
			<td style="text-align:left">${adopt.subject }</td>
			<td width="150">${adopt.member_id }<br>${date }</td>
		</tr>
		<tr height="300">
			<td colspan="3" style="text-align: left; padding: 50px"><pre>${adopt.content }</pre></td>
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
	<c:if test="${empty param.fromApp }">
		<a href="adoptList.adopt?pageNum=${pageNum }&category=${category}" class="btn-two mini charcoal rounded">목록</a>
	</c:if>
	<c:if test="${not empty param.fromApp}">
		<a href="#" onclick="history.back()" class="btn-two mini charcoal rounded">내 지원서</a>
	</c:if>
</div>

<div id="showList">
</div>

<!-- Footer -->
<%@ include file="../mainPage/footer.jsp" %>
</body>
</html>