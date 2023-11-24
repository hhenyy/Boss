<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 페이지</title>
<link rel="stylesheet" href="css/payment.css">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<!-- css 양식 include -->
<%-- <%@include file="/WEB-INF/views/common/header.jsp"%> --%>

<!-- css 불러오기 -->
<link rel="stylesheet" href="./css/payment.css">


<script>
	//우편 번호 검색 api
	function openDaumPostcode() {
		new daum.Postcode({
			oncomplete : function(data) {
				// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

				// 각 주소의 노출 규칙에 따라 주소를 조합한다.
				// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
				var addr = ''; // 주소 변수
				var extraAddr = ''; // 참고항목 변수

				//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
				if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
					addr = data.roadAddress;
				} else { // 사용자가 지번 주소를 선택했을 경우(J)
					addr = data.jibunAddress;
				}

				// 우편번호와 주소 정보를 해당 필드에 넣는다.
				document.getElementById('post_input').value = data.zonecode;
				document.getElementById('arr1').value = addr;
				// 커서를 상세주소 필드로 이동한다.
				document.getElementById('arr2').focus();
			}
		}).open();
	}

	//결제요청 api 
	$(function() {
		$("#paymentButton").click(function() {
			requestPayment();
		});
	});
	function requestPayment(data) {

		IMP.init("imp30851764"); //가맹점 내 식별코드
		IMP.request_pay({
			pg : 'html5_inicis',
			pay_method : 'card',
			merchant_uid : "iamport_test_id", // 상점에서 관리하는 주문 번호를 전달
			name : '주문명:결제테스트',
			amount : 1, //총상품금액
			buyer_email : 'iamport@siot.do',
			buyer_name : '구매자이름',
			buyer_tel : '010-1234-5678',
			buyer_addr : '서울특별시 강남구 삼성동',
			buyer_postcode : '123-456'
		}, function(rsp) { // callback 로직
			if (rsp.success) { // 결제 성공 시 
				$.ajax({
					url : 'orderInsert.do',
					type : 'post',
					dataType : 'json',
					data : {
						"oId" : oId
					},
					success : function(result) {
						if (result == 2) {
							var msg = "결제가 완료되었습니다.";
							alert(msg);
							location.href = "orderInsert.do";
						}
					}
				}); // ajax() end
			} else { // 결제 실패 시
				$.ajax({
					url : 'orderDelete.do',
					type : 'post',
					dataType : 'json',
					data : {
						"oId" : oId
					},
					success : function(result) {
						if (result == 1) {
							var msg = "결제에 실패하였습니다.";
							msg += ' 원인 : ' + rsp.error_msg;
							alert(msg);
							location.href = "main.do";
						}
					}
				}); // ajax() end
			}
		});
	}

	$(document).ready(function() {
		total_sum()
	});

	// 최종 결제 금액	
	function total_sum() {
		let totalPrice = 0;
		let deliveryFee = 0;
		let cpSalePrice = 0;
		let finalTotalPrice = 0;

		$(".product_table_price_td").each(
				function(index, element) {
					// 총 가격
					totalPrice += parseInt($(element)
							.find(".total_price_input").val());
				});

		// 배송비
		if (totalPrice >= 80000) {
			deliveryFee = 0;
		} else if (totalPrice == 0) {
			deliveryFee = 0;
		} else {
			deliveryFee = 3000;
		}

		finalTotalPrice = totalPrice + deliveryFee - cpSalePrice;

		$(".totalPrice_span").text(totalPrice.toLocaleString() + "원");
		$(".deliveryFee_span").text(deliveryFee.toLocaleString() + "원");
		$(".cpSalePrice_span").text(cpSalePrice.toLocaleString() + "원");
		$(".finalTotalPrice_span").text(finalTotalPrice.toLocaleString() + "원");

	}


</script>


