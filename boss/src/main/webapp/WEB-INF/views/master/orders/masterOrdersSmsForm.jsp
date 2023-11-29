<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


	<!-- 문자보내는 폼 -->
	<form method="post" id="smsForm" class="fancy_table">
		<table border="1" align="right" width="300" height="200">
			<input type="hidden" name="nowPage" value="${pp.nowPage }">
			<input type="hidden" name="cntPerPage" value="${pp.cntPerPage}">
			<tr>
				<td>
					<center>
						<br> <span style="color: green; font-weight: bold;">SMS
							전송 (문자보내기)</span>
					</center>
					<ul>
						<li>보낼사람 : <input type="text" name="from"
							value="010-3928-3425" readonly="readonly"></li>
						<li>받는사람 : <input type="text" name="from"
							value="010-3928-3425" readonly="readonly"></li>
						<li>내용 : <textarea name="text" placeholder=" 보낼 내용 입력 "></textarea>
						</li>
						<br>
						<center>
							<button type="button"
								onclick="location.href='masterOrdersSmsMove.do?type=free' "
								value="전송하기" /></button>
						</center>
					</ul>

				</td>
			</tr>
		</table>
	</form>
	</div>
	<script>
			function sendSMS(pageName) {
				
				console.log("문자를 전송합니다.");
				var type = #();
				$("#smsForm").attr("action", pageName + ".do?type=" +); //위에 있는 폼태그를 컨트롤러로 전송한다.
				$("#smsForm").submit();
			}
		</script>

</body>
</html>