<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>
<!-- css 양식 include -->
<%-- <%@include file="/WEB-INF/views/common/header.jsp"%> --%>

<!-- css 불러오기 -->
<link rel="stylesheet" href="./css/bucket.css">


</head>

<body>

	<header> </header>

	<div class="container">
		<div class="row qnas" style="text-align: center;">
			<h3 class="page-header">
				<label>장바구니</label>
			</h3>

			<!-- 장바구니에 등록된 상품이 없는 경우  -->
			<c:if test="${empty cartList}">
				<table>
					<tr>
						<th>상품정보</th>
						<th>수량</th>
						<th>가격</th>
						<th>옵션</th>
						<th>총 상품금액</th>
						<th>수정/삭제</th>
					</tr>
					<tr>
						<td colspan="6">
							<div style="margin-top: 20px; margin-bottom: 20px;"
								align="center">
								<label style="font-size: 15px;"> 장바구니에 담긴 상품이 없습니다.</label>
							</div>
						</td>
					</tr>
				</table>
				<button class="button" id="paymentButton" onClick="location.href='main.do';"">쇼핑
					계속 하기</button>
		</div>

		</c:if>

		<!-- 장바구니에 등록된 상픔이 있는 경우 -->
		<c:if test="${not empty cartList}">

			<!-- 장바구니 리스트 -->
			<c:forEach var="sn" items="${shopNo}">
				<table>
					<tr>
						<th>상품정보</th>
						<th>수량</th>
						<th>가격</th>
						<th>옵션</th>
						<th>총 상품금액</th>
						<th>수정/삭제</th>
					</tr>
					<tr>
						<td>Peter</td>
						<td>Griffin</td>
						<td>$100</td>
						<td>$100</td>
						<td>$100</td>
						<td>$100</td>
					</tr>
				</table>
			</c:forEach>
		</c:if>
	</div>
	</table>
	<div class="price_div">
		<div class="totalPrice_div">
			결제예정금액 : <span class="totalPrice_span_${sn.s_no }"></span><br>
			배송비 : <span class="deliveryFee_span_${sn.s_no }"></span> <label
				id="d_msg">※ 8만원 이상 구매 시 무료 배송 ※</label>
		</div>

	</div>


	<div class="goShoping_div">
		<button id="order_btn" class="button"
			onClick="location.href='orderPage.do';">주문하기</button>
		<button id="delete_btn" class="button">선택 상품 삭제</button>
		<button id="shoping_btn" class="button"
			onClick="location.href='main.do';">쇼핑 계속하기</button>
	</div>



	<footer> </footer>

</body>
</html>