<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시판 상세페이지</title>
<!-- css 양식 include -->
<%@include file="/WEB-INF/views/common/header.jsp"%>

<!-- css 불러오기 -->
<link rel="stylesheet" href="css/freeBoardDetail.css">
<!-- css 불러오기 -->
<link rel="stylesheet" href="css/freeBoard.css">
</head>

<body>
	<!-- 전체 div시작 -->
	<div class="div_freeBoardDetail">
		<table class="table_freeBoardDetail">

			<tr>
				<td colspan="4"><h3>${detail.fTitle}</h3></td>
			</tr>
			<tr>
				<td colspan="4">${detail.mEmail}</td>
			</tr>
			<tr>
				<td colspan="4"><fmt:formatDate value="${detail.fReg}"
						pattern="yyyy-MM-dd" /></td>
			</tr>
			<tr>
				<td colspan="4"><pre>${detail.fContent}</pre></td>
			</tr>

			<tr>
				<td>조회수</td>
				<td>${detail.fReadCount}</td>
				<td>좋아요</td>
				<td>${detail.fLike}</td>
			</tr>
		</table>
	</div>

	<!-- button div 끝-->
	<div class="div_boardform_button" align="center">
		<input type="button" class="boardform_button" value="수정"
			onClick="location.href='freeBoardDetail.do?fId=${detail.fId}&page=${page}&state=update'">
		<input type="button" class="boardform_button" value="삭제"
			onClick="location.href='freeBoardDetail.do?fId=${detail.fId}&page=${page}&state=delete'">
		<input type="button" class="boardform_button" value="목록"
			onClick="location.href='freeBoardList.do?page=${page}'">
	</div>
	<!-- button div 끝-->
	<!-- 전체 div끝 -->






	<!---------------------댓글 목록 div시작------------------------------>
	<div class="community">
		<table class="table_community">
			<caption>댓글</caption>
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
					<td colspan="6">아직 댓글이 없습니다. 댓글을 남겨보세요.</td>
				</tr>
			</c:if>


			<c:if test="${not empty list}">
				<!-- 글번호 변수 정의 -->
				<c:set var="num" value="${no}" />

				<!-- 글목록 list출력 시작 -->
				<c:forEach var="board" items="${list}">
					<tr>
						<!-- 글번호 출력부분 -->
						<td><c:out value="${num}" /> <c:set var="num"
								value="${num-1}" /></td>

						<!-- 삭제글인지 아닌지 판별 -->
						<c:if test="${board.fDrop =='Y' }">
							<td colspan="6">삭제된 데이터 입니다</td>
						</c:if>

						<c:if test="${board.fDrop !='Y' }">
							<!-- 제목 출력 부분 -->
							<td><a
								href="freeBoardDetail.do?page=${pp.currentPage}&fId=${board.fId}&state=detail">
									${board.fTitle} <!-- 조회수 30 초과 인기글 표시 --> <c:if
										test="${board.fReadCount > 30 }">
										<img alt="" src="images/hot.gif">
									</c:if>
							</a></td>
							<td>${board.mEmail}</td>
							<td><fmt:formatDate value="${board.fReg}"
									pattern="yyyy-MM-dd" /></td>
							<td>${board.fReadCount}</td>
							<td>${board.fLike}</td>
						</c:if>
					</tr>
				</c:forEach>
			</c:if>
			<!-- 글목록 list출력 끝-->
		</table>
	</div>
	<!---------------------댓글 목록 div시작------------------------------>



	<!-- 댓글입력 div 시작-->
	<div class="div_freeBoardDetail">
		<table class="table_freeBoardDetail">

			<h3>댓글 입력</h3>
			<tr>
				<!-- login된 다른유저의 정보가져와야함. -->
				<td>${detail.mEmail}</td>
				<td><textarea name="fContent" id="fContent" cols="90" rows="4">댓글 달기..</textarea></td>
				<td>
					<!--댓글 button div 끝-->
					<div class="div_boardform_button" align="center">
						<input type="submit" class="boardform_button" value="등록">
						</button>
					</div> <!-- button div 끝-->

				</td>
			</tr>
		</table>
	</div>
	<!-- 댓글입력 div 끝 -->

</body>

<!-- css 양식 include -->
<%@include file="/WEB-INF/views/common/footer.jsp"%>
</html>