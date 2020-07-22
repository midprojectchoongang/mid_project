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
	
	<div align="center" style="margin-top: 100px; margin-left: 100px; margin-right: 100px">
	<input type="hidden" name="pageNum" value="${pageNum }">
		<b style="font-size: 24px;text-align: left; margin-right:600px;">보호소 찾기</b>
	
	<!-- 관리자용 작성버튼 -->
	<c:if test="${not empty master_id }"><button onclick="location.href='insertForm.shelter'">작성</button></c:if>

		<!-- 리스트 -->
		<table class="w3-table w3-centered w3-bordered">
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
</p>
</div>
		<!-- 페이지 -->
	<div id="page1">
		<c:if test="${startPage > pagePerBlock }">
		<button onclick="location.href='shelterList.shelter?pageNum=${startPage - 1 }'">이전</button>
		</c:if>
		<c:forEach var="i" begin="${startPage }" end="${endPage }">
		<c:if test="${i == currentPage }">
			<button onclick="location.href='shelterList.shelter?pageNum=${i }'" disabled="disabled">${ i }</button>
		</c:if>
		<c:if test="${i != currentPage }">
			<button onclick="location.href='shelterList.shelter?pageNum=${i }'">${i }</button>
		</c:if>
		</c:forEach>
		<c:if test="${endPage < totalPage }">
		<button onclick="location.href='shelterList.shelter?pageNum=${endPage + 1 }'">다음</button>
		</c:if>
	</div>
	

		
<!-- Footer -->
<%@ include file="../mainPage/footer.jsp" %>
</body>
</html>