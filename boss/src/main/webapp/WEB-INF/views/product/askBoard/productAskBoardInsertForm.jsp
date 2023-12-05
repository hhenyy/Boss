<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 문의 작성</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<!-- <script src="./js/product.js"></script> -->
<!-- css 양식 include -->
<%@include file="/WEB-INF/views/common/header.jsp"%>
<script>
$(document).ready(function(){
	
	$("#ask_insert_button2").click(function() {
		
		if($('#askcontent').val() == ""){
			alert("문의내용을 입력해주세요.");
			return false;
		}
	});
	
}); /* ask_insert_button2 end */

	
</script>


<!-- css불러오기 -->
<link rel="stylesheet" href="css/AskBoard.css">
</head>
<body>
	<div class="Ask_insert">
		<h1 class="" align="center">문의 작성</h1>
		<form method="post" action="productAskBoardInsertCheck.do">


			<table class="askinsert_table">
				<tr>
					<th>상품번호</th>
					<td class=""><input type="text" class="input_box" name="pid"
						readonly="readonly" value="${pid}"></td>
				</tr>
				<tr>
					<th>작성자</th>
					<td class=""><input type="text" class="input_box"
						name="memail" readonly="readonly" value="${member.mEmail}"></td>
				</tr>
				<tr>
					<th>상품문의날짜</th>
					<td class=""><input type="text" class="input_box" name="rreg"
						readonly="readonly" value="${askDate}"></td>
				</tr>


				<tr>
					<!-- 추가할수도 -->
				</tr>


				<tr>
					<th>상품문의내용</th>
					<td><textarea rows="10" cols="50" class="input_box"
							id="askcontent" name="askcontent"></textarea></td>
				</tr>
			</table>

			<div class="ask_insert_button">
				<input type="submit" value="등록" id="ask_insert_button2" class="ask_insert_button2" /> 
				<input type="reset" value="취소" class="ask_insert_button2"
					onclick="history.go(-1)" />
			</div>
		</form>
	</div>







	<!-- css 양식 include -->
	<%@include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>