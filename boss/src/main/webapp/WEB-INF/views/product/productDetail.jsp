<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세 페이지</title>

<!-- css 양식 include -->
<%@include file="/WEB-INF/views/common/header.jsp"%>

<!-- css 불러오기 -->
<link rel="stylesheet" href="css/productDetail.css">

<script src="http://code.jquery.com/jquery-latest.js"></script>

<!--구매하기 버튼, 장바구니 ajax -->
<script src="./js/bucket.js"></script>


</head>


<body>
	<h1 align="center">상품정보</h1>


	<div class="container_main">
		<div class="container_left">
			<!-- 이미지 경로 불러오기 -->
			<img alt="상품이미지" src="./images/${product.pimage }"
				class="centered-image">
			<img alt="상품이미지" src="images/${product.pimage }" class="centered-image">
		</div>

		<div class="container_right">
			<div class="line_1"></div>

			<table class="table_product">
				<caption>${product.pname }</caption>
				<tr>
					<th>상품명</th>
					<td>${product.pname }</td>
				</tr>
				<tr>
					<th>상품고유코드</th>
					<td>${product.pid }</td>
				</tr>
				<tr>
					<th>상품가격</th>
					<td>${product.pprice }</td>
				</tr>
				<tr>
					<th>상품색상</th>
					<td>${product.pcolor }</td>
				</tr>
				<tr>
					<th>상품사이즈</th>
					<td>${product.psize }</td>
				</tr>
			</table>

			<div class="button-container">
				<button type="button" id="buy" class="button1">구매하기</button>
				<button type="button" id="bucket" class="button1">장바구니</button>
				
				
			</div>
		</div>
	</div>
	<!-- 메인컨테이너 끝 나중에 맨밑에 추가할것-->
	<!-- 오른쪽 컨테이너 끝 -->


	<div class="content" align="center">


		<br>
		<h1>이옷은 멋있고</h1>
		<br>
		<h1>이옷은 우종윤이꺼고</h1>
		<br>
		<h1>우종윤이 입었으니까 비싸고</h1>
		<br>
		<h1>비싸니까 환불/교한 안돼</h1>
		<br>
		<h1>잘 선택 해야돼!</h1>




	</div>
	<!-- 컨텐트 끝 -->



	<!-- 리뷰게시판 -->
	<div class="review">
		<div class="reivew_button">
			<table class="table_review" align="center" border="1">
				<caption>리뷰 게시판</caption>
				<tr align="center">
					<th>리뷰 번호</th>
					<th>아이디</th>
					<th>리뷰 게시글</th>
					<th>이름</th>
					<th>날짜</th>
					<th>별점</th>
				</tr>


				<tr onclick="location.href='productReviewSelect.do?rid=${review.rid }&pid=${review.pid}'">
					<td>${review.rid }</td>
					<td>${review.memail }</td>
					<td>${review.rcontent }</td>
					<td>${review.rwriter }</td>
					<td>${review.rreg }</td>
					<td>별점추가예정</td>
				</tr>


			</table>
		</div>
		<button type="button" class="button1"
			onclick="location.href='productReviewInsert.do?pid=3'">리뷰 작성</button>
	</div>

	<!-- 문의게시판 -->
	<div class="askboard">
		<div class="reivew_button">
			<table class="table_ask" align="center" border="1">
				<caption>문의 게시판</caption>
				<tr align="center">
					<th>문의 번호</th>
					<th>아이디</th>
					<th>문의 게시글</th>
					<th>이름</th>
					<th>날짜</th>
				</tr>


				<tr>
					<td>${review.rid }</td>
					<td>${review.memail }</td>
					<td>${review.rcontent }</td>
					<td>${review.rwriter }</td>
					<td>${review.rreg }</td>
				</tr>


			</table>
			<button type="button" class="button1"
				onclick="location.href='productReviewInsert.do'">리뷰 작성</button>
		</div>
	</div>

	<!-- css 양식 include -->
	<%@include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>