/**
 * 글작성폼 유효성 검사
 */
 function board_check() {
	if ($.trim($("#fTitle").val()) == "") {
		alert("글제목을 입력하세요!");
		$("#fTitle").val("").focus();
		return false;
	}
	if ($.trim($("#fContent").val()) == "") {
		alert("글내용을 입력하세요!");
		$("#fContent").val("").focus();
		return false;
	}
	if ($.trim($("#mEmail").val()) == "") {
		alert("작성자를 입력하세요!");
		$("#mEmail").val("").focus();
		return false;
	}
	if ($.trim($("#fPassword").val()) == "") {
		alert("비밀번호를 입력하세요!");
		$("#fPassword").val("").focus();
		return false;
	}
}