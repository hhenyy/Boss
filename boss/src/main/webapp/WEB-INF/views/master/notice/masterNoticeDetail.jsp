<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
			<td style="color: black;"><fmt:formatDate
												pattern="yyyy-MM-dd hh:mm" value="${masterNoticeDetail.mnReg}" /></td>
			<th>조회수</th>
			<td style="color: black;">${masterNoticeDetail.mnReadCount }</td>
		</tr>
		<tr>
			<th>제목</th>
			<td colspan="3" style="color: black;">
				${masterNoticeDetail.mnTitle }
			</td>
		</tr>


		<tr>
			<td colspan="4" style="color: black;">${masterNoticeDetail.mnContent }</td>
		</tr>

		<c:if test="${masterNoticeDetail.mnOriFile != null }">
               <td colspan="4">
               	<img src="C:\\bossRepository\\boss\\src\\main\\webapp\\images\\${masterNoticeDetail.mnOriFile}">
               </td>
            </c:if>

	</table>
	<button type="button" class="review_button1" onclick="location.href='masterNotice.do'">목록으로</button>
	
	<!-- css 양식 include -->
	<%@include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>