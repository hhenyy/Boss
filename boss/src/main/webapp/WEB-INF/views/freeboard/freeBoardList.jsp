<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>커뮤니티</title>
<!--header css 양식 include -->
 <%@include file="/WEB-INF/views/common/header.jsp"%>

<!-- css 불러오기 -->
<link rel="stylesheet" href="css/freeBoard.css">

<div class="div_iframe">
<iframe width="420" height="315"
	src="https://www.youtube.com/embed/7y1DWwz3Wfs"></iframe>
<iframe width="420" height="315"
	src="https://www.youtube.com/embed/t0xYMEYyjgY"></iframe>
<iframe width="420" height="315"
	src="https://www.youtube.com/embed/htHYzVnlHYQ"></iframe>
	<br>
<iframe width="420" height="315"
	src="https://www.youtube.com/embed/ug0-BKfV0eQ"></iframe>
<iframe width="420" height="315"
	src="https://www.youtube.com/embed/GicK9l0cPp0"></iframe>
<iframe width="420" height="315"
	src="https://www.youtube.com/embed/uWONtFbb00E"></iframe>
</div>
</head>
<body>
<!-- 전체 div시작 -->
	<div class="community">
		<table class="table_community">
			<caption>BOSS COMMUNITY</caption>
			<tr>
				<th width="8%">번호</th>
				<th width="47%">제목</th>
				<th width="13%">작성자</th>
				<th width="13%">작성일</th>
				<th width="7%">조회수</th>
				<th width="7%">좋아요</th>
			</tr>
			
			<c:if test="${empty list}">
				<tr>
					<td colspan="6">데이터가 없습니다</td>
				</tr>
			</c:if>


             <c:if test="${not empty list}">
			<!-- 글번호 변수 정의 -->
			<c:set var="num" value="${no}" />

			<!-- 글목록 list출력 시작 -->
			<c:forEach var="board" items="${list}">
				<tr>
					<!-- 글번호 출력부분 -->
					<td><c:out value="${num}" /> 
					<c:set var="num" value="${num-1}" />
					</td>
					
					<!-- 삭제글인지 아닌지 판별 -->
						<c:if test="${board.fDrop =='Y' }">
							<td colspan="6">삭제된 데이터 입니다</td>
						</c:if>
						
						<c:if test="${board.fDrop !='Y' }">
                   <!-- 제목 출력 부분 -->	
					<td><a href="freeBoardDetail.do?page=${pp.currentPage}&fId=${board.fId}&state=detail">
					${board.fTitle}
					     <!-- 조회수 30 초과 인기글 표시 -->
						<c:if test="${board.fReadCount > 30 }">
										<img alt="" src="images/hot.gif">
								</c:if>
					</a></td>
					<td>${board.mEmail}</td>
					<td><fmt:formatDate value="${board.fReg}" pattern="yyyy-MM-dd"/></td>
					<td>${board.fReadCount}</td>
					<td>${board.fLike}</td>
					</c:if>
				</tr>
			</c:forEach>
						</c:if>
			<!-- 글목록 list출력 끝-->
		</table>
	
		<!-- 검색칸 -->
		<form action="freeBoardList.do" style="text-align: center; margin-top: 20px;">
			<input type="hidden" name="page" value="1"> 
			<select	name="search">
				<option value="fTitle"	<c:if test="${search=='fTitle'}">selected="selected" </c:if>>제목</option>
				<option value="fContent"<c:if test="${search=='fContent'}">selected="selected" </c:if>>내용</option>
				<option value="mEmail"	<c:if test="${search=='mEmail'}">selected="selected" </c:if>>작성자</option>
				<option value="subcon"	<c:if test="${search=='subcon'}">selected="selected" </c:if>>제목+내용</option>
			</select> 
			<input type="text" name="keyword"> 
			<input type="submit" value="확인">
		</form>	
		
		<!-- page처리 div 시작-->
		<ul class="div_feeboard_paging">
			<!-- 검색 했을 경우의 페이징 처리 -->
			<c:if test="${not empty keyword}">
				<c:if test="${pp.startPage > pp.pagePerBlk }">
					<li><a
						href="freeBoardList.do?page=${pp.startPage - 1}&search=${search}&keyword=${keyword}">이전</a></li>
				</c:if>
				<c:forEach var="i" begin="${pp.startPage}" end="${pp.endPage}">
					<li <c:if test="$freeBoardList.do?page=${i}&search=${search}&keyword=${keyword}{pp.currentPage==i}">class="active"</c:if>><a
						href="">${i}</a></li>
				</c:forEach>
				<c:if test="${pp.endPage < pp.totalPage}">
					<li><a
						href="freeBoardList.do?page=${pp.endPage + 1}&search=${search}&keyword=${keyword}">다음</a></li>
				</c:if>
			</c:if>
				
		
		<!-- 전체 목록의 페이징 처리 -->
			<c:if test="${empty keyword}">
				<c:if test="${pp.startPage > pp.pagePerBlk }">
					<li><a href="freeBoardList.do?page=${pp.startPage - 1}">이전</a></li>
				</c:if>
				<c:forEach var="i" begin="${pp.startPage}" end="${pp.endPage}">
					<li <c:if test="${pp.currentPage==i}">class="active"</c:if>>
						<a href="freeBoardList.do?page=${i}">${i}</a></li>
				</c:forEach>
				<c:if test="${pp.endPage < pp.totalPage}">
					<li><a href="freeBoardList.do?page=${pp.endPage + 1}">다음</a></li>
				</c:if>
			</c:if>	
		</ul>
		
		<!-- button div 끝-->
		<div class="div_boardlist_button" style="text-align: center; margin-top: 20px;">
		<button type="button"  class="boardlist_button"
		onClick="location.href='freeBoardInsertform.do'">글쓰기</button>
		<button type="button"  class="boardlist_button"
		onClick="location.href='main.do'">메인</button>
		</div>
		<!-- button div 끝-->
		
	 <!-- 전체 div끝 -->

	<!-- css 양식 include -->
	<%@include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>