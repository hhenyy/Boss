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
<!-- css 양식 include -->
</head>
<body>
	<%@ include file="../common/masterNav.jsp"%>
	<table>
		<caption>관리자 페이지</caption>
		<tr>

			<th><button type="button"
					onclick="location.href='masterMemberList.do' ">회원관리</button></th>
			<th><button type="button"
					onclick="location.href='masterProductList.do' ">상품관리</button></th>
			<th><button type="button"
					onclick="location.href='masterQnaBoardList.do' ">Q&A관리</button></th>
			<th><button type="button"
					onclick="location.href='masterReviewList.do' ">리뷰관리</button></th>
			<th><button type="button"
					onclick="location.href='masterOrdersList.do' ">주문관리</button></th>
			<th><button type="button" onclick="location.href='masterQnaBoardList.do' ">Q&A관리</button></th>
			<th><button type="button" onclick="location.href='masterReviewList.do' ">리뷰관리</button></th>
			<th><button type="button" onclick="location.href='masterOrdersList.do' ">주문관리</button></th>
		</tr>

		<tr>
			<td></td>
			<td></td>
			<td></td>
		<tr>
			<td></td>
			<td></td>
			<td></td>
		<tr>
			<td></td>
			<td></td>
			<td></td>
		</tr>


	</table>
	</div>
</body>
</html>