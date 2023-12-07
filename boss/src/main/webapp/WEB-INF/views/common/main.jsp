<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<!--
	Phantom by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
<head>
<title>Phantom by HTML5 UP</title>
<!--header css 양식 include -->
<%--  <%@include file="/WEB-INF/views/common/header.jsp"%> --%>

<meta charset="utf-8" />

<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">

<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/main.css" />

<!-- buttons_master css -->
<link rel="stylesheet" href="assets/css/mainhs.css" />
<!-- <link rel="stylesheet" href="assets/css/mainhsSlide.css" /> -->


<noscript>
	<link rel="stylesheet" href="assets/css/noscript.css" />
</noscript>


<!-- 슬라이드 부트스트랩 -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
	integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
	integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
	crossorigin="anonymous"></script>
<style>
.carousel-inner>.carousel-item>img {
	width: 640px;
	height: 720px;
}
</style>

<!-- 슬라이드 -->
<script>
	$('.carousel').carousel({
		interval : 2000
	})
</script>

<!-- 검색창 -->
<script>
	function enterkey() {
		var s = document.getElementById("search").value;
		if (window.event.keyCode == 13) {
			// 엔터키가 눌렸을 때
			location.href = "allSearch.do?keyword=" + s;
		}
	}
</script>

</head>
 <%@include file="/WEB-INF/views/common/chatbot.jsp"%>
