<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내가 쓴 QnA</title>

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
			<li><a href='cartFormMove.do'>장바구니</a></li>
			<li><a href='mypageQnA.do'>내가 쓴 QnA</a></li>
			<li><a href='mypageReview.do'>내가 쓴 Review</a></li>
		</ul>

		<c:if test="${not empty qlist}">
			<div class="content">
				<h1>내가 쓴 QnA</h1>
				<div class="container_QnaBoard">
					<table border="1">
						<tr>
							<th>제목</th>
							<th>내용</th>
							<th>첨부파일</th>
							<th>작성일</th>
						</tr>
						<c:forEach items="${qlist }" varStatus="loop" var="QnaBoard">
							<td>${QnaBoard.qnacontent }</td>
							<c:if test="${QnaBoard.qnaorifile != null }">
								<td style="position: relative;"><img
									src="./images/${QnaBoard.qnaorifile }" width="50" height="50"
									class="toggle-image"> <span class="text-on-image">${o.PTEXT}</span>
								</td>
							</c:if>
							<c:if test="${QnaBoard.qnaorifile == null }">
								<td>첨부파일이 없습니다.</td>
							</c:if>
							<td>${QnaBoard.qnatitle }</td>
							<td>${QnaBoard.qnareg }</td>
						</c:forEach>
					</table>
		</c:if>

		<c:if test="${empty qlist}">
			<div class="content_noQnA">
				<h1>작성한 QnA 글이 없습니다</h1>
			</div>
		</c:if>

		</div>
		<!-- container_review end -->
		</div>
	</c:if>

</body>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</html>