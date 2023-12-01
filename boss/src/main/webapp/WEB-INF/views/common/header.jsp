<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />

</head>

<body class=" ">
	<div>
		<a href="main.do" class="logo"> <span class=" "><img
				src="images/logo.png" alt="" style="width: 200px; height: 100px;"></span>
				<br>
			<div>JY & HB</div>
		</a>

	</div>
	<div style="text-align: right; padding-right: 30px;">
		<!--1. 비회원 페이지 -->
		<c:if test="${empty sessionScope.member}">
			<a href="NaverLogin.do"><img src="./images/login.png"
				style="text-decoration: none"></a>
			<a href="NaverLogin.do"><img src="./images/join.png"
				style="text-decoration: none"></a> 
				<br>
		</c:if>

		<!--2.관리자페이지  -->
		<c:if
			test="${!empty sessionScope.member && member.mEmail eq 'master'}">
			<a href="Logout.do" onclick="alert('로그아웃')"><img
				src="./images/logout.png" style="text-decoration: none"></a>
			<a href="mypage.do"><img src="./images/my.png"
				style="text-decoration: none"></a>
			<a href="cartFormMove.do"><img src="./images/cart.png"
				style="text-decoration: none"></a><br>
				${member.mName }님 환영합니다.
			<a href="productInsertForm.do" onclick="alert('상품등록')"
				style="text-decoration: none"><br>상품등록</a>
			<br>
			<input type="button" value="관리자페이지"
				onclick="location.href='masterMain.do'">
					<br>
		</c:if>
		
		<!-- 3.회원페이지 -->
	<c:if test="${!empty sessionScope.member && member.mEmail ne 'master'}">
					<a href="Logout.do" onclick="alert('로그아웃')"><img
			src="./images/logout.png" style="text-decoration: none"></a>
		<a href="mypage.do"><img src="./images/my.png"
			style="text-decoration: none"></a>
		<a href="productInsertForm.do"><img src="./images/cart.png"
			style="text-decoration: none"></a><br>
				${member.mName }님 환영합니다.
				<br>
		</c:if>
		</div>
		<div class="category-links" align="center">
		<a href="category.do?newCid=맨투맨" style="font-size: 20px; font-weight: bold; margin-right: 10px;">OUTER</a>
		<a href="category.do?newCid=맨투맨" style="font-size: 20px; font-weight: bold; margin-right: 10px;">KNIT</a>
		<a href="category.do?newCid=맨투맨" style="font-size: 20px; font-weight: bold; margin-right: 10px;">TOP</a>
		<a href="category.do?newCid=맨투맨" style="font-size: 20px; font-weight: bold; margin-right: 10px;">BOTTOM</a>
		<a href="category.do?newCid=맨투맨" style="font-size: 20px; font-weight: bold; margin-right: 10px;">SHIRT</a>
		<a href="category.do?newCid=맨투맨" style="font-size: 20px; font-weight: bold; margin-right: 10px;">SHOES</a>
		<a href="category.do?newCid=맨투맨" style="font-size: 20px; font-weight: bold; margin-right: 10px;">ACC</a>
	</div>
</body>
</html>