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
<title>수정 페이지</title>


</head>

<script>
function goBack() {
    alert('이전 페이지로 돌아갑니다.');
    history.go(-1);
}
</script>

<body>
	<%@ include file="../common/masterNav.jsp"%>
	<form method="post" action="masterMemberUpdate.do" id="myform"
		enctype="multipart/form-data">
		<div class="container">
			<div class="table-container">
				<table>
					<caption>상품 수정</caption>
					<tr>
						<th>상품코드</th>
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
					<tr align="center">
						<td><input type="text" value="${product.pid}" id="mgrade"
							name="pid" autofocus></td>
						<td style="font-size: 15px;"><input type="file"><br>
							<br>수정전 파일명: ${product.pimage }</td>
						<td><input type="text" value="${product.pname}" id="mgrade"
							name="pname" maxlength="3" class="phone"></td>
						<td><input type="text" value="${product.pcolor}" id="mgrade"
							name="mGrade"></td>
						<td><input type="text" value="${product.psize}" id="mgrade"
							name="pcolor"></td>
						<td><textarea id="mgrade" name="pcontent">${product.pcontent }</textarea></td>

						<td><fmt:formatDate pattern="yyyy-MM-dd" var="formattedDate"
								value="${product.preg}" /> <input type="text"
							value="${formattedDate}" /></td>

						<td><input type="text" value="${product.pdrop}" id="mgrade"
							name="pdrop"></td>
						<td>
							<button type="submit" onclick="masterProductUpdate.do">수정</button>
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