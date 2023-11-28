<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시판 글수정폼</title>
<script src="./js/freeboard.js"></script>
<!-- css 양식 include -->
<%-- <%@include file="/WEB-INF/views/common/header.jsp"%> --%>

<!-- css 불러오기 -->
<link rel="stylesheet" href="css/freeBoardform.css">

</head>
<body>
<!-- 전체 div시작 -->
<div class="div_insertform">
  <form action="freeBoardInsertok.do" method="post" onSubmit="return boardinsert_check()">
  <input type="hidden" name="fId" value="${detail.fId}"/>
  <input type="hidden" name="page" value="${page}"/>
  
  <table class="table_insertform">
  <tr>
  <th>제목</th>
  <td><input type="text" name="fTitle" id="fTitle" value="${detail.fTitle}" size="90"></td>
  </tr>
  <tr>
  <th>내용</th>
  <td><textarea name="fContent" id="fContent" cols="90" rows="30">${detail.fContent}</textarea></td>
  </tr>
  <tr>
  <th>작성자아이디</th>
  <td><input type="text" name="mEmail" id="mEmail" value="${detail.mEmail}" size="30" class="table_td_text"></td>
  </tr>
 <!-- <tr>
  <th>비밀번호</th>
  <td><input type="password" name="fPassword" id="fPassword"  size="30" class="table_td_text"></td>
  </tr>  -->  
  </table>
  
  
  
<!-- button div 끝-->
<div class="div_boardform_button">
<input type="button"  class="boardform_button" value="취소"
		onClick="history.go(-1)">
<input type="submit" class="boardform_button" value="수정"></button>
</div>
<!-- button div 끝-->
		
		
		
  </form>
</div><!-- 전체 div끝 -->
</body>

	<!-- css 양식 include -->
<%@include file="/WEB-INF/views/common/footer.jsp"%>
</html>