<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시판 상세페이지</title>
<!-- css 양식 include -->
<%-- <%@include file="/WEB-INF/views/common/header.jsp"%> --%>

<!-- css 불러오기 -->
<link rel="stylesheet" href="css/freeBoardDetail.css">
</head>

<body>
	<!-- 전체 div시작 -->
	<div class="div_freeBoardDetail">
		<table class="table_freeBoardDetail">
			
			<tr><td colspan="4">${detail.fTitle}</td></tr>
			
			<tr><td colspan="4"><pre>${detail.fContent}</pre></td></tr>
			<tr><td colspan="4">${detail.mEmail}</td></tr>
			<tr><td colspan="4">${detail.fReg}</td></tr>
			<tr>
				<td>조회수</td>
				<td>${detail.fReadCount}</td>
				<td>좋아요</td>
				<td>${detail.fLike}</td>
			</tr>
		</table>



		<!-- button div 끝-->
		<div class="div_boardform_button">
		<input type="button" class="boardform_button" value="수정"
		onClick="location.href='freeBoardDetail.do?fId=${detail.fId}&page=${page}&state=update'">
		<input type="button" class="boardform_button" value="삭제"
		onClick="location.href='freeBoardDetail.do?fId=${detail.fId}&page=${page}&state=delete'">
			<input type="button" class="boardform_button" value="목록"
				onClick="location.href='freeBoardList.do?page=${page}'">
		</div>
		<!-- button div 끝-->



		</form>
	</div>
	<!-- 전체 div끝 -->
</body>

<!-- css 양식 include -->
<%@include file="/WEB-INF/views/common/footer.jsp"%>
</html>