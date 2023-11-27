<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>커뮤니티</title>
<!-- css 양식 include -->
<%-- <%@include file="/WEB-INF/views/common/header.jsp"%> --%>

<!-- css 불러오기 -->
<link rel="stylesheet" href="css/freeBoard.css">

<div class="div_iframe">
<iframe width="420" height="315"
	src="https://www.youtube.com/embed/7y1DWwz3Wfs"></iframe>
<iframe width="420" height="315"
	src="https://www.youtube.com/embed/t0xYMEYyjgY"></iframe>
<iframe width="420" height="315"
	src="https://www.youtube.com/embed/GicK9l0cPp0&t=3s"></iframe>
<iframe width="420" height="315"
	src="https://www.youtube.com/embed/ug0-BKfV0eQ"></iframe>
</div>
</head>
<body>
<!-- 전체 div시작 -->
	<div class="community">
		<table class="table_community">
			<caption>BOSS COMMUNITY</caption>
			<tr>
				<th width="8%">글번호</th>
				<th width="47%">제목</th>
				<th width="13%">작성자</th>
				<th width="13%">작성일</th>
				<th width="7%">조회수</th>
				<th width="7%">좋아요</th>
			</tr>

			<!-- 글번호 변수 정의 -->
			<c:set var="num" value="${listcount-(page-1)*10}" />

			<!-- 글목록 list출력 시작 -->
			<c:forEach var="board" items="${boardlist}">
				<tr>
					<!-- 글번호 출력부분 -->
					<td><c:out value="${num}" /> 
					<c:set var="num" value="${num-1}" />
					</td>

                   <!-- 제목 출력 부분 -->	
					<td><a href="freeBoardDetail.do?page=${page}&fId=${board.fId}&state=detail">${board.fTitle}</a></td>
					<td>${board.mEmail}</td>
					<td>${board.fReg}</td>
					<td>${board.fReadCount}</td>
					<td>${board.fLike}</td>
				</tr>
			</c:forEach>
			<!-- 글목록 list출력 끝-->
		</table>
		
		
		<!-- page처리 div 시작-->
		<div class="div_feeboard_paging">
		<c:if test="${page<=1}">
		 이전&nbsp;
		</c:if>
		
		<c:if test="${page>1}">
		  <a href="freeBoardList?page=${page-1}">이전</a>&nbsp;
		</c:if>
		
		<c:forEach var="a" begin="${startpage}" end="${endpage}">
		   <c:if test="${a==page}">
		     ${a}
		   </c:if>
		   <c:if test="${a!=page}">
		    <a href="freeBoardList?page=${a}">${a}</a>&nbsp;
		    </c:if>
		</c:forEach>
		
		<c:if test="${page>=maxpage}">
		 다음
		</c:if>
		<c:if test="${page<maxpage}">
		  <a href="freeBoardList?page=${page+1}">다음</a>&nbsp;
		</c:if>
		</div>
		<!-- page처리 div 끝-->
		
		
		
		<!-- button div 끝-->
		<div class="div_boardlist_button">
		<button type="button"  class="boardlist_button"
		onClick="location.href='freeBoardInsertform.do?page=${page}'">글쓰기</button>
		<button type="button"  class="boardlist_button"
		onClick="location.href='main.do'">메인</button>
		</div>
		<!-- button div 끝-->
		
		
		
	</div> <!-- 전체 div끝 -->

	<!-- css 양식 include -->
	<%@include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>