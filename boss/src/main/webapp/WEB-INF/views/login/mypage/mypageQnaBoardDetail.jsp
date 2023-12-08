<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page import="java.lang.Math"%>
<%@page import="java.lang.Integer"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<!-- css 양식 include -->
<%@include file="/WEB-INF/views/common/header.jsp"%>
<!-- css 불러오기 -->
<link rel="stylesheet" href="css/productDetailReview.css">
<!-- css 불러오기 -->
<link rel="stylesheet" href="css/productDetail.css">
</head>
<body>

	<table class="review_select">



		<tr>
			<th>작성일</th>
			<td colspan="3" style="color: black;"><fmt:formatDate
												pattern="yyyy-MM-dd hh:mm" value="${board.qnareg}" /></td>
		</tr>
		<tr>
			<th>제목</th>
			<td colspan="3" style="color: black;">
				${board.qnatitle } 
			</td>
		</tr>


		<tr>
			<td colspan="4" style="color: black;">${board.qnacontent }</td>
		</tr>

		<c:if test="${board.qnaorifile != null }">
               <td colspan="4">
               	<img src="C:\\bossRepository\\boss\\src\\main\\webapp\\images\\${board.qnaoriFile}">
               </td>
            </c:if>

	</table>
	
	<c:if test="${board.qnayn == 'Y' }">
	<a href="mypageQnaBoardReplyDetail.do?qrid=${board.qrid}&qid=${board.qid}">답변 보기</a><br>
	</c:if>
	<button type="button" class="review_button1" 
	onclick="location.href='mypageQnA.do?nowPage=${Integer.toString(Math.floor((board.rnum-1)/pp.cntPerPage)+1)}'">목록으로</button>
	<!-- css 양식 include -->
	<%@include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>