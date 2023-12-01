<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제 폼</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<link rel="stylesheet" href="css/ordersForm.css">

</head>
<!-- jQuery -->
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<!-- iamport.payment.js -->
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<script>
	var IMP = window.IMP;
	IMP.init("imp36778371");

	var today = new Date();
	var hours = today.getHours(); // 시
	var minutes = today.getMinutes(); // 분
	var seconds = today.getSeconds(); // 초
	var milliseconds = today.getMilliseconds();
	var makeMerchantUid = hours + minutes + seconds + milliseconds;

	var name = '${member.mName}';
	var amount = '${bucket.bprice}';
	var buyer_email = '${member.mEmail}';
	var buyer_name = '${member.mName};'
	var buyer_tel = '${member.mPhone}';
	var buyer_addr = '${member.mAddress}';
	var buyer_postcode = '${member.mPost}';

	function requestPay() {
		IMP.request_pay({
			pg : 'kcp',
			pay_method : 'card',
			merchant_uid : "IMP" + makeMerchantUid,
			name : name,
			amount : amount,

			buyer_email : buyer_email,
			buyer_name : buyer_name,
			buyer_tel : buyer_tel,
			buyer_addr : buyer_addr,
			buyer_postcode : buyer_postcode
		}, function(rsp) { // callback

			// 		    // 결제검증
			// 	        $.ajax({
			// 	            type : "POST",
			// 	            url : "/verifyIamport/" + res.imp_uid

			// 검증완료시
			if (rsp.success) {
				console.log(rsp);

				// 검증 실패시
			} else {
				console.log(rsp);
			}
		});
	}
</script>

<body>
	<form>
		<div class="container_main">
			<div class="container_left">

				<h2>배송지 입력</h2>
				<table class="table_orders1">
					<tr>
						<td><input type="text" value="${member.mName }"
							style="color: palegreen; font-size: 30px"></td>
					</tr>
					<tr>
						<td><input type="text" value="${member.mPhone }"></td>
					</tr>
					<tr>
						<td><input type="text" value="${member.mPost }"></td>
					</tr>
					<tr>
						<td><input type="text" value="${member.mAddress }"></td>
					</tr>
				</table>
				<h2>주문자 입력</h2>
				<table class="table_orders2">
					<tr>
						<td><input type="text" value="${member.mName }"
							style="color: palegreen; font-size: 30px"></td>
					</tr>
					<tr>
						<td><input type="text" value="${member.mPhone }"></td>
					</tr>
				</table>



				<h2>주문상품</h2>
				<table class="table_product">
					<tr>
						<td class="class_td" rowspan="5"><img
							src="imeges/${bucket.bimage}"></td>
					<tr>
						<td><input type="text" value="${bucket.bname}"
							style="color: palegreen; font-size: 30px"></td>
					</tr>

					<tr>
						<td>${bucket.bsize}</td>
					</tr>
					<tr>
						<td>${bucket.bcolor}</td>
					</tr>
					<tr>
						<td>${bucket.bprice}&#8361;${bucket.bcount}개</td>
					</tr>

				</table>

			</div>
			<div class="container_right">
				<table class="table_point">



					<tr>
						<h2>결제정보</h2>
					</tr>
					<tr>
						<td>${bucket.bname}</td>
						<td>${bucket.bcolor}</td>
					</tr>
					<tr>
						<td>${bucket.bsize}</td>
					</tr>
					<tr>
						<td>${bucket.bcount}</td>
					</tr>
					<tr>
						<td>${bucket.bsize}</td>
					</tr>
				</table>
				<div class="img_logo">
					<a><img src="./images/logo.png" style="width: 350px"></a>
				</div>
			</div>
	</form>







	<button onclick="requestPay()">결제하기</button>


</body>

</html>