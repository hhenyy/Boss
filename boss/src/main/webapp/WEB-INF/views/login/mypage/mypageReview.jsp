<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내가 쓴 리뷰</title>

<link rel="stylesheet" href="css/sidebar.css">

</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp"%>

	<!-- 세션이 없을때 마이페이지 -->
	<c:if test="${member == null }">
		<script>
			alert("로그인이 되어 있지 않습니다.");
			location.href = "NaverLogin.do";
		</script>
	</c:if>

	<c:if test="${member != null }">
		<ul>
			<li><a class="mypage_sidebar" href='#'>메뉴</a></li>
			<li><a href='mypage.do'>내 주문내역</a></li>
			<li><a href='#'>장바구니</a></li>
			<li><a href='mypageQnA.do'>내가 쓴 QnA</a></li>
			<li><a href='mypageReview.do'>내가 쓴 Review</a></li>
		</ul>

		<c:if test="${not empty rlist}">
			<div class="content">
				<h1>내가 쓴 리뷰</h1>
				<div class="container_review">
					<table border="1" class="reviewtable">
						<tr>
							<th>이미지</th>
							<th>리뷰 제목</th>
							<th>내용</th>
							<th>작성일</th>
						</tr>
						<c:forEach items="${rlist }" varStatus="loop" var="review">
							<td style="position: relative;"><img
								src="./images/${review.rimage }" width="50" height="50"
								class="toggle-image"> <span class="text-on-image">${o.PTEXT}</span>
							</td>
							<td>${review.rtitle }</td>
							<td>${review.rcontent }</td>
							<td>${review.rreg }</td>
						</c:forEach>
					</table>
				</div>
				<!-- container_review end -->
			</div>
		</c:if>

		<c:if test="${empty rlist}">
			<div class="content_noreview">
				<h1>작성한 리뷰글이 없습니다.</h1>
			</div>
		</c:if>
	</c:if>
	<!-- 멤버 세션 조건문 -->
</body>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</html>