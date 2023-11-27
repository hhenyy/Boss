<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<link rel="stylesheet" href="css/mypage.css">

<body>

	<%@ include file="/WEB-INF/views/common/header.jsp"%>
	<!-- 세션이 없을때 마이페이지 -->
	<c:if test="${member == null }">
		<script>
			alert("로그인이 되어 있지 않습니다.");
			location.href = "NaverLogin.do";
		</script>
	</c:if>


	<!-- 세션이 있을때 마이페이지 -->
	<c:if test="${member != null }">
		<h1 align="left">My Page</h1>
		<div class="container_main">

			<div class="container_left">
				 <span class="member-mName">${member.mName }</span><br>	<!-- 이름 출력 -->
				 <span class="member-grade">${member.mGrade}</span><br> <!-- 회원 등급 출력 -->
				<button id="memberupdate" class="memberupdate_btn">회원 수정</button>
				<button id="memberdrop" class="memberdrop_btn">회원 탈퇴</button>
			</div>
			<!-- container_left -->

			<div class="container_orders">
				<h1 class="orderHeader">주문 내역</h1>
				<table border="1">
					<tr>
						<th>주문번호</th>
						<th>상품명</th>
						<th>상품 이미지</th>
						<th>주문 상품 수량</th>
						<th>주문일</th>
					</tr>
					
					<c:forEach items="${ordersList}" var="order" varStatus="loop">
						<td>${order['OID']}</td>
						<td>${order['PNAME']}</td>
						<td style="position: relative;"><img
							src="./images/${order['PIMAGE']}" width="50" height="50"
							class="toggle-image"> <span class="text-on-image">${o.PTEXT}</span>
						</td>
						<td>${order['ODCOUNT']}</td>
						<td>${order['OREG']}</td>
					</c:forEach>
					
					
				</table>


			</div>
			<!-- container_orders -->

		</div>
		<!-- container_main -->
	</c:if>
	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>