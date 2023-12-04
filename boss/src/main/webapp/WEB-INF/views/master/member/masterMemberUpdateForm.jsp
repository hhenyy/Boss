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
<title>회원 정보수정</title>

</head>
<body>
	<%@ include file="../common/masterNav.jsp"%>
	<form method="post" action="masterMemberUpdate.do" id="myform">
		<input type="hidden" id="mPwd" name="mPwd" value="${member.mPwd }">
		<input type="hidden" id="mReg" name="mReg" value="${member.mReg }">
		<div class="container">
			<h1 class="h1_caption">회원 정보수정</h1>
			<table>
				<tr>
					<th>ID</th>
					<th>이름</th>
					<th>핸드폰</th>
					<th>우편번호</th>
					<th>주소</th>
					<th>회원등급</th>
					<th>가입일</th>
					<th>삭제여부</th>
					<th>관리</th>
				</tr>
				<tr align="center">
					<td><input type="text" value="${member.mEmail}"
						id="${member.mEmail}" name="mEmail" autofocus></td>
					<td><input type="text" value="${member.mName}" id="mName"
						name="mName"></td>
					<td><input type="text" value="${member.mPhone}" id="phone1"
						name="mPhone"></td>
					<td><input type="text" value="${member.mPost}" id="mPost"
						name="mPost"></td>
					<td><input type="text" value="${member.mAddress}"
						id="mAddress" name="mAddress"></td>
					<td><input type="text" value="${member.mGrade}" id="grade"
						name="mGrade"></td>
					<td><input type="text" value="${member.mDrop}" id="mDrop"
						name="mDrop"></td>
					<td><input type="text" value="${member.mReg}" id="mReg"
						name="mReg"></td>
					<td>
						<button type="button" onclick="confirmAndUpdate()">수정</button>
						<button type="button" onclick="confirmAndRedirect()">취소</button>
					</td>
				</tr>
			</table>
		</div>

		<script>
			function confirmAndUpdate() {
				var userConfirmed = confirm('수정을 하시겠습니까?');
				if (userConfirmed) {
					alert('폼 데이터 확인: ' + document.forms[0].mEmail.value); // 예시로 첫 번째 입력 필드의 값을 확인
					// 예시: document.forms[0].submit(); // 첫 번째 폼을 서버로 전송
					alert('수정이 완료되었습니다.'); // 서버로 전송하는 대신 알림만 표시 (테스트용)
					document.forms[0].submit();

					// 					$("#myform").submit();
				} else {
					alert("수정을 취소하였습니다.")
				}
			}

			function confirmAndRedirect() {
				var userConfirmed = confirm('수정을 취소하시겠습니까?');
				if (userConfirmed) {
					history.go(-1);
				}
			}
		</script>
	</form>
</body>
</html>