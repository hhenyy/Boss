<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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
<noscript>
	<link rel="stylesheet" href="assets/css/noscript.css" />
</noscript>
<script>
    function popup(){
        var url = "masterNoticeInsertForm.do";
        var name = "공지사항";
        var option = "width = 1000, height = 800, top = 100, left = 200, location = no"
        window.open(url, name, option);
    }
    
    function deleteCheck(abc) {
        if(window.confirm("삭제하시겠습니까?")){
        	location.href="masterNoticeDelete.do?mnId="+abc+"&nowPage=${pp.nowPage }&cntPerPage=${pp.cntPerPage }"
        	alert("삭제되었습니다!")		
        }
        console.log("삭제")
      }
</script>
</head>

<body class="is-preload">

	<!-- Wrapper -->
	<div id="wrapper">
		<!-- Header -->
		<header id="header">
			<div class="inner">

				<c:if test="${sessionId eq null}">
					<a href="NaverLogin.do" style="text-decoration: none">로그인</a>
				</c:if>
				<c:if test="${member ne null && member.mEmail eq 'master'}">
				${sessionId }님 환영합니다.
				<a href="Logout.do" onclick="alert('로그아웃')"
						style="text-decoration: none"><br>로그아웃</a>
					<a href="productInsertForm.do" onclick="alert('상품등록')"
						style="text-decoration: none"><br>상품등록</a>
				</c:if>
				<c:if test="${member ne null && member.mEmail ne 'master'}">
				${sessionId }님 환영합니다.
				<a href="Logout.do" onclick="alert('로그아웃')"
						style="text-decoration: none"><br>로그아웃</a>
				</c:if>

				<div align="center" width="100px" height="100px">
					<input type="text" maxlength="50" placeholder="검색어를 입력하세요."><br>


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
				<li><a href="main.do">Home</a></li>
				<li><a href="category.do">카테고리</a></li>
				<li><a href="productDetail.do">Tempus etiam</a></li>
				<li><a href="productDetail.do">Consequat dolor</a></li>
				<li><a href="elements.do">Elements</a></li>
				<input type="button" value="관리자페이지"
					onclick="location.href='masterMain.do'">
				<br>
			</ul>
		</nav>

		<!-- Main -->
		<div id="main">
			<div class="inner">
				<header align="left">

					<h1>공지사항</h1>
				</header>

				<section class="tiles">

					<!-- 공지사항 테이블 출력 -->
					<!-- 폼으로 만들 이유X 수정 필요 -->
					<form method="post" action="javascript:popup()">
						<div class="container">
							<!-- 옵션선택 끝 -->
							<table
								style="border: 1px solid black; margin-left: auto; margin-right: auto;">
								<tr>
									<th>글번호</th>
									<th>제목</th>
									<th>내용</th>
									<th>작성일</th>
									<th>조회수</th>
								</tr>
								<c:set var="i" value="1"></c:set>
								<c:forEach var="masterNotice" items="${list}" varStatus="loop">
									<tr>
										<td id="${i }">${i }</td>
										<td
											onclick="location.href='masterNoticeDetail.do?mnId=${masterNotice.mnId}&nowPage=${pp.nowPage }&cntPerPage=${pp.cntPerPage }' ">${masterNotice.mnTitle}</td>
										<td
											onclick="location.href='masterNoticeDetail.do?mnId=${masterNotice.mnId}&nowPage=${pp.nowPage }&cntPerPage=${pp.cntPerPage }' ">${masterNotice.mnContent}</td>
										<td
											onclick="location.href='masterNoticeDetail.do?mnId=${masterNotice.mnId}&nowPage=${pp.nowPage }&cntPerPage=${pp.cntPerPage }' "><fmt:formatDate
												pattern="yyyy-MM-dd hh:mm" value="${masterNotice.mnReg}" /></td>
										<td
											onclick="location.href='masterNoticeDetail.do?mnId=${masterNotice.mnId}&nowPage=${pp.nowPage }&cntPerPage=${pp.cntPerPage }' ">${masterNotice.mnReadCount}
										</td>
										<c:if test="${member ne null && member.mEmail eq 'master'}">
											<td>
												<button type="button"
													onclick="location.href='masterNoticeUpdateForm.do?mnId=${masterNotice.mnId}&nowPage=${pp.nowPage}&cntPerPage=${pp.cntPerPage}'">수정</button>
												<button type="button" id="delete"
													value="${masterNotice.mnId}" id="deleteCheck" value="${masterNotice.mnId}"
													onclick="javascript:deleteCheck(${masterNotice.mnId})">삭제</button> 
												<!-- mnId는 items="{list}" 안에 포함된 정보.  -->
											</td>
										</c:if>
									</tr>
									<c:set var="i" value="${i + 1}"></c:set>
								</c:forEach>
							</table>
							<c:if test="${member ne null}">
								<button type="submit" class="putsub">공지사항 등록</button>
							</c:if>
							<div align="right" class="search">
					</form>
				</section>
			</div>



			<!-- 다른 페이지로 넘어가기 위한 숫자들 자리 -->
			<div align="center">
				<c:if test="${pp.startPage != 1 }">
					<a style="text-decoration: none; color: deeppink"
						href="./masterNotice.do?nowPage=${pp.startPage - 1 }&cntPerPage=${pp.cntPerPage}">
						<- </a>
				</c:if>
				<c:forEach begin="${pp.startPage }" end="${pp.endPage }" var="p">
					<c:choose>
						<c:when test="${p == pp.nowPage }">
							<b>${p }</b>
						</c:when>
						<c:when test="${p != pp.nowPage }">
							<a style="text-decoration: none; color: deeppink"
								href="./masterNotice.do?nowPage=${p }&cntPerPage=${pp.cntPerPage}">${p }</a>
						</c:when>
					</c:choose>
				</c:forEach>
				<c:if test="${pp.endPage != pp.lastPage}">
					<a style="text-decoration: none; color: deeppink"
						href="./masterNotice.do?nowPage=${pp.endPage+1 }&cntPerPage=${pp.cntPerPage}">
						-> </a>
				</c:if>
			</div>

		</div>




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
	<%@ include file="../../common/footer.jsp"%>
	<!-- Scripts -->
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/browser.min.js"></script>
	<script src="assets/js/breakpoints.min.js"></script>
	<script src="assets/js/util.js"></script>
	<script src="assets/js/main.js"></script>

</body>
</html>