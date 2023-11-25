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
	<div class="container">
		<table>
			<caption>회원 개인정보</caption>
			<tr>
				<th>ID</th>
				<th>이름</th>
				<th>핸드폰</th>
				<th>우편번호</th>
				<th>주소</th>
				<th>회원등급</th>
				<th>가입일</th>
				<th>삭제여부</th>
				<th>관리</th>
			</tr>
			<tr>
				<td>${member.mEmail}</td>
				<td>${member.mName}</td>
				<td>${member.mPhone}</td>
				<td>${member.mPost}</td>
				<td>${member.mAddress}</td>
				<td>${member.mGrade}</td>
				<td>${member.mReg}</td>
				<td>${member.mDrop}</td>
				<td><button type="button"
						onclick="location.href='masterMemberUpdateForm.do?id=${member.mEmail}' ">수정</button>
					<button type="button"
						onclick="location.href='masterMemberDelete.do?id=${member.mEmail}' ">삭제</button></td>
			</tr>
		</table>
	</div>
	<%@ include file="../../common/footer.jsp"%>
</body>
</html>