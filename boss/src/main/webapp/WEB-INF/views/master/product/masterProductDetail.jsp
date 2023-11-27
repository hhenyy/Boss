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
<title>상품상세정보</title>
<!-- css 양식 include -->
</head>
<body>
	<%@ include file="../common/masterNav.jsp"%>

	<div class="container">
		<table>
			<caption>상품 상세 정보</caption>
			<tr>
				<th>상품코드</th>
				<th>이미지</th>
				<th>상품명</th>
				<th>색상</th>
				<th>사이즈</th>
				<th>설명</th>
				<th>등록일</th>
				<th>재고수량</th>
				<th>삭제여부[Y/N]</th>
				<th>수정/삭제</th>
			</tr>
			<tr>
				<td>${product.pid }</td>
				<td><img src="./images/${product.pimage }" width="100"
					height="100"></td>
				<td>${product.pname }</td>
				<td>${product.pcolor }</td>
				<td>${product.psize }</td>
				<td>${product.pcontent }</td>

				<c:if test="${product.preg != null}">
					<td><fmt:formatDate pattern="yyyy-MM-dd"
							value="${product.preg }" /></td>
				</c:if>

				<c:if test="${product.preg == null }">
					<td><fmt:formatDate pattern="yyyy-MM-dd" value="${date }" /></td>
				</c:if>
				<td>${amount.acount }</td>

				<td>${product.pdrop }</td>
				<td>
					<button type="button"
						onclick="location.href='masterProductUpdateForm.do?id=${product.pid}'">수정</button>
					<button type="button"
						onclick="alert('삭제하시겠습니까?'); location.href='masterProductDelete.do?id=${product.pid}'">삭제</button>
				</td>
			</tr>
		</table>
		<table class="fancy_table">
			<tr>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
			<tr align="center">
				<td colspan="9"
					style="padding: 20px; color: deeppink; font-size: 40px; font-weight: bold;">주문회원
					목록</td>

			</tr>
			<tr>
				<th>ID</th>
				<th>이름</th>
				<th>핸드폰</th>
				<th>우편번호</th>
				<th>주소</th>
				<th>회원등급</th>
				<th>가입일</th>
				<th>삭제여부</th>
			</tr>

			<script>
					var total = 0;
				</script>
			<c:forEach var="o" items="${ordersList}">
				<tr>
					<td onclick="location.href='masterProductDetail.do?id=${o.PID }' ">${o.PID }</td>
					<td onclick="location.href='masterProductDetail.do?id=${o.PID }' ">${o.PNAME }</td>
					<!-- HTML -->
					<td style="position: relative;"><img
						src="./images/${o.PIMAGE}" width="50" height="50"
						class="toggle-image"> <span class="text-on-image">${o.PTEXT}</span>
					</td>

					<td onclick="location.href='masterProductDetail.do?id=${o.PID }' ">${o.PCOLOR }</td>
					<td onclick="location.href='masterProductDetail.do?id=${o.PID }' ">${o.PSIZE }</td>
					<td onclick="location.href='masterProductDetail.do?id=${o.PID }' ">${o.ODCOUNT}</td>
					<td onclick="location.href='masterProductDetail.do?id=${o.PID }' ">${o.PPRICE }</td>
					<td><script>
						        var result = ${o.PPRICE} * ${o.ODCOUNT};
						    	document.write(result);
						      total = total+result; 
						      </script></td>
					<td>
						<button type="button" class="putsub2"
							onclick="location.href='masterProductUpdateForm.do?id=${o.PID}'">상품수정</button>


						<select class="select-Dtype"
						onchange="location.href='masterOrdersStatus.do?odid=${o.ODID}&odstatus='
							+ this.value;"
						style="color: black; background-color: gray; font-size: 15px">
							<option value="0" style="color: black; background-color: gray;"
								<c:if test="${o.ODSTATUS == 0}"> selected 
									</c:if>>배송상태
							</option>
							<option value="1"
								style="color: black; background-color: papayawhip;"
								<c:if test="${o.ODSTATUS == 1}"> selected </c:if>>배송대기</option>
							<option value="2"
								style="color: black; background-color: MediumSpringGreen;"
								<c:if test="${o.ODSTATUS == 2}"> selected </c:if>>배송완료</option>
							<option value="3"
								style="color: black; background-color: deeppink;"
								<c:if test="${o.ODSTATUS == 3}"> selected </c:if>>취소대기</option>
							<option value="4"
								style="color: black; background-color: darkorange;"
								<c:if test="${o.ODSTATUS == 4}"> selected </c:if>>취소완료</option>
					</select>



					</td>
				</tr>
			</c:forEach>

			<tr>
				<th>배송메시지</th>
				<td colspan="8"><textarea readonly="readonly">${orders.OMESSAGE}</textarea></td>

			</tr>
			<tr>
				<th>우편번호</th>
				<td>${orders.OPOST}</td>
				<th>주소</th>
				<td colspan="2">${orders.OADDRESS}</td>
				<th>배송비</th>
				<td>${orders.ODELIVERY}</td>
				<th>결제금액</th>
				<td><script>
					  document.write(total);
					</script></td>
			</tr>
		</table>

	</div>
	<br>

</body>
</html>