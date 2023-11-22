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

</head>

<body>
	<h1 align="center">상품정보</h1>
	<br>
	<br>






<div class="container1">
	<div class="container_left">





		<div align="left">
			<img alt="상품이미지" src="./images/gun3.jpg" class="centered-image">
			<!-- 이미지 경로 불러오기 -->

		</div>
	</div>

	<div class="container_right">
		<div class="line_1">
			<div class="content">
				<br>
				<br>
				<h1 align="center">상품이름</h1>
				<!--상품이름 불러오기  -->
				<br> <br> <br>

				<table class="productDetailPage">
					<tr>
						<td><h3>상품명</h3></td>
						<td>여기에 상품명 데이터를 표시할 부분</td>
					</tr>
					<tr>
						<td><h3>상품고유코드</h3></td>
						<td>상품고유코드 데이터를 표시할 부분</td>
					</tr>
					<tr>
						<td><h3>상품가격</h3></td>
						<td>여기에 상품가격 데이터를 표시할 부분</td>
					</tr>
					<tr>
						<td><h3>상품색상</h3></td>
						<td>여기에 상품색상 데이터를 표시할 부분</td>
					</tr>
					<tr>
						<td><h3>상품사이즈</h3></td>
						<td>여기에 상품사이즈 데이터를 표시할 부분</td>
					</tr>
					<tr>
						<td><h3>상품갯수</h3></td>
						<td>여기에 상품갯수 데이터를 표시할 부분</td>
					</tr>
				</table>
				<button type="button" onclick="">장바구니</button>
				<button type="button" onclick="">구매하기</button>
			</div>
		</div>
	</div>
</div>
<!-- 컨테이너 끝 -->







	</div>
	<!-- 리뷰게시판 -->
	<div class="reivew">
		<h3 align="center">리뷰 게시판 목록</h3>


		<table border="1" align="center">
			<tr align="center">
				<th><div align="center">리뷰 번호 1</div></th>
				<th><div align="center">리뷰 게시글</div></th>
				<th><div align="center">이름</div></th>
				<th><div align="center">날짜</div></th>
				<th><div align="center">별점</div></th>

			</tr>
			<tr>
				<td>반복문 쓰기</td>
				<td>ㅇㅅㅇ</td>
			</tr>

		</table>
		<button type="button" class="write-review-button" onclick="">리뷰작성</button>
	</div>

	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>

	<!-- Q&A 게시판 -->
	<div class="inquiry">
		<h3 align="center">문의 게시판 목록</h3>


		<table border="1" align="center">
			<tr align="center">
				<th><div align="center">문의 번호 1</div></th>
				<th><div align="center">문의 게시글</div></th>
				<th><div align="center">이름</div></th>
				<th><div align="center">날짜</div></th>
				<th><div align="center">별점</div></th>
				<!-- 실제 데이터를 가져와서 표시하거나 테스트용으로 임시 데이터를 넣으세요 -->
			</tr>
			<tr>
				<td>반복문 쓰기</td>
			</tr>

		</table>
		<button type="button" class="write-review-button" onclick="">문의작성</button>
	</div>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>



	<!-- css 양식 include -->
	<%@include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>