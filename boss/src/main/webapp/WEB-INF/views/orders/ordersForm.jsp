<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제 폼</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>

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

	
	// 사용자 임의의 변수값들 들어올곳.
	var pid = '${product.pid}';
	var pname = '${product.pname}';
	var pprice = '${product.pprice}';
	
	function requestPay() {
		IMP.request_pay({
			pg : 'kcp',
			pay_method : 'card',
			merchant_uid : "IMP" + makeMerchantUid,
			name : pname,
			amount : pprice,
			
			
			buyer_email : 'Iamport@chai.finance',
			buyer_name : '아임포트 기술지원팀',
			buyer_tel : '010-1234-5678',
			buyer_addr : '서울특별시 강남구 삼성동',
			buyer_postcode : '123-456'
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
<meta charset="UTF-8">
<title>Sample Payment</title>
</head>
<body>
	<form>
		<table border="1">
			<tr>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
			</tr>
			<tr>
				<td><input type="text" id="name"></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
		</table>
	</form>




	<button onclick="requestPay()">결제하기</button>
	<!-- 결제하기 버튼 생성 -->
</body>
</html>