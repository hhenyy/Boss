<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제 폼</title>
<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>
</head>
	<body>
 
<button onclick="requestPay()">결제하기</button>
 
<script>
	var IMP = window.IMP;
	IMP.init("imp38468686"); // 예: imp00000000
	
    function requestPay() {
      //IMP.request_pay(param, callback) 결제창 호출
      IMP.request_pay({ // param
          pg: "inicis",
          pay_method: "card",
          merchant_uid: "ORD20180131-0000011",
          name: "노르웨이 회전 의자",
          amount: 64900,
          buyer_email: "gildong@gmail.com",
          buyer_name: "홍길동",
          buyer_tel: "010-4242-4242",
          buyer_addr: "서울특별시 강남구 신사동",
          buyer_postcode: "01181"
      }, function (rsp) { // callback
          if (rsp.success) {
              // 결제 성공 시 로직
          } else {
              // 결제 실패 시 로직
          }
      });
    }
  </script>
</body>
</html>