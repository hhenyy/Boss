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

<title>상품 리스트</title>
<!-- css 양식 include -->
<script>
	function selChange() {
		var sel = document.getElementById('cntPerPage').value;
		location.href = "productList.do?nowPage=${page.nowPage}&cntPerPage="
				+ sel;
	}
</script>

</head>
<body>
	<%@ include file="../common/masterNav.jsp"%>
	
	<form method="post" action="masterMemberDelete.do">
		<div class="container">

			<h1 class="h1_caption">상 품 관 리</h1>

			<div style="float: right;">
				<select id="cntPerPage" name="sel" onchange="selChange()"
					class="selected-five">
					<option value="5"
						<c:if test="${page.cntPerPage == 5}">selected</c:if>>5줄
						보기</option>
					<option value="10"
						<c:if test="${page.cntPerPage == 10}">selected</c:if>>10줄
						보기</option>
					<option value="15"
						<c:if test="${page.cntPerPage == 15}">selected</c:if>>15줄
						보기</option>
					<option value="20"
						<c:if test="${page.cntPerPage == 20}">selected</c:if>>20줄
						보기</option>
				</select>
			</div>

			<!-- 옵션선택 끝 -->
			<button type="button" class="putsub" onclick="location.href='masterProductInsertForm.do'">신규 상품 등록</button>
			<table>
				<tr>
					<th><label><input type="checkbox"
							class="check-all-checkbox">전체선택</label></th>
					<th>이미지</th>
					<th>상품명</th>
					<th>색상</th>
					<th>사이즈</th>
					<th>설명</th>
					<th>등록일</th>
					<th>재고수량</th>
					<th>삭제여부[Y/N]</th>
					<th>수정/삭제</th>
				</tr>
				<c:set var="i" value="1"></c:set>
				<c:forEach var="product" items="${list}" varStatus="loop">
					<tr>
						<td id="${i }"><label><input type="checkbox"
								name="chkId" value="${product.pid}"> ${i }번상품</label></td>
						<td
							onclick="location.href='masterProductDetail.do?id=${product.pid}' ">
							<img src="./images/${product.pimage}" width="50" height="50">
						</td>
						<td id="${product.pid }"
							onclick="location.href='masterProductDetail.do?id=${product.pid}' ">${product.pname}</td>
						<td onclick="location.href='masterProductDetail.do?id=${product.pid}' ">${product.pcolor}</td>
						<td onclick="location.href='masterProductDetail.do?id=${product.pid}' ">${product.psize}</td>
						<td onclick="location.href='masterProductDetail.do?id=${product.pid}' ">${product.pcontent}</td>
						<td onclick="location.href='masterProductDetail.do?id=${product.pid}' "><fmt:formatDate
								pattern="yyyy-MM-dd" value="${product.preg}" /></td>
						<td onclick="location.href='masterProductDetail.do?id=${product.pid}' "></td>
						<td onclick="location.href='masterProductDetail.do?id=${product.pid}' ">${product.pdrop}</td>
						<td>
							<button type="button"
								onclick="location.href='masterProductUpdateForm.do?id=${product.pid}'">수정</button>
							<button type="button"
								onclick="location.href='masterProductList.do?id=${product.pid}' ">삭제</button>
						</td>
					</tr>
					<c:set var="i" value="${i + 1}"></c:set>
				</c:forEach>
			</table>

			<button type="submit" align="left" class="putsub">선택삭제</button>
			<div align="right" class="search">
	</form>
	<form action="masterMemberSearch.do" method="post">
		<select class="putsub" name="type">
			<option value="">검색 유형 선택</option>
			<option value="eEmail">ID</option>
			<option value="eName">이름</option>
			<option value="eAddress">주소</option>
			<option value="eGrade">회원등급</option>
		</select> <input type="text" align="right" id="keyword" name="keyword"
			placeholder="검색어를 입력하세요." maxlength="10" class="text-input">
		<input type="submit" value="검색" class="putsub">
	</form>

	<div class="pageFont1">
		<c:if test="${page.startPage != 1 }">
			<a style="text-decoration: none; color: deeppink"
				href="./masterProductList.do?nowPage=${page.startPage - 1 }&cntPerPage=${page.cntPerPage}">
				< </a>
		</c:if>
		<c:forEach begin="${page.startPage }" end="${page.endPage }" var="p">
			<c:choose>
				<c:when test="${p == page.nowPage }">
					<b>${p }</b>
				</c:when>
				<c:when test="${p != page.nowPage }">
					<a style="text-decoration: none; color: deeppink"
						href="./masterProductList.do?nowPage=${p }&cntPerPage=${page.cntPerPage}">${p }</a>
				</c:when>
			</c:choose>
		</c:forEach>
		<c:if test="${page.endPage != page.lastPage}">
			<a style="text-decoration: none; color: deeppink"
				href="./masterProductList.do?nowPage=${page.endPage+1 }&cntPerPage=${page.cntPerPage}">
				> </a>
		</c:if>
	</div>
	<%@ include file="../../common/footer.jsp"%>
	</div>

	<br>
	</form>
</body>
</html>