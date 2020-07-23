<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../sessions/masterSession.jsp" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- Header, NavBar -->
<%@ include file="../mainPage/nav.jsp" %>

<b style="font-size: 24px; position: absolute; margin: -100px 0 0 43%;">보호소 목록</b>


	<!-- 리스트 -->
<div align="center" style="margin-top: 200px; position: relative; min-height: 450px;">
	<input type="hidden" name="pageNum" value="${pageNum }">
		<table class="w3-table w3-centered w3-bordered"  style="max-width: 750px">
			<tr>
				<th>지역</th><th>보호소 이름</th><th>전화번호</th>
			</tr>
				
		<c:if test="${empty list }">
			<tr><th colspan="3">작성된 보호소가 없습니다</th></tr>
		</c:if>
		
		<c:if test="${not empty list }">
		<c:forEach items="${list }" var="shelter">
			<tr>
				<td>
					<c:if test="${shelter.location_no == 2}">서울</c:if>
					<c:if test="${shelter.location_no == 31}">경기</c:if>
					<c:if test="${shelter.location_no == 32}">인천</c:if>
					<c:if test="${shelter.location_no == 41}">충남</c:if>
					<c:if test="${shelter.location_no == 42}">대전</c:if>
					<c:if test="${shelter.location_no == 43}">충북</c:if>
					<c:if test="${shelter.location_no == 44}">세종</c:if>
					<c:if test="${shelter.location_no == 51}">부산</c:if>
					<c:if test="${shelter.location_no == 52}">울산</c:if>
					<c:if test="${shelter.location_no == 53}">대구</c:if>
					<c:if test="${shelter.location_no == 54}">경북</c:if>
					<c:if test="${shelter.location_no == 55}">경남</c:if>
					<c:if test="${shelter.location_no == 61}">전남</c:if>
					<c:if test="${shelter.location_no == 62}">광주</c:if>
					<c:if test="${shelter.location_no == 63}">전북</c:if>
					<c:if test="${shelter.location_no == 64}">제주</c:if>
				</td>
				<td>
					${shelter.name}
				</td>
				<td>
					${shelter.tel}
				</td>
				<td>
					<c:if test="${not empty master_id }">
					<button onclick="location.href='updateForm.shelter?shelter_no=${shelter.shelter_no}&pageNum=${pageNum }'">수정</button>
					</c:if>	
					
					<c:if test="${not empty master_id }">
					<button onclick="location.href='delete.shelter?shelter_no=${shelter.shelter_no}&pageNum=${pageNum }'">삭제</button>
					</c:if>
				</td>
							
			</tr>
		</c:forEach>
		</c:if>	
	</table><p>
	
	<!-- 관리자용 작성버튼 -->
	<c:if test="${not empty master_id }">
		<a href="insertForm.shelter" class="btn-two small charcoal rounded">보호소 입력</a>
	</c:if>
</div>

	<!-- 페이지 -->
<div id="page1">
	<c:if test="${startPage > pagePerBlock }">
		<a href="shelterList.shelter?pageNum=${startPage - 1 }"><<</a>
	</c:if>
	<c:forEach var="i" begin="${startPage }" end="${endPage }">
		<c:if test="${i == currentPage }">
			<b>${ i }</b>
		</c:if>
		<c:if test="${i != currentPage }">
			<a href="shelterList.shelter?pageNum=${i }">${i }</a>
		</c:if>
	</c:forEach>
	<c:if test="${endPage < totalPage }">
		<a href="shelterList.shelter?pageNum=${endPage + 1 }">>></a>
	</c:if>
</div>
		
<!-- Footer -->
<%@ include file="../mainPage/footer.jsp" %>
</body>
</html>