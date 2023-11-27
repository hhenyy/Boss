<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시판 글작성폼</title>
<script src="./js/freeboard.js"></script>
<!-- css 양식 include -->
<%-- <%@include file="/WEB-INF/views/common/header.jsp"%> --%>

<!-- css 불러오기 -->
<link rel="stylesheet" href="css/freeBoardDetail.css">

</head>
<body>
<!-- 전체 div시작 -->
<div class="div_freeBoardDetail">
  <table class="table_freeBoardDetail">
  <tr><input type="text" name="fTitle" id="fTitle" value="제목을 입력해 주세요" size="90">
  </tr>
  <tr>
<textarea name="fContent" id="fContent" cols="90" rows="30">내용을 입력해 주세요</textarea>
  </tr>
  <tr>
<input type="text" name="mEmail" id="mEmail" value="${member.mEmail}" size="30" class="table_td_text"></tr>
 <!-- <tr>
  <th>비밀번호</th>
  <td><input type="password" name="fPassword" id="fPassword"  size="30" class="table_td_text"></td>
  </tr>  -->  
  </table>
  
  
  
<!-- button div 끝-->
<div class="div_boardform_button">
<button type="button"  class="boardform_button"
		onClick="location.href='freeBoardList.do?page=${page}'">목록</button>
</div>
<!-- button div 끝-->
		
		
		
  </form>
</div><!-- 전체 div끝 -->
</body>

	<!-- css 양식 include -->
<%@include file="/WEB-INF/views/common/footer.jsp"%>
</html>