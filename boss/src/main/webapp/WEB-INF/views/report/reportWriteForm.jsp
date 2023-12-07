<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/report.css">


</head>
<body>
	<c:set var="now" value="<%=new java.util.Date()%>" />
	<fmt:formatDate var="date" value="${now}" type="date"
		pattern="yyyy-MM-dd (E) HH:mm:ss" />
	<form method="post" action="reportWrite.do"
		enctype="multipart/form-data">
		<div class="container_main">
			<h1>신고 작성 게시판</h1>
			<table class="table_main" border="1">
				<tr>
					<th>신고자명</th>
					<td><input type="text" name="reportname" value=""
						placeholder="신고할 ID를 입력하세요."></td>
					<th>작성일</th>
					<td><input readonly="readonly" type="text" value="${date }"></td>
				</tr>
				<tr>
					<th>제목</th>
					<td colspan="3"><input type="text" name="reporttitle" value=""
						placeholder="제목을 입력하세요."></td>
				</tr>
				<tr>
					<th>내용</th>
					<td colspan="3"><textarea name="reportcontent" cols="40"
							rows="10" placeholder="내용을 입력하세요."></textarea></td>
				</tr>
				<tr>
					<th>이미지</th>
					<td colspan="3"><input type="file" name="image1"></td>
				</tr>
				<tr>
					<th>신고자</th>
					<td colspan="3"><input readonly="readonly" type="text"
						name="memail" value="${member.mEmail }"></td>
				</tr>
			</table>
			<div class="button_row">
				<button type="submit">신고</button>
				<button type="reset">취소</button>
			</div>
		</div>
	</form>
</body>
</html>






