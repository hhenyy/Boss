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
<title>Insert title here</title>


</head>
<body>

	<%@ include file="../common/masterNav.jsp"%>
	<form method="post" action="masterReviewDelete.do">
		<div class="container">
			<h1 class="h1_caption">리뷰 상세정보</h1>

			<table>
				<tr>
					<th>ID</th>
					<th>수령인</th>
					<th>휴대폰</th>
					<th>우편번호</th>
					<th>주소</th>
					<th>총금액</th>
					<th>배송비</th>
					<th>메시지</th>
					<th>주문일</th>
					<th>관리</th>
				</tr>
				<tr>
					<td>${review.rid}</td>
					<td>${review.memail}</td>
					<td>${review.pid}</td>
					<td>${review.rwriter}</td>
					<td>${review.rtitle}</td>
					<td><input type="text" value="${review.rcontent}"
						readonly="readonly"></td>

					<td><img src="images/${review.rimage}" width="50" height="50">
					<td>${review.rreg}</td>
					<td>${review.rreadcount}</td>
					<td>${review.rdrop}</td>
					<td>
						<button type="button"
							onclick="location.href='masterReviewUpdateForm.do?rid=${review.rid}'">수정</button>
						<button type="button"
							onclick="location.href='masterReviewDelete.do?rid=${review.rid}' ">삭제</button>
					</td>
				</tr>
			</table>

			<table class="fancy_table">
				<tr>
					<th>제목</th>
					<td>${review.rtitle}</td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<th>작성자</th>
					<td>${review.rwriter}</td>
					<th>작성일</th>
					<td>${review.rreg}</td>
					<th>조회수</th>
					<td>${review.rreadcount}회</td>
				</tr>
				<tr>
					<th>내용</th>
					<td colspan="5"><textarea readonly="readonly">${review.rcontent}</textarea></td>
				</tr>
			</table>
		</div>
	</form>
</body>
</html>