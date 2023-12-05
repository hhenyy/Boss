<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세 페이지</title>

<script>
    function changePage(newPage) {
        var cntPerPage = document.getElementById('cntPerPage').value;
        var pid = "${pid}"; // JSP 변수를 스크립트에 사용
        location.href = "./productDetail.do?nowPage=" + newPage + "&cntPerPage=" + cntPerPage + "&pid=" + pid;
    }
</script>

<script>
	function moveToCart() {
		 var quantity = document.getElementById('bucketCount').value;
		 window.location.href = 'cartFormMove.do?pid=${product.pid}&quantity=' + quantity;
	}
</script>

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
				class="centered-image"> <img alt="상품이미지"
				src="./images/${product.pimage }" class="centered-image">
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
				<tr>
					<!-- class="product_count" -->
					<th>상품수량</th>
					<td class="bucket_count"><input type="number" value="1"
						id="bucketCount" class="product_count">개</td>
				</tr>

			</table>
			<div class="button-container">
				<button type="button" id="buy" class="button1">구매하기</button>
				<button type="button" id="bucket" class="button1"
					onclick="moveToCart();">장바구니</button>


			</div>
		</div>
	</div>
	<!-- 메인컨테이너 끝 나중에 맨밑에 추가할것-->
	<!-- 오른쪽 컨테이너 끝 -->


	<div class="detail_content" align="center">

		<h1>${product.pcontent }</h1>
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
					<th>사진</th>
					<th>리뷰 게시글</th>
					<th>이름</th>
					<th>날짜</th>
					<th>별점</th>
				</tr>
				<c:set var="i" value="1"></c:set>
				<c:if test="${not empty reviewList}">
					<c:forEach var="review" items="${reviewList }" varStatus="loop">
						<tr
							onclick="location.href='productReviewSelect.do?rid=${review.rid}&pid=${review.pid}'">
							<td>${review.rid}</td>
							<td>${review.memail}</td>
							<c:if test="${review.rimage != null}">
								<td style="position: relative;"><img
									src="./images/${review.rimage }" width="50" height="50"
									class="toggle-image"> <span class="text-on-image">${o.PTEXT}</span>
							</c:if>
							<c:if test="${review.rimage == null}">
								<td>첨부 파일이 없습니다.</td>
							</c:if>
							<td>${review.rcontent}</td>
							<td>${review.rwriter}</td>
							<td>${review.rreg}</td>
							<td>별점추가예정</td>
						</tr>
					</c:forEach>
				</c:if>
				<c:if test="${empty reviewList}">
					<tr>
						<td colspan="7">상품 리뷰글이 없습니다.</td>
					</tr>
				</c:if>
			</table>
			<!-- 여기 추가함 -->
			<div class="detail_page">
				<c:if test="${pp.startPage != 1 }">
					<a style="text-decoration: none; color: black"
						href="./productDetail.do?nowPage=${pp.startPage - 1 }&cntPerPage=${pp.cntPerPage}&pid=${pid}">
						< </a>
				</c:if>
				<c:forEach begin="${pp.startPage }" end="${pp.endPage }" var="p">
					<c:choose>
						<c:when test="${p == pp.nowPage }">
							<b>${p }</b>
						</c:when>
						<c:when test="${p != pp.nowPage }">
							<a style="text-decoration: none; color: black"
								href="./productDetail.do?nowPage=${p }&cntPerPage=${pp.cntPerPage}&pid=${pid}">
								${p }</a>
						</c:when>
					</c:choose>
				</c:forEach>
				<c:if test="${pp.endPage != pp.lastPage}">
					<a style="text-decoration: none; color: black"
						href="./productDetail.do?nowPage=${pp.endPage + 1 }&cntPerPage=${pp.cntPerPage}&pid=${pid}">
						> </a>
				</c:if>
			</div>
			<script>
			function 
			
			
			
			</script>


		</div>
		<!-- 비로그인일 때 리뷰 작성 버튼이 안보임 -->
		<c:if test="${member != null }">
			<button type="button" class="button1"
				onclick="location.href='productReviewInsertForm.do?pid=${pid}'">리뷰
				작성</button>
		</c:if>


	</div>

	<!-- 문의게시판 -->
	<div class="askBoard">
		<div class="reivew_button">
			<table class="table_ask" align="center" border="1">
				<caption>문의 게시판</caption>
				<tr align="center">
					<th>문의 번호</th>
					<th>이메일</th>
					<th>문의 게시글</th>
					<th>날짜</th>
				</tr>

				<c:set var="i" value="1"></c:set>
				<c:if test="${not empty asklist}">
					<c:forEach var="askboard" items="${asklist }" varStatus="loop">
						<tr onclick="location.href='productAskBoardSelectForm.do?askid=${askboard.askid}&pid=${askboard.pid}'">
							<td>${askboard.askid }</td>
							<td>${askboard.memail}</td>
							<td>${askboard.askcontent }</td>
							<td>${askboard.askreg }</td>
						</tr>
					</c:forEach>
				</c:if>
				<c:if test="${empty asklist}">
					<tr>
						<td colspan="4">상품 문의글이 없습니다.</td>
					</tr>
				</c:if>

			</table>
			<button type="button" class="askbutton1" onclick="location.href='productAskBoardInsertForm.do?pid=${pid}'">문의
				작성</button>
		</div>
	</div>

	<!-- css 양식 include -->
	<%@include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>