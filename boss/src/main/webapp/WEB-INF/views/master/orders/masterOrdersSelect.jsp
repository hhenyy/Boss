<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<link rel="stylesheet" href="css/masterCss.css">
<script src="js/master.js"></script>
<title>Insert title here</title>


</head>
<body>

	<%@ include file="../common/masterNav.jsp"%>
	<form method="post" action="masterordersDelete.do">
		<div class="container">
			<h1 class="h1_caption">주문 상세정보</h1>

			<table>
				<tr>
					<th>고유번호</th>
					<th>ID</th>
					<th>수령인</th>
					<th>휴대폰</th>
					<th>우편번호</th>
					<th>주소</th>
					<th>총금액</th>
					<th>배송비</th>
					<th>메시지</th>
					<th>주문일</th>
					<th>관리</th>
				</tr>

				<tr>

					<td>${orders.oid}</td>
					<td>${orders.memail}</td>
					<td>${orders.oname}</td>
					<td>${orders.ophone}</td>
					<td>${orders.opost}</td>
					<td>${orders.oaddress}</td>
					<td>${orders.ototalprice}</td>
					<td>${orders.odelivery}</td>
					<td>${orders.omessage}</td>
					<td>${orders.oreg}</td>
					<td>
						<button type="button"
							onclick="location.href='masterOrdersUpdateForm.do?oid=${orders.oid}'">수정</button>
						<button type="button"
							onclick="location.href='masterOrdersDelete.do?oid=${orders.oid}' ">삭제</button>
					</td>
				</tr>
			</table>

			<table class="fancy_table">
				<tr>
					<th>수령인</th>
					<td>${orders.oname}</td>
					<td></td>
					<th>휴대폰</th>
					<td>${orders.ophone}</td>
					<td></td>

					<th>배송일</th>
					<td>${orders.oreg}</td>

				</tr>
				<tr rowspan="3">
					<th>주문 목록</th>
<%-- 					<c:forEach items="odlist" var="od"> --%>
<%-- 					<td>${od.odid}</td> --%>
<%-- 					</c:forEach> --%>
					
				</tr>
<!-- 				ODID -->
<!-- OID -->
<!-- PID -->
<!-- ODSTATUS -->
<!-- ODCOUNT -->
				<tr>
					<th></th>
				</tr>
				<tr>
					<th></th>
				</tr>
				<tr>
					<th></th>
				</tr>
				<tr>
					<th></th>
				</tr>




				<tr>
					<th>배송메시지</th>
					<td colspan="7"><textarea readonly="readonly">${orders.omessage}</textarea></td>
				</tr>
				<tr>
					<th>우편번호</th>
					<td>${orders.opost}</td>
					<th>주소</th>
					<td>${orders.oaddress}</td>

					<th>총가격</th>
					<td>${orders.ototalprice}</td>
					<th>배송비</th>
					<td>${orders.odelivery }</td>

				</tr>


			</table>
		</div>
	</form>
</body>
</html>