</head>
<body>
	<!-- 주문 상품 정보 -->
	<div class="container">
		<h3>주문 상품 정보</h3>
		<table>
			<tr>
				<th colspan="2" width="30%">상품정보</th>
				<th>수량</th>
				<th>가격</th>
				<th>총 상품금액</th>
				<th>배송비</th>
			</tr>
			<c:forEach var="p" items="${list}">
				<tr>
					<td colspan="2" width="30%"><img src="${path}/upload/product/${p.PIMAGE}"
						alt="Product Image"></td>
					<td>${p.OCOUNT}개</td>
					<td><fmt:formatNumber pattern="###,###,###"
							value="${p.OPRICE}" />원</td>
					<td><fmt:formatNumber pattern="###,###,###"
							value="${p.OPRICE * p.OCOUNT}" />원</td>
					<td>${p.ODelivery}</td>
				</tr>
			</c:forEach>
		</table>
	</div>

	<!-- 배송지 정보 -->
	<div class="container2">
		<h3>배송지 정보</h3>
		<table>
			<colgroup>
				<col width="130px">
				<col width="*">
			</colgroup>
			<tbody>

				<tr>
					<th><label style="margin-left: 10px;">받는 분</label></th>
					<td><input class="d_name_input form-control"
						style="margin-bottom: 10px;" name="d_name"></td>
				</tr>
				<tr>
					<th><label style="margin-left: 10px;">휴대폰
							번호</label></th>
					<td><input class="d_tel"
						style="margin-bottom: 10px;" name="d_tel">
						<div style="font-size: 13px; color: #218838; margin-top: 3px; margin-bottom: 3px;">
							※ '-'는 제외하고 입력하세요.</div></td>
				</tr>
				<tr>
					<th><label style="margin-left: 10px;">우편번호</label></th>
					<td>
						<div style="display: flex;">
							<input class="d_post" name="d_post"
								id="post_input" size="5" readonly
								style="width: 100px; margin-bottom: 10px;">
							<button type="button" class="post_btn"
								onclick="openDaumPostcode()"
								style="margin-bottom: 10px; margin-left: 10px;">우편번호검색</button>
						</div>
					</td>
				</tr>
				<tr>
					<th><label style="margin-left: 10px;">배송 주소</label></th>
					<td><input class="d_address"
						name="d_address" id="arr1" size="50" readonly><br>
					<div style="display: flex;">
							<input class="d_detail_address"
								name="d_detail_address" id="arr2" size="37">
						</div></td>
				</tr>
				<tr>
					<th><label style="margin-left: 10px;">배송 메세지</label></th>
					<td><select class="order_message" name="order_message">
							<option value="" selected>배송 메세지를 입력해주세요</option>
							<option value="option1">빠른 배송 바랍니다</option>
							<option value="option2">부재 시 경비(관리)실에 맡겨주세요</option>
							<option value="option3">부재 시 문 앞에 놓아주세요</option>
							<option value="option4">파손의 위험이 있는 상품이 있습니다. 배송 시 주의해주세요</option>
							<option value="option5">배송 전에 연락주세요</option>
							<option value="option6">메세지 직접 입력하기</option>
					</select></td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<div
							style="font-size: 13px; color: #218838; margin-top: 2px;">
							※주문자 정보와 배송지가 다른 경우 직접 입력해주세요.</div>
						<div class="btn_div">
							<!-- 배송지 등록 버튼 없애기 고려 -->
							<button class="insertButton">배송지 등록</button>

						</div>
					</td>
				</tr>
			</tbody>
		</table>
	</div>

	<!-- 결제 금액 정보 -->
	<div class="container3">
		<h3>결제 금액</h3>
		<table class="price_table">
			<tr>
				<td><label>주문 금액</label></td>
				<td class="r"><span class="totalPrice_span"></span></td>
			</tr>
			<tr>
				<td><label>배송비</label></td>
				<td class="r"><span class="deliveryFee_span"></span></td>
			</tr>
			<tr class="final_tr">
				<td><label>최종 결제 금액</label></td>
				<td class="r"><span class="finalTotalPrice_span"></span></td>
			</tr>
		</table>
	</div>

	<!-- 결제 방법 정보 -->
	<div class="container4">
		<h3>결제 방법</h3>
		<table class="payment_table" style="width: 100%; margin-top: 10px;">
			<tr style="border-top: 3px solid; border-top-color: #dddddd;">
				<td><label>결제방법 선택</label></td>
				<td class="pay_info_td"><input type="radio" name="pay_type"
					value="money" checked class="radio1"><label>무통장입금</label>
					<br> <br> <input type="radio" name="pay_type"
					value="inisis" class="radio2"><label>카카오페이/네이버페이/카드결제</label></td>
			</tr>
		</table>
	</div>

	<!-- 체크박스는 name을 같게하고 value를 다르게 -->
	<!-- Checkbox and Text -->
	<div class="container5">
		<div style="margin-top: 20px; text-align: center;">
			<input type="checkbox" id="check" name="check" onclick="check1()">
			<label for="check"> 주문 정보를 확인하였으며, 결제 진행에 동의합니다.</label>
		</div>
		<div style="text-align: center; margin-top: 20px;">
			<button class="paymentButton" id="paymentButton">결제하기</button>
			<button onClick="history.go(-1)">취소</button>
		</div>
	</div>

	<!-- css 양식 include -->
	<%-- <%@include file="/WEB-INF/views/common/footer.jsp"%> --%>
</body>
</html>
