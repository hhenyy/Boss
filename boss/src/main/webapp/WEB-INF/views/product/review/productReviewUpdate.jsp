<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 페이지</title>
<!-- css 양식 include -->
<%@include file="/WEB-INF/views/common/header.jsp"%>
<!-- css 불러오기 -->
<link rel="stylesheet" href="css/productDetailReview.css">
<!-- css 불러오기 -->
<link rel="stylesheet" href="css/productDetail.css">
</head>
<body>

	<!-- 		<h1 class="bbswrite_title" align="center">리뷰 작성</h1> -->
	<form method="post" action="productDetail.do">
		<table class="review_update">
			<tr>

				<%-- 				${review.rimage} --%>
			</tr>


			<tr>
				<th>작성자</th>
				<td style="color:black;">${review.rwriter }</td>
			</tr>

			<tr>

			</tr>

			<tr>
				<th>글제목</th>
				<td><input name="rtitle" id="rtitle" size="40"
					class="input_box" value="${review.rtitle}"></input></td>
			</tr>
			<tr>
				<th>이미지</th>
				<td><img src="images/gun3.jpg" alt="#" width="500" hight="500"/></td>
			</tr>

			<tr>
				<th>글내용</th>
				<td><textarea name="rcontent" id="rcontent" rows="10" cols="50"
						class="input_box">${review.rcontent }</textarea></td>
			</tr>

		</table>

	<div class="button_select">
		<button type="submit" class="button1">수정완료</button>
		<button type="button" class="button1"
			onclick="history.go(-1)">취소</button>
	</div>
	</form>

	<!-- css 양식 include -->
	<%@include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>