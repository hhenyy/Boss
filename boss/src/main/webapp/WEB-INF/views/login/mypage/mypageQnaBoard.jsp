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

<script>
	function popup() {
		var url = "myPageQnaBoardInsertForm.do?memail=${memail}";
		var name = "QNA";
		var option = "width = 1000, height = 800, top = 100, left = 200, location = no"
		window.open(url, name, option);
	}
	//qna 상세보기
	function qna(a,b) {
		location.href="mypageQnaBoardDetail.do?rnum="+a+"&qid="+b;
	}
	
	//답변글 상세보기
	function reply(a,b) {
		location.href="mypageQnaBoardReplyDetail.do?rnum="+a+"&qrid="+b;
	}
</script>
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
			<li><a href='mypageAskBoard.do'>내가 물어본 상품문의</a></li>
			<li><a href='updateForm.do'>내 정보 수정</a></li>
			<li><a href='deleteForm.do'>회원 탈퇴</a></li>
		</ul>

		<c:if test="${not empty qlist}">
			<div class="content">
				<h1>내가 쓴 QnA</h1>
				<div class="container_orders">
					<table border="1" class="ordertable">
						<tr>
							<th>제목</th>
							<th>내용</th>
							<th>첨부파일</th>
							<th>작성일</th>
						</tr>
						<c:forEach items="${qlist }" varStatus="loop" var="QnaBoard">

							<c:if test="${QnaBoard.qnadrop !='Y' && QnaBoard.qrid ==0 }">
								<tr onclick="javascript:qna(${QnaBoard.rnum },${QnaBoard.qid })">
									<td>${QnaBoard.qnatitle }</td>
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
									<td><fmt:formatDate pattern="yyyy-MM-dd hh:mm"
											value="${QnaBoard.qnareg }"></fmt:formatDate></td>
								</tr>
							</c:if>
							<c:if test="${QnaBoard.qnadrop !='N' && QnaBoard.qrid ==0 }">
								<tr>
									<td colspan="4">삭제되었습니다</td>
								</tr>
							</c:if>
							<!-- 새로운부분. 댓글 출력 -->
							<c:if test="${QnaBoard.qrid !=0 && QnaBoard.qrdrop != 'Y'}">
								<tr onClick="javascript:reply(${QnaBoard.rnum },${QnaBoard.qrid })">
									<td>RE:${QnaBoard.qnatitle }</td>
									<td>${QnaBoard.qrcontent }</td>
									<td>첨부파일이 없습니다.</td>
									<td><fmt:formatDate pattern="yyyy-MM-dd hh:mm"
											value="${QnaBoard.qrreg }"></fmt:formatDate></td>
								</tr>
							</c:if>
							<c:if test="${QnaBoard.qrid !=0 && QnaBoard.qrdrop != 'N' }">
								<tr>
									<td colspan="4">삭제되었습니다</td>
								</tr>
							</c:if>
							<!-- 새로운부분 -->
						</c:forEach>
					</table>
		</c:if>

		<c:if test="${empty qlist}">
			<div class="content_noQnA">
				<h1>작성한 QnA글이 없습니다</h1>
			</div>
		</c:if>

		<!-- 글 입력 버튼 생성 -->
		<button type="button" class="putsub" onclick="javascript:popup()">문의작성</button>
		</div>
		<!-- container_review end -->
		</div>
	</c:if>

</body>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</html>