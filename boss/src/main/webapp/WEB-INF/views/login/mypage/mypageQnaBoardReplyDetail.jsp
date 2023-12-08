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
<script>
	function back(){
		history.go(-1)
	}
</script>
</head>
<body>

	<table class="review_select">



		<tr>
			<th>작성일</th>
			<td colspan="3" style="color: black;"><fmt:formatDate
												pattern="yyyy-MM-dd hh:mm" value="${reply.qrreg}" /></td>
		</tr>
		<tr>
			<td colspan="4" style="color: black;">${reply.qrcontent }</td>
		</tr>
	</table>
	<% 
		int id = Integer.parseInt(request.getParameter("qrid"));
		if(id == 0){
	%>
	<a href="javascript:back()">이전으로</a><br>
	<%
		}
	%>
	
	<% 
		if(id != 0){
	%>
	<button type="button" class="review_button1" 
	onclick="location.href='mypageQnA.do?nowPage=${Integer.toString(Math.floor((reply.rnum-1)/pp.cntPerPage)+1)}'">목록으로</button>
	<%
		}
	%>
	
	
	
	<!-- css 양식 include -->
	<%@include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>