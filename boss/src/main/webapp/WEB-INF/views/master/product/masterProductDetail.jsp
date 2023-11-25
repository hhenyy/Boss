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
					<td><fmt:formatDate pattern="yyyy-MM-dd"
						value="${date }" /></td>
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
	</div>
	<br>

</body>
</html>