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
<title>상품 등록 페이지</title>


</head>

<script>
function goBack() {
    alert('이전 페이지로 돌아갑니다.');
    history.go(-1);
}
</script>

<body>
	<%@ include file="../common/masterNav.jsp"%>
	<form method="post" action="masterProductInsert.do" id="myform"
		enctype="multipart/form-data">
		<div class="container">
			<div class="table-container">
				<table>
					<caption>상품 등록</caption>
					<tr>
						<th>이미지</th>
						<th>상품명</th>
						<th>상품 분류</th>
						<th>색상</th>
						<th>사이즈</th>
						<th>설명</th>
						<th>가격</th>
						<th>재고수량</th>
						<th>등록 여부</th>
					</tr>
					<tr align="center">
						<td style="font-size: 15px;"><input type="file" name="pimage1"><br>
							<br></td>
						<td><input type="text" id="mgrade"
							name="pname"></td>
						<td><select name="cid" class="putsub">
						<option value="맨투맨" selected>맨투맨</option>
    						<option value="코트">코트</option>
    						<option value="상의">상의</option>
    						<option value="하의">하의</option>
    						<option value="벨트">벨트</option>
    						<option value="악세사리">악세사리</option>
    						<option value="양말">양말</option>
						</select>
						</td>
						<td><input type="text" id="mgrade"
							name="pcolor"></td>
						<td><input type="text" id="mgrade"
							name="psize"></td>	
						<td><input type="text" id="mgrade"
							name="pcontent"></td>
						<td><input type="text" id="mgrade" name="pprice"></td>
						<td><input type="text" id="mgrade"
							></td>
						
						<td>
							<button type="submit">등록</button>
							<button type="button" onclick="goBack();">취소</button>
						</td>
					</tr>
				</table>
			</div>
		</div>

		<br>
	</form>
</body>
</html>