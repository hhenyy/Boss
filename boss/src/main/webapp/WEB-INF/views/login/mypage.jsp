<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
				${member.mName } 님<br>
				<button id="memberupdate" class="button1">회원 수정</button>
				<button id="memberdrop" class="button1">회원 탈퇴</button>
			</div>
			<!-- container_left -->

			<div class="container_orders">
				<h1>주문 내역</h1>

				<tr>
					<th>주문번호</th>
					<th>ID</th>
					<th>상품명</th>
					<th>주문 상품 수량</th>
					<th>주문일</th>
				</tr>


			</div>
			<!-- container_orders -->

		</div>
		<!-- container_main -->
	</c:if>
	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>