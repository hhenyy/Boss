<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 페이지</title>
<!-- css 불러오기 -->
<link rel="stylesheet" href="css/productDetailReview.css">
</head>
<body>
	<div id="main_review">
		<h1 class="bbswrite_title" align="center">리뷰 작성</h1>
		<form method="post" action="prInsert.do">
			<table id="reviewwrite">
				<tr>
					<th>작성자</th>
					<td></td>
				</tr>

				<tr>
					
				</tr>

				<tr>
					<th>글제목</th>
					<td><input name="rtitle" id="rtitle" size="40" class="input_box" /></td>
				</tr>
					<tr>
					<th>이미지</th>
					<td><input type="file" name="rimage" id="rimage" ></td>
					</tr>
					
				<tr>
					<th>글내용</th>
					<td><textarea name="rcontent" id="rcontent" rows="10" cols="50"
							class="input_box"></textarea></td>
				</tr>

			</table>

			<div id="rb">
				<input type="submit" value="등록" class="input_button" /> <input
					type="reset" value="취소" class="input_button" onclick="history.go(-1)" />
			</div>
		</form>
	</div>
</body>
</html>