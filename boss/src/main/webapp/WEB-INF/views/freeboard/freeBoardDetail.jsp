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
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
	/* 	window.onload=function() {
	 } */
	$(function() {
		//기존 댓글 목록 요청 
		//load함수로 불러온 결과 페이지(freeboardReplyList.jsp)의 댓글 목록을 div태그사이에 출력
		//상세페이지 들어오자마자 자동으로 처리됨. 
		$('#replylist').load('FreeReplyList.do?fId=${detail.fId}')
//		$('#list').load('${path}/list/pageNum/${pageNum}');
		
		$('#replyInsert').click(function() {
			if ($('#frContent').val() == '') {
				alert('댓글 입력후에 클릭하시오');
				$('#frContent').focus();
				return false;
			}
			var frmData = $('form').serialize();
			//form태그의 전달값들을 한꺼번에 구해옴 
			// var frmData = 'replyer='+frm.replyer.value+'&bno='+
			//				  frm.bno.value+'&replytext='+frm.replytext.value;	
			//post함수로 요청: 새로추가된 댓글목록을 콜백함수로 돌려받고 freeBoardDetail.jsp div태그사이에 다시 출력함. 
			//post함수대신 ajax로도 가능함. 
// 			$.post('replyInsert.do', frmData, function(data) {
// 				$('#replylist').html(data);
// 				$('#frContent').val('');
// 			});
			//#replylist 아이디 값에 data값을 출력하고, #frContent에 공백처리
			$.ajax({
				url : 'replyInsert.do',
				type : 'post',
				data : frmData,
				success : function(data){
					$('#replylist').html(data);
					$('#frContent').val('');
				}				
			}); // $.ajax() end			
		});
	});
</script>
</head>
<body>
	<!-- 전체 div시작 -->
	<div class="div_freeBoardDetail">
		<table class="table_freeBoardDetail">
			<tr>
				<td>제목</td>
				<td><h1>${detail.fTitle}</h1></td>
			</tr>
			<tr>
				<td>작성자</td>
				<td>${detail.mEmail}</td>
			</tr>
			<tr>
				<td>작성일</td>
				<td><fmt:formatDate value="${detail.fReg}" pattern="yyyy-MM-dd" /></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><h2>
						<pre>${detail.fContent}</pre>
					</h2></td>
			</tr>
			<tr>
				<td>조회수</td>
				<td>${detail.fReadCount}</td>
			</tr>
			<tr>
				<td>좋아요</td>
				<td>${detail.fLike}</td>
			</tr>
		</table>

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

<p>
	<!--------- 댓글입력 div 시작------->
  <!--freereplycontroller로 부모글의fId전달  댓글단사람의  mEmail로해야함 추후 수정  -->
		<form name="frm" id="frm">
			<input type="hidden" name="mEmail" value="${detail.mEmail}">
			<input type="hidden" name="fId" value="${detail.fId}"> 댓글 :
			<textarea rows="3" cols="50" name="frContent" id="frContent" placeholder="댓글 달기.."></textarea>
			<input type="button" value="확인" id="replyInsert">
		</form>
			<div id="replylist"></div>
		<!-- <div id="list"></div> -->
	</div>
	<!-- 댓글입력 div 끝 -->

</body>

<!-- css 양식 include -->
<%@include file="/WEB-INF/views/common/footer.jsp"%>
</html>