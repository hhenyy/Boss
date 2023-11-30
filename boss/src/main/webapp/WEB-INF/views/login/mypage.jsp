<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<link rel="stylesheet" href="css/sidebar.css">
<!-- <link rel="stylesheet" href="css/mypage.css"> -->

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
		<ul>
			<li><a class="mypage_sidebar" href='#'>메뉴</a></li>
			<li><a href='mypage.do'>내 주문내역</a></li>
			<li><a href='cartFormMove.do'>장바구니</a></li>
			<li><a href='mypageQnA.do'>내가 쓴 QnA</a></li>
			<li><a href='mypageReview.do'>내가 쓴 Review</a></li>
		</ul>

		<c:if test="${not empty ordersList}">
			<div class="content">
				<h1>내 주문 내역</h1>

				<div class="container_orders">
					<table border="1" class="ordertable">
						<tr>
							<th>주문번호</th>
							<th>상품명</th>
							<th>상품 이미지</th>
							<th>주문 상품 수량</th>
							<th>상품 배송 상태</th>
							<th>주문일</th>
						</tr>

						<c:forEach items="#{statusMsg }" var="msg" varStatus="loop">
							<c:forEach items="${ordersList}" var="order" varStatus="loop">
								<tr>
									<td>${order['OID']}</td>
									<td>${order['PNAME']}</td>
									<td style="position: relative;"><img
										src="./images/${order['PIMAGE']}" width="50" height="50"
										class="toggle-image"> <span class="text-on-image">${o.PTEXT}</span>
									</td>
									<td>${order['ODCOUNT']}</td>
									<td>${msg }</td>
									<fmt:formatDate value="${order['OREG']}"
										pattern="yyyy년 MM월 dd일" var="formattedDate" />
									<td>${formattedDate}</td>
								</tr>
							</c:forEach>
						</c:forEach>
					</table>
				</div>
			</div>
		</c:if>

		<c:if test="${empty ordersList}">
			<div class="content_noorderlist">
				<h1>주문한 내역이 없습니다.</h1>
			</div>
		</c:if>

	</c:if>
	<!-- 세션 확인 -->
</body>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</html>