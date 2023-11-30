<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>SMS 전송</title>
<link rel="stylesheet" href="css/sms.css">
</head>
<body>
	<div class="container">
		<form method="post" action="sendSms.do" id="smsForm"
			class="form-style">
			<!--  보내는 사람 설정. (사실상 고정값) -->
			<input type="hidden" name="from" value="01039283425"> <input
				type="hidden" name="type" value="free"> <input type="hidden"
				name="oid" value="${orders.oid} ">
			<div class="form-content">
				<h2>SMS 전송 (문자보내기)</h2>
				<label for="from" class="label-style">보낼 사람:</label> <input
					type="text" id="from" value="관리자" readonly="readonly"
					class="input-style"> <label for="to" class="label-style">받는
					사람:</label> <input type="text" id="to" name="to" value="${orders.ophone }"
					class="input-style" maxlength="11"> <label for="message"
					class="label-style">내용:</label>
				<textarea id="message" name="text" placeholder="보낼 내용 입력"
					class="textarea-style" maxlength="70"></textarea>
				<button type="submit" class="button-style" onclick="submit()">전송하기</button>
				<h4 style="color: gray" align="left">최대 글자수 : 한글 70자 영문/숫자 160자</h4>
			</div>
		</form>
	</div>
	<script>
		function sendSMS() {

			console.log("문자를 전송합니다.");
			$("#smsForm").attr("action", sendSms + ".do"); //위에 있는 폼태그를 컨트롤러로 전송한다.
			$("#smsForm").submit();
		}
	</script>
</body>
</html>
