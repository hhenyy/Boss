<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<!--
	Phantom by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
<head>
<title>Phantom by HTML5 UP</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/main.css" />
<link rel="stylesheet" href="assets/css/mainhs.css" />
<noscript>
	<link rel="stylesheet" href="assets/css/noscript.css" />
</noscript>
</head>

<body class="is-preload">

	<!-- Wrapper -->
	<div id="wrapper">
		<!-- Header -->
		<header id="header">
			<div class="inner">


				<!--1. 비회원 페이지 -->
				<c:if test="${empty sessionScope.member}">
					<a href="NaverLogin.do" style="text-decoration: none">로그인</a>
					<!-- --------------------------회원 비회원 관리자 각각 넣을 내용---------------------------------- -->
					<div align="center" width="100px" height="100px">
						<input type="text" maxlength="50" placeholder="검색어를 입력하세요."><br>
						<br> <br>

					</div>

					<!-- Logo -->
					<a href="main.do" class="logo"> <span class="symbol"><img
							src="images/logo.png" alt="" style="width: 200px; height: 100px;"></span><span
						class="title">JY & HB</span>
					</a>
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
			<h2>Menu</h2>
			<ul>
				<li><a href="index.do">JOIN</a></li>
				<li><a href="productDetail.do">LOGIN</a></li>
				<li><a href="mypage.do">MYPAGE</a></li>
				<li><a href="productDetail.do">CART</a></li>
				<li><a href="freeBoard.do">COMMUNITY</a></li>
				<li><a href="elements.do">Elements</a></li>
				<li><a href="category.do?cid=맨투맨">맨투맨</a></li>
				<br>
			</ul>
		</nav>

		<!-- Main -->
		<div id="main">
			<div class="inner">
				<header align="center">

					<h1>시선이 교차하는 순간</h1>

					<h3>
						자연스럽고 특별한 아름다움은 한 순간에 시선과 마음을 사로잡습니다<br>
					</h3>
					<h3>눈과 마음을 열어보세요</h3>
					<br>
					<p align="left">
						남성을 위한 수트<br> 포멀함과 세심한 디자인의 기능성이 만난 남성 수트를 소개합니다.<br> 포멀
						& 캐주얼 스타일을 선보이는 우아한 컬렉션에서 소개하는 BO$$만의 실루엣을 발견해보세요.<br> 슬림핏과
						가벼운 여름 스타일부터 턱시도와 스리피스 디자인까지, 세심한 스타일링에 중점을 둔 수트 컬렉션을 지금 확인해보세요.
					</p>
				</header>
				<section class="tiles">
					<article class="style1">
						<span class="image"> <img src="images/ch3.jpg" alt="" />
						</span> <a href="productDetail.do?pid=6">
							<h2>오쨍군</h2>
							<div class="content">
								<p>Sed nisl arcu euismod sit amet nisi lorem etiam dolor
									veroeros et feugiat.</p>
							</div>
						</a>

					</article>
					<article class="style2">
						<span class="image"> <img src="images/gun3.jpg" alt="" />
						</span> <a href="productDetail.do?pid=49">
							<h2>목도리</h2>
							<div class="content"></div>
						</a>
					</article>
					<article class="style3">
						<span class="image"> <img src="images/ch2.jpg" alt="" />
						</span> <a href="productDetail.do">
							<h2>Feugiat</h2>
							<div class="content">
								<p>Sed nisl arcu euismod sit amet nisi lorem etiam dolor
									veroeros et feugiat.</p>
							</div>
						</a>
					</article>
					<article class="style4">
						<span class="image"> <img src="images/gun4.jpg" alt="" />
						</span> <a href="productDetail.do">
							<h2>Tempus</h2>
							<div class="content">
								<p>Sed nisl arcu euismod sit amet nisi lorem etiam dolor
									veroeros et feugiat.</p>
							</div>
						</a>
					</article>
					<article class="style5">
						<span class="image"> <img src="images/e1.png" alt="" />
						</span> <a href="productDetail.do">
							<h2>Aliquam</h2>
							<div class="content">
								<p>Sed nisl arcu euismod sit amet nisi lorem etiam dolor
									veroeros et feugiat.</p>
							</div>
						</a>
					</article>
					<article class="style6">
						<span class="image"> <img src="images/e2.png" alt="" />
						</span> <a href="productDetail.do">
							<h2>Veroeros</h2>
							<div class="content">
								<p>Sed nisl arcu euismod sit amet nisi lorem etiam dolor
									veroeros et feugiat.</p>
							</div>
						</a>
					</article>
					<!-- 에러시작 -->
					<article class="style2">
						<span class="image"> <img src="images/e3.png" alt="" />
						</span> <a href="productDetail.do">
							<h2>Lorem</h2>
							<div class="content">
								<p>Sed nisl arcu euismod sit amet nisi lorem etiam dolor
									veroeros et feugiat.</p>
							</div>
						</a>
					</article>
					<article class="style3">
						<span class="image"> <img src="images/e4.png" alt="" />
						</span> <a href="productDetail.do">
							<h2>Dolor</h2>
							<div class="content">
								<p>Sed nisl arcu euismod sit amet nisi lorem etiam dolor
									veroeros et feugiat.</p>
							</div>
						</a>
					</article>
					<article class="style1">
						<span class="image"> <img src="images/gun2.jpg" alt="" />
						</span> <a href="productDetail.do">
							<h2>Nullam</h2>
							<div class="content">
								<p>Sed nisl arcu euismod sit amet nisi lorem etiam dolor
									veroeros et feugiat.</p>
							</div>
						</a>
					</article>
					<article class="style5">
						<span class="image"> <img src="images/gun2.jpg" alt="" />
						</span> <a href="productDetail.do">
							<h2>Ultricies</h2>
							<div class="content">
								<p>Sed nisl arcu euismod sit amet nisi lorem etiam dolor
									veroeros et feugiat.</p>
							</div>
						</a>
					</article>
					<article class="style2">
						<span class="image"> <img src="images/gun2.jpg" alt="" />
						</span> <a href="productDetail.do">
							<h2>Lorem</h2>
							<div class="content">
								<p>Sed nisl arcu euismod sit amet nisi lorem etiam dolor
									veroeros et feugiat.</p>
							</div>
						</a>
					</article>
					<article class="style4">
						<span class="image"> <img src="images/gun2.jpg" alt="" />
						</span> <a href="productDetail.do">
							<h2>Pretium</h2>
							<div class="content">
								<p>Sed nisl arcu euismod sit amet nisi lorem etiam dolor
									veroeros et feugiat.</p>
							</div>
						</a>
					</article>
				</section>
			</div>
		</div>
		<!-- --------------------------회원 비회원 관리자 각각 넣을 내용---------------------------------- -->
		</c:if>




		<!--2.관리자페이지  -->
		<c:if
			test="${!empty sessionScope.member && member.mEmail eq 'master'}">
				${member.mName }님 환영합니다.
				<a href="Logout.do" onclick="alert('로그아웃')"
				style="text-decoration: none"><br>로그아웃</a>
			<a href="productInsertForm.do" onclick="alert('상품등록')"
				style="text-decoration: none"><br>상품등록</a>
			<!-- --------------------------회원 비회원 관리자 각각 넣을 내용---------------------------------- -->
			<div align="center" width="100px" height="100px">
				<input type="text" maxlength="50" placeholder="검색어를 입력하세요."><br>
				<br> <br>

			</div>

			<!-- Logo -->
			<a href="main.do" class="logo"> <span class="symbol"><img
					src="images/logo.png" alt="" style="width: 200px; height: 100px;"></span><span
				class="title">JY & HB</span>
			</a>
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
		<h2>Menu</h2>
		<ul>
			<li><a href="index.do">JOIN</a></li>
			<li><a href="productDetail.do">LOGIN</a></li>
			<li><a href="mypage.do">MYPAGE</a></li>
			<li><a href="productDetail.do">CART</a></li>
			<li><a href="freeBoard.do">COMMUNITY</a></li>
			<li><a href="elements.do">Elements</a></li>
			<li><a href="category.do?cid=맨투맨">맨투맨</a></li>
			<input type="button" value="관리자페이지"
				onclick="location.href='masterMain.do'">
			<br>
		</ul>
	</nav>

	<!-- Main -->
	<div id="main">
		<div class="inner">
			<header align="center">

				<h1>시선이 교차하는 순간</h1>

				<h3>
					자연스럽고 특별한 아름다움은 한 순간에 시선과 마음을 사로잡습니다<br>
				</h3>
				<h3>눈과 마음을 열어보세요</h3>
				<br>
				<p align="left">
					남성을 위한 수트<br> 포멀함과 세심한 디자인의 기능성이 만난 남성 수트를 소개합니다.<br> 포멀
					& 캐주얼 스타일을 선보이는 우아한 컬렉션에서 소개하는 BO$$만의 실루엣을 발견해보세요.<br> 슬림핏과
					가벼운 여름 스타일부터 턱시도와 스리피스 디자인까지, 세심한 스타일링에 중점을 둔 수트 컬렉션을 지금 확인해보세요.
				</p>
			</header>
			<section class="tiles">
				<article class="style1">
					<span class="image"> <img src="images/ch3.jpg" alt="" />
					</span> <a href="productDetail.do?pid=6">
						<h2>오쨍군</h2>
						<div class="content">
							<p>Sed nisl arcu euismod sit amet nisi lorem etiam dolor
								veroeros et feugiat.</p>
						</div>
					</a>
					<div class="buttons_master">
						<button class="edit-button" onClick="location.href='main.do';">수정</button>
						<button class="add-button">등록</button>
						<button class="delete-button">삭제</button>
					</div>
				</article>
				<article class="style2">
					<span class="image"> <img src="images/gun3.jpg" alt="" />
					</span> <a href="productDetail.do?pid=49">
						<h2>목도리</h2>
						<div class="content"></div>
					</a>
					<div class="buttons_master">
						<button class="edit-button" onClick="location.href='main.do';">수정</button>
						<button class="add-button">등록</button>
						<button class="delete-button">삭제</button>
					</div>
				</article>
				<article class="style3">
					<span class="image"> <img src="images/ch2.jpg" alt="" />
					</span> <a href="productDetail.do">
						<h2>Feugiat</h2>
						<div class="content">
							<p>Sed nisl arcu euismod sit amet nisi lorem etiam dolor
								veroeros et feugiat.</p>
						</div>
					</a>
					<div class="buttons_master">
						<button class="edit-button" onClick="location.href='main.do';">수정</button>
						<button class="add-button">등록</button>
						<button class="delete-button">삭제</button>
					</div>
				</article>
				<article class="style4">
					<span class="image"> <img src="images/gun4.jpg" alt="" />
					</span> <a href="productDetail.do">
						<h2>Tempus</h2>
						<div class="content">
							<p>Sed nisl arcu euismod sit amet nisi lorem etiam dolor
								veroeros et feugiat.</p>
						</div>
					</a>
					<div class="buttons_master">
						<button class="edit-button" onClick="location.href='main.do';">수정</button>
						<button class="add-button">등록</button>
						<button class="delete-button">삭제</button>
					</div>
				</article>
				<article class="style5">
					<span class="image"> <img src="images/e1.png" alt="" />
					</span> <a href="productDetail.do">
						<h2>Aliquam</h2>
						<div class="content">
							<p>Sed nisl arcu euismod sit amet nisi lorem etiam dolor
								veroeros et feugiat.</p>
						</div>
					</a>
					<div class="buttons_master">
						<button class="edit-button" onClick="location.href='main.do';">수정</button>
						<button class="add-button">등록</button>
						<button class="delete-button">삭제</button>
					</div>
				</article>
				<article class="style6">
					<span class="image"> <img src="images/e2.png" alt="" />
					</span> <a href="productDetail.do">
						<h2>Veroeros</h2>
						<div class="content">
							<p>Sed nisl arcu euismod sit amet nisi lorem etiam dolor
								veroeros et feugiat.</p>
						</div>
					</a>
					<div class="buttons_master">
						<button class="edit-button" onClick="location.href='main.do';">수정</button>
						<button class="add-button">등록</button>
						<button class="delete-button">삭제</button>
					</div>
				</article>
				<!-- 에러시작 -->
				<article class="style2">
					<span class="image"> <img src="images/e3.png" alt="" />
					</span> <a href="productDetail.do">
						<h2>Lorem</h2>
						<div class="content">
							<p>Sed nisl arcu euismod sit amet nisi lorem etiam dolor
								veroeros et feugiat.</p>
						</div>
					</a>
				</article>
				<article class="style3">
					<span class="image"> <img src="images/e4.png" alt="" />
					</span> <a href="productDetail.do">
						<h2>Dolor</h2>
						<div class="content">
							<p>Sed nisl arcu euismod sit amet nisi lorem etiam dolor
								veroeros et feugiat.</p>
						</div>
					</a>
				</article>
				<article class="style1">
					<span class="image"> <img src="images/gun2.jpg" alt="" />
					</span> <a href="productDetail.do">
						<h2>Nullam</h2>
						<div class="content">
							<p>Sed nisl arcu euismod sit amet nisi lorem etiam dolor
								veroeros et feugiat.</p>
						</div>
					</a>
				</article>
				<article class="style5">
					<span class="image"> <img src="images/gun2.jpg" alt="" />
					</span> <a href="productDetail.do">
						<h2>Ultricies</h2>
						<div class="content">
							<p>Sed nisl arcu euismod sit amet nisi lorem etiam dolor
								veroeros et feugiat.</p>
						</div>
					</a>
				</article>
				<article class="style2">
					<span class="image"> <img src="images/gun2.jpg" alt="" />
					</span> <a href="productDetail.do">
						<h2>Lorem</h2>
						<div class="content">
							<p>Sed nisl arcu euismod sit amet nisi lorem etiam dolor
								veroeros et feugiat.</p>
						</div>
					</a>
				</article>
				<article class="style4">
					<span class="image"> <img src="images/gun2.jpg" alt="" />
					</span> <a href="productDetail.do">
						<h2>Pretium</h2>
						<div class="content">
							<p>Sed nisl arcu euismod sit amet nisi lorem etiam dolor
								veroeros et feugiat.</p>
						</div>
					</a>
				</article>
			</section>
		</div>
	</div>
	<!-- --------------------------회원 비회원 관리자 각각 넣을 내용---------------------------------- -->
	</c:if>







	<!-- 3.회원페이지 -->
	<c:if test="${!empty sessionScope.member && member.mEmail ne 'master'}">
				${member.mName }님 환영합니다.
				<a href="Logout.do" onclick="alert('로그아웃')"
			style="text-decoration: none"><br>로그아웃</a>
		<!-- --------------------------회원 비회원 관리자 각각 넣을 내용---------------------------------- -->
		<div align="center" width="100px" height="100px">
			<input type="text" maxlength="50" placeholder="검색어를 입력하세요."><br>
			<br> <br>

		</div>

		<!-- Logo -->
		<a href="main.do" class="logo"> <span class="symbol"><img
				src="images/logo.png" alt="" style="width: 200px; height: 100px;"></span><span
			class="title">JY & HB</span>
		</a>
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
			<h2>Menu</h2>
			<ul>
				<li><a href="index.do">JOIN</a></li>
				<li><a href="productDetail.do">LOGIN</a></li>
				<li><a href="mypage.do">MYPAGE</a></li>
				<li><a href="productDetail.do">CART</a></li>
				<li><a href="freeBoard.do">COMMUNITY</a></li>
				<li><a href="elements.do">Elements</a></li>
				<li><a href="category.do?cid=맨투맨">맨투맨</a></li>
				<br>
			</ul>
		</nav>

		<!-- Main -->
		<div id="main">
			<div class="inner">
				<header align="center">

					<h1>시선이 교차하는 순간</h1>

					<h3>
						자연스럽고 특별한 아름다움은 한 순간에 시선과 마음을 사로잡습니다<br>
					</h3>
					<h3>눈과 마음을 열어보세요</h3>
					<br>
					<p align="left">
						남성을 위한 수트<br> 포멀함과 세심한 디자인의 기능성이 만난 남성 수트를 소개합니다.<br> 포멀
						& 캐주얼 스타일을 선보이는 우아한 컬렉션에서 소개하는 BO$$만의 실루엣을 발견해보세요.<br> 슬림핏과
						가벼운 여름 스타일부터 턱시도와 스리피스 디자인까지, 세심한 스타일링에 중점을 둔 수트 컬렉션을 지금 확인해보세요.
					</p>
				</header>
				<section class="tiles">
					<article class="style1">
						<span class="image"> <img src="images/ch3.jpg" alt="" />
						</span> <a href="productDetail.do?pid=6">
							<h2>오쨍군</h2>
							<div class="content">
								<p>Sed nisl arcu euismod sit amet nisi lorem etiam dolor
									veroeros et feugiat.</p>
							</div>
						</a>

					</article>
					<article class="style2">
						<span class="image"> <img src="images/gun3.jpg" alt="" />
						</span> <a href="productDetail.do?pid=49">
							<h2>목도리</h2>
							<div class="content"></div>
						</a>
					</article>
					<article class="style3">
						<span class="image"> <img src="images/ch2.jpg" alt="" />
						</span> <a href="productDetail.do">
							<h2>Feugiat</h2>
							<div class="content">
								<p>Sed nisl arcu euismod sit amet nisi lorem etiam dolor
									veroeros et feugiat.</p>
							</div>
						</a>
					</article>
					<article class="style4">
						<span class="image"> <img src="images/gun4.jpg" alt="" />
						</span> <a href="productDetail.do">
							<h2>Tempus</h2>
							<div class="content">
								<p>Sed nisl arcu euismod sit amet nisi lorem etiam dolor
									veroeros et feugiat.</p>
							</div>
						</a>
					</article>
					<article class="style5">
						<span class="image"> <img src="images/e1.png" alt="" />
						</span> <a href="productDetail.do">
							<h2>Aliquam</h2>
							<div class="content">
								<p>Sed nisl arcu euismod sit amet nisi lorem etiam dolor
									veroeros et feugiat.</p>
							</div>
						</a>
					</article>
					<article class="style6">
						<span class="image"> <img src="images/e2.png" alt="" />
						</span> <a href="productDetail.do">
							<h2>Veroeros</h2>
							<div class="content">
								<p>Sed nisl arcu euismod sit amet nisi lorem etiam dolor
									veroeros et feugiat.</p>
							</div>
						</a>
					</article>
					<!-- 에러시작 -->
					<article class="style2">
						<span class="image"> <img src="images/e3.png" alt="" />
						</span> <a href="productDetail.do">
							<h2>Lorem</h2>
							<div class="content">
								<p>Sed nisl arcu euismod sit amet nisi lorem etiam dolor
									veroeros et feugiat.</p>
							</div>
						</a>
					</article>
					<article class="style3">
						<span class="image"> <img src="images/e4.png" alt="" />
						</span> <a href="productDetail.do">
							<h2>Dolor</h2>
							<div class="content">
								<p>Sed nisl arcu euismod sit amet nisi lorem etiam dolor
									veroeros et feugiat.</p>
							</div>
						</a>
					</article>
					<article class="style1">
						<span class="image"> <img src="images/gun2.jpg" alt="" />
						</span> <a href="productDetail.do">
							<h2>Nullam</h2>
							<div class="content">
								<p>Sed nisl arcu euismod sit amet nisi lorem etiam dolor
									veroeros et feugiat.</p>
							</div>
						</a>
					</article>
					<article class="style5">
						<span class="image"> <img src="images/gun2.jpg" alt="" />
						</span> <a href="productDetail.do">
							<h2>Ultricies</h2>
							<div class="content">
								<p>Sed nisl arcu euismod sit amet nisi lorem etiam dolor
									veroeros et feugiat.</p>
							</div>
						</a>
					</article>
					<article class="style2">
						<span class="image"> <img src="images/gun2.jpg" alt="" />
						</span> <a href="productDetail.do">
							<h2>Lorem</h2>
							<div class="content">
								<p>Sed nisl arcu euismod sit amet nisi lorem etiam dolor
									veroeros et feugiat.</p>
							</div>
						</a>
					</article>
					<article class="style4">
						<span class="image"> <img src="images/gun2.jpg" alt="" />
						</span> <a href="productDetail.do">
							<h2>Pretium</h2>
							<div class="content">
								<p>Sed nisl arcu euismod sit amet nisi lorem etiam dolor
									veroeros et feugiat.</p>
							</div>
						</a>
					</article>
				</section>
			</div>
		</div>
		<!-- --------------------------회원 비회원 관리자 각각 넣을 내용---------------------------------- -->
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