<body class="is-preload">

	<!-- Wrapper -->
	<div id="wrapper">

		<!-- Header -->
		<header id="header">
			<div class="inner">

				<!-- 쇼핑몰 로고 & 상단 아이콘 불러오기 -->
				<%@include file="header.jsp"%>

				<!--1. 회원 or 비회원 페이지 -->
				<c:if
					test="${!empty sessionScope.member && member.mEmail ne 'master' || empty sessionScope.member}">
					<div class="category-link" align="center">
						<a href="category.do?newCid=맨투맨"
							style="font-size: 20px; font-weight: bold; margin-right: 10px; text-decoration: none"
							style="text-decoration: none">OUTER</a> <a
							href="category.do?newCid=맨투맨"
							style="font-size: 20px; font-weight: bold; margin-right: 10px; text-decoration: none"
							style="text-decoration: none">KNIT</a> <a
							href="category.do?newCid=맨투맨"
							style="font-size: 20px; font-weight: bold; margin-right: 10px; text-decoration: none">TOP</a>
						<a href="category.do?newCid=맨투맨"
							style="font-size: 20px; font-weight: bold; margin-right: 10px; text-decoration: none">BOTTOM</a>
						<a href="category.do?newCid=맨투맨"
							style="font-size: 20px; font-weight: bold; margin-right: 10px; text-decoration: none">SHIRT</a>
						<a href="category.do?newCid=맨투맨"
							style="font-size: 20px; font-weight: bold; margin-right: 10px; text-decoration: none">SHOES</a>
						<a href="category.do?newCid=맨투맨"
							style="font-size: 20px; font-weight: bold; margin-right: 10px; text-decoration: none">ACC</a>
					</div>
					<div align="center" width="30px" height="100px">
						<input type="text" maxlength="30"
							placeholder="검색어를 입력하세요. 연말준비는 ? BOSS에서 !" id="search"
							onkeyup="enterkey()">
					</div>
					<br>

					<!---------------------- Nav --------------------->
					<nav>
						<ul>
							<li><a href="#menu">Menu</a></li>
						</ul>
					</nav>
			</div>
		</header>
		<!-- Menu -->
		<nav id="menu">
			<h2>Menu</h2>
			<ul>
				<li><a href="category.do?newCid=맨투맨" style="text-decoration: none">카테고리</a></li><br>
				<li><a href="freeBoardList.do" style="text-decoration: none">커뮤니티</a></li><br>
				<li><a href="masterNotice.do" style="text-decoration: none">공지사항</a></li><br>
				<li><a href="elements.do" style="text-decoration: none">Elements</a></li>
				<br>
			</ul>
		</nav>
		<!---------------------- Nav ------------------->

		<!-- Main -->
		<div id="main">
			<div class="inner">
				<header align="center">

					<!-- 					<h1> -->
					<!-- 						<b>시선이 교차하는 순간</b> -->
					<!-- 					</h1> -->

					<!-- 					<h4> -->
					<!-- 						자연스럽고 특별한 아름다움은 한 순간에 시선과 마음을 사로잡습니다<br> -->
					<!-- 					눈과 마음을 열어보세요</h4> -->
					<!-- 					<br> -->

					<!----------- 슬라이드 부트스트랩 시작-------------->
					<div class="container"></div>
					<div id="demo" class="carousel slide" data-ride="carousel">

						<div class="carousel-inner">
							<!-- 슬라이드 쇼 -->
							<div class="carousel-item active">
								<!--가로-->
								<img class="d-block w-100" src="images/slide1.png"
									alt="First slide">
							</div>
							<div class="carousel-item">
								<img class="d-block w-100" src="images/slide2.png"
									alt="Second slide">
								<div class="carousel-caption d-none d-md-block">
									<h5>BOSSMALL</h5>
									<p>BOSSMALLBOSSMALL</p>
								</div>
							</div>
							<div class="carousel-item">
								<img class="d-block w-100" src="images/slide3.png"
									alt="Third slide">
							</div>
							<!-- / 슬라이드 쇼 끝 -->

							<!-- 왼쪽 오른쪽 화살표 버튼 -->
							<a class="carousel-control-prev" href="#demo" data-slide="prev">
								<span class="carousel-control-prev-icon" aria-hidden="true"></span>
								<!-- <span>Previous</span> -->
							</a> <a class="carousel-control-next" href="#demo" data-slide="next">
								<span class="carousel-control-next-icon" aria-hidden="true"></span>
								<!-- <span>Next</span> -->
							</a>
							<!-- / 화살표 버튼 끝 -->

							<!-- 인디케이터 -->
							<ul class="carousel-indicators">
								<li data-target="#demo" data-slide-to="0" class="active"></li>
								<!--0번부터시작-->
								<li data-target="#demo" data-slide-to="1"></li>
								<li data-target="#demo" data-slide-to="2"></li>
							</ul>
							<!-- 인디케이터 끝 -->
						</div>
						<!----------- 슬라이드 부트스트랩 끝-------------->


						<br>
						<p align="left">
							남성을 위한 수트<br> 포멀함과 세심한 디자인의 기능성이 만난 남성 수트를 소개합니다.<br>
							포멀 & 캐주얼 스타일을 선보이는 우아한 컬렉션에서 소개하는 BO$$만의 실루엣을 발견해보세요.<br>
							슬림핏과 가벼운 여름 스타일부터 턱시도와 스리피스 디자인까지, 세심한 스타일링에 중점을 둔 수트 컬렉션을 지금
							확인해보세요.
						</p>
						<br>
						<h3 text-align="center">WHAT'S NEW</h3>
				</header>
				<section class="tiles">
					<article class="style1">
						<span class="image"> <c:if test="${block1 == 1 }">
								<img src="images/${mainImageList1.mainimage} " alt=""
									height="450" />
							</c:if>

						</span> <a href="productDetail.do?pid=${mainImageList1.pid }">
							<h2>${mainImageList1.mainpname }</h2>
							<div class="content">
								<p>${mainImageList1.maincontent}</p>
							</div>
						</a>
						<div class="buttons_master"></div>
					</article>
					<article class="style1">
						<span class="image"> <c:if test="${block2 == 2 }">
								<img src="images/${mainImageList2.mainimage} " alt=""
									height="450" />
							</c:if>

						</span> <a href="productDetail.do?pid=${mainImageList2.pid }">
							<h2>${mainImageList2.mainpname }</h2>
							<div class="content">
								<p>${mainImageList2.maincontent}</p>
							</div>
						</a>
						<div class="buttons_master"></div>
					</article>
					<article class="style1">
						<span class="image"> <c:if test="${block3 == 3 }">
								<img src="images/${mainImageList3.mainimage} " alt=""
									height="450" />
							</c:if>

						</span> <a href="productDetail.do?pid=${mainImageList3.pid }">
							<h2>${mainImageList3.mainpname }</h2>
							<div class="content">
								<p>${mainImageList3.maincontent}</p>
							</div>
						</a>
						<div class="buttons_master"></div>
					</article>
					<!-- <br><h3 text-align="center">WEEKLY BEST</h3><br> -->
					<article class="style1">
						<span class="image"> <c:if test="${block4 == 4 }">
								<img src="images/${mainImageList4.mainimage} " alt=""
									height="450" />
							</c:if>

						</span> <a href="productDetail.do?pid=${mainImageList4.pid }">
							<h2>${mainImageList4.mainpname }</h2>
							<div class="content">
								<p>${mainImageList4.maincontent}</p>
							</div>
						</a>
						<div class="buttons_master"></div>
					</article>
					<article class="style1">
						<span class="image"> <c:if test="${block5 == 5 }">
								<img src="images/${mainImageList5.mainimage} " alt=""
									height="450" />
							</c:if>

						</span> <a href="productDetail.do?pid=${mainImageList5.pid }">
							<h2>${mainImageList5.mainpname }</h2>
							<div class="content">
								<p>${mainImageList5.maincontent}</p>
							</div>
						</a>
						<div class="buttons_master"></div>
					</article>
					<article class="style1">
						<span class="image"> <c:if test="${block6 == 6 }">
								<img src="images/${mainImageList6.mainimage} " alt=""
									height="450" />
							</c:if>

						</span> <a href="productDetail.do?pid=${mainImageList6.pid }">
							<h2>${mainImageList6.mainpname }</h2>
							<div class="content">
								<p>${mainImageList6.maincontent}</p>
							</div>
						</a>
						<div class="buttons_master"></div>
					</article>
					<!-- 에러시작 -->
					<article class="style1">
						<span class="image"> <c:if test="${block7 == 7 }">
								<img src="images/${mainImageList7.mainimage} " alt=""
									height="450" />
							</c:if>

						</span> <a href="productDetail.do?pid=${mainImageList7.pid }">
							<h2>${mainImageList7.mainpname }</h2>
							<div class="content">
								<p>${mainImageList7.maincontent}</p>
							</div>
						</a>
						<div class="buttons_master"></div>
					</article>
					<article class="style1">
						<span class="image"> <c:if test="${block8 == 8 }">
								<img src="images/${mainImageList8.mainimage} " alt=""
									height="450" />
							</c:if>

						</span> <a href="productDetail.do?pid=${mainImageList8.pid }">
							<h2>${mainImageList8.mainpname }</h2>
							<div class="content">
								<p>${mainImageList8.maincontent}</p>
							</div>
						</a>
						<div class="buttons_master"></div>
					</article>
					<article class="style1">
						<span class="image"> <c:if test="${block9 == 9 }">
								<img src="images/${mainImageList9.mainimage} " alt=""
									height="450" />
							</c:if>

						</span> <a href="productDetail.do?pid=${mainImageList9.pid }">
							<h2>${mainImageList9.mainpname }</h2>
							<div class="content">
								<p>${mainImageList9.maincontent}</p>
							</div>
						</a>
						<div class="buttons_master"></div>
					</article>
				</section>
			</div>
		</div>
		</c:if>




		<!--2.관리자페이지  -->
		<c:if
			test="${!empty sessionScope.member && member.mEmail eq 'master'}">
			<div class="category-link" align="center">
				<a href="category.do?newCid=맨투맨"
					style="font-size: 20px; font-weight: bold; margin-right: 10px; text-decoration: none">OUTER</a>
				<a href="category.do?newCid=맨투맨"
					style="font-size: 20px; font-weight: bold; margin-right: 10px; text-decoration: none">KNIT</a>
				<a href="category.do?newCid=맨투맨"
					style="font-size: 20px; font-weight: bold; margin-right: 10px; text-decoration: none">TOP</a>
				<a href="category.do?newCid=맨투맨"
					style="font-size: 20px; font-weight: bold; margin-right: 10px; text-decoration: none">BOTTOM</a>
				<a href="category.do?newCid=맨투맨"
					style="font-size: 20px; font-weight: bold; margin-right: 10px; text-decoration: none">SHIRT</a>
				<a href="category.do?newCid=맨투맨"
					style="font-size: 20px; font-weight: bold; margin-right: 10px; text-decoration: none">SHOES</a>
				<a href="category.do?newCid=맨투맨"
					style="font-size: 20px; font-weight: bold; margin-right: 10px; text-decoration: none">ACC</a>
			</div>

			<div align="center" width="100px" height="100px">
				<input type="text" maxlength="50" placeholder="검색어를 입력하세요."><br>
			</div>

			<!-- Nav -->
			<nav>
				<ul>
					<li><a href="#menu">Menu</a></li>
				</ul>
			</nav>
	</div>
	</header>

	<!-- Menu -->
	<nav id="menu">
		<cation>Menu</cation>>
		<ul>
			<li><a href="category.do" style="text-decoration: none">카테고리</a></li><br>
			<li><a href="freeBoardList.do" style="text-decoration: none">커뮤니티</a></li><br>
			<li><a href="masterNotice.do" style="text-decoration: none">공지사항</a></li><br>
			<li><a href="elements.do" style="text-decoration: none">Elements</a></li><br>
			<input type="button" value="관리자페이지"
				onclick="location.href='masterMain.do'">
			<br>
		</ul>
	</nav>

	<!-- Main -->
	<div id="main">
		<div class="inner">
			<header align="center">

				<!----------- 슬라이드 부트스트랩 시작-------------->
				<div class="container"></div>
				<div id="demo" class="carousel slide" data-ride="carousel">

					<div class="carousel-inner">
						<!-- 슬라이드 쇼 -->
						<div class="carousel-item active">
							<!--가로-->
							<img class="d-block w-100" src="images/slide1.png"
								alt="First slide">
							<div class="carousel-caption d-none d-md-block">
								<h5>TEST</h5>
								<p>testtesttest</p>
							</div>
						</div>
						<div class="carousel-item">
							<img class="d-block w-100" src="images/slide2.png"
								alt="Second slide">
						</div>
						<div class="carousel-item">
							<img class="d-block w-100" src="images/slide3.png"
								alt="Third slide">
						</div>

						<!-- / 슬라이드 쇼 끝 -->

						<!-- 왼쪽 오른쪽 화살표 버튼 -->
						<a class="carousel-control-prev" href="#demo" data-slide="prev">
							<span class="carousel-control-prev-icon" aria-hidden="true"></span>
							<!-- <span>Previous</span> -->
						</a> <a class="carousel-control-next" href="#demo" data-slide="next">
							<span class="carousel-control-next-icon" aria-hidden="true"></span>
							<!-- <span>Next</span> -->
						</a>
						<!-- / 화살표 버튼 끝 -->

						<!-- 인디케이터 -->
						<ul class="carousel-indicators">
							<li data-target="#demo" data-slide-to="0" class="active"></li>
							<!--0번부터시작-->
							<li data-target="#demo" data-slide-to="1"></li>
							<li data-target="#demo" data-slide-to="2"></li>
						</ul>
						<!-- 인디케이터 끝 -->
					</div>
					<!----------- 슬라이드 부트스트랩 끝-------------->

					<br>
					<p align="left">
						남성을 위한 수트<br> 포멀함과 세심한 디자인의 기능성이 만난 남성 수트를 소개합니다.<br> 포멀
						& 캐주얼 스타일을 선보이는 우아한 컬렉션에서 소개하는 BO$$만의 실루엣을 발견해보세요.<br> 슬림핏과
						가벼운 여름 스타일부터 턱시도와 스리피스 디자인까지, 세심한 스타일링에 중점을 둔 수트 컬렉션을 지금 확인해보세요.
					</p>
					<br>
					<h3 text-align="center">WEEKLY BEST</h3>
			</header>
			<section class="tiles">
				<article class="style1">
					<span class="image"> <c:if test="${block1 == 1 }">
							<img src="images/${mainImageList1.mainimage} " alt=""
								height="450" />
						</c:if>

					</span> <a href="productDetail.do?pid=${mainImageList1.pid }">
						<h2>${mainImageList1.mainpname }</h2>
						<div class="content">
							<p>${mainImageList1.maincontent}</p>
						</div>
					</a>
					<div class="buttons_master">
						<button class="edit-button"
							onClick="location.href='masterProductList.do?type=change&block=1&id=${mainImageList1.pid}';">이미지
							변경</button>
					</div>
				</article>
				<article class="style1">
					<span class="image"> <c:if test="${block2 == 2 }">
							<img src="images/${mainImageList2.mainimage} " alt=""
								height="450" />
						</c:if>

					</span> <a href="productDetail.do?pid=${mainImageList2.pid }">
						<h2>${mainImageList2.mainpname }</h2>
						<div class="content">
							<p>${mainImageList2.maincontent}</p>
						</div>
					</a>
					<div class="buttons_master">
						<button class="edit-button"
							onClick="location.href='masterProductList.do?type=change&block=2';">이미지
							변경</button>
					</div>
				</article>
				<article class="style2">
					<span class="image"> <c:if test="${block3 == 3 }">
							<img src="images/${mainImageList3.mainimage} " alt=""
								height="450" />
						</c:if>

					</span> <a href="productDetail.do?pid=${mainImageList3.pid }">
						<h2>${mainImageList3.mainpname }</h2>
						<div class="content">
							<p>${mainImageList3.maincontent}</p>
						</div>
					</a>
					<div class="buttons_master">
						<button class="edit-button"
							onClick="location.href='masterProductList.do?type=change&block=3';">이미지
							변경</button>
					</div>
				</article>
				<article class="style3">
					<span class="image"> <c:if test="${block4 == 4 }">
							<img src="images/${mainImageList4.mainimage} " alt=""
								height="450" />
						</c:if>

					</span> <a href="productDetail.do?pid=${mainImageList4.pid }">
						<h2>${mainImageList4.mainpname }</h2>
						<div class="content">
							<p>${mainImageList4.maincontent}</p>
						</div>
					</a>
					<div class="buttons_master">
						<button class="edit-button"
							onClick="location.href='masterProductList.do?type=change&block=4';">이미지
							변경</button>
					</div>
				</article>
				<article class="style4">
					<span class="image"> <c:if test="${block5 == 5 }">
							<img src="images/${mainImageList5.mainimage} " alt=""
								height="450" />
						</c:if>

					</span> <a href="productDetail.do?pid=${mainImageList5.pid }">
						<h2>${mainImageList5.mainpname }</h2>
						<div class="content">
							<p>${mainImageList5.maincontent}</p>
						</div>
					</a>
					<div class="buttons_master">
						<button class="edit-button"
							onClick="location.href='masterProductList.do?type=change&block=5';">이미지
							변경</button>
					</div>
				</article>
				<article class="style5">
					<span class="image"> <c:if test="${block6 == 6 }">
							<img src="images/${mainImageList6.mainimage} " alt=""
								height="450" />
						</c:if>

					</span> <a href="productDetail.do?pid=${mainImageList6.pid }">
						<h2>${mainImageList6.mainpname }</h2>
						<div class="content">
							<p>${mainImageList6.maincontent}</p>
						</div>
					</a>
					<div class="buttons_master">
						<button class="edit-button"
							onClick="location.href='masterProductList.do?type=change&block=6';">이미지
							변경</button>
					</div>
				</article>
				<article class="style6">
					<span class="image"> <c:if test="${block7 ==  7}">
							<img src="images/${mainImageList7.mainimage} " alt=""
								height="450" />
						</c:if>

					</span> <a href="productDetail.do?pid=${mainImageList7.pid }">
						<h2>${mainImageList7.mainpname }</h2>
						<div class="content">
							<p>${mainImageList7.maincontent}</p>
						</div>
					</a>
					<div class="buttons_master">
						<button class="edit-button"
							onClick="location.href='masterProductList.do?type=change&block=7';">이미지
							변경</button>
					</div>
				</article>
				<article class="style1">
					<span class="image"> <c:if test="${block8 == 8 }">
							<img src="images/${mainImageList8.mainimage} " alt=""
								height="450" />
						</c:if>

					</span> <a href="productDetail.do?pid=${mainImageList8.pid }">
						<h2>${mainImageList8.mainpname }</h2>
						<div class="content">
							<p>${mainImageList8.maincontent}</p>
						</div>
					</a>
					<div class="buttons_master">
						<button class="edit-button"
							onClick="location.href='masterProductList.do?type=change&block=8';">이미지
							변경</button>
					</div>
				</article>
				<article class="style2">
					<span class="image"> <c:if test="${block9 == 9 }">
							<img src="images/${mainImageList9.mainimage} " alt=""
								height="450" />
						</c:if>

					</span> <a href="productDetail.do?pid=${mainImageList9.pid }">
						<h2>${mainImageList9.mainpname }</h2>
						<div class="content">
							<p>${mainImageList9.maincontent}</p>
						</div>
					</a>
					<div class="buttons_master">
						<button class="edit-button"
							onClick="location.href='masterProductList.do?type=change&block=9';">이미지
							변경</button>
					</div>
				</article>
			</section>
		</div>
	</div>
	</c:if>








	<!-- Footer -->
	<footer id="footer">
		<div class="inner">
			<section>
				<h2>Get in touch</h2>
				<form method="post" action="#">
					<div class="fields">
						<div class="field half">
							<input type="text" name="name" id="name" placeholder="Name" />
						</div>
						<div class="field half">
							<input type="email" name="email" id="email" placeholder="Email" />
						</div>
						<div class="field">
							<textarea name="message" id="message" placeholder="Message"></textarea>
						</div>
					</div>
					<ul class="actions">
						<li><input type="submit" value="Send" class="primary" /></li>
					</ul>
				</form>
			</section>
			<section>
				<h2>Follow</h2>
				<ul class="icons">
					<li><a href="#" class="icon brands style2 fa-twitter"><span
							class="label">Twitter</span></a></li>
					<li><a href="#" class="icon brands style2 fa-facebook-f"><span
							class="label">Facebook</span></a></li>
					<li><a href="#" class="icon brands style2 fa-instagram"><span
							class="label">Instagram</span></a></li>
					<li><a href="#" class="icon brands style2 fa-dribbble"><span
							class="label">Dribbble</span></a></li>
					<li><a href="#" class="icon brands style2 fa-github"><span
							class="label">GitHub</span></a></li>
					<li><a href="#" class="icon brands style2 fa-500px"><span
							class="label">500px</span></a></li>
					<li><a href="#" class="icon solid style2 fa-phone"><span
							class="label">Phone</span></a></li>
					<li><a href="#" class="icon solid style2 fa-envelope"><span
							class="label">Email</span></a></li>
				</ul>
			</section>
			<ul class="copyright">
				<li>&copy; Untitled. All rights reserved</li>
				<li>Design: <a href="http://html5up.net">HTML5 UP</a></li>
			</ul>
		</div>
	</footer>

	</div>
	<%@ include file="./footer.jsp"%>
	<!-- Scripts -->
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/browser.min.js"></script>
	<script src="assets/js/breakpoints.min.js"></script>
	<script src="assets/js/util.js"></script>
	<script src="assets/js/main.js"></script>

</body>
</html>