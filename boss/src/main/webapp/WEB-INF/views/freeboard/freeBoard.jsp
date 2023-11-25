<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>커뮤니티</title>
<!-- css 양식 include -->
<%-- <%@include file="/WEB-INF/views/common/header.jsp"%> --%>

<iframe width="420" height="315"
	src="https://www.youtube.com/embed/7y1DWwz3Wfs"></iframe>
<iframe width="420" height="315"
	src="https://www.youtube.com/embed/t0xYMEYyjgY"></iframe>
<iframe width="420" height="315"
	src="https://www.youtube.com/embed/GicK9l0cPp0&t=3s"></iframe>
<iframe width="420" height="315"
	src="https://www.youtube.com/embed/ug0-BKfV0eQ"></iframe> 
</head>
<body>
	<div class="container" align="center">
		<h2>커뮤니티</h2>
		<table>
			<tr>
				<th>글번호</th>
				<th>이메일</th>
				<th colspan="5">제목</th>
				<th>조회수</th>
				<th>좋아요</th>
				<th>작성일</th>
			</tr>
			<tr>
				<td>글번호</td>
				<td>${member.mEmail}</td>
				<td colspan="5">제목</td>
				<td>조회수</td>
				<td>좋아요</td>
				<td>작성일</td>
			</tr>
		</table>

<!-- css 양식 include -->
 <%@include file="/WEB-INF/views/common/footer.jsp"%> 
</body>
</html>