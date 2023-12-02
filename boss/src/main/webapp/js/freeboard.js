

/*글작성폼 유효성 검사*/
function board_check() {
	if($("#mEmail").val() == ''){
		alert("로그인 후에 글작성을 해주세요.");
		return false;
	}	
	
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
/*글삭제폼 유효성 검사*/
function board_del_check() {
	if($("#mEmail").val() == ''){
		alert("로그인 후에 글을 삭제 해주세요.");
		return false;
	}	
	
	if ($.trim($("#fPassword").val()) == "") {
		alert("비밀번호를 입력하세요!");
		$("#fPassword").val("").focus();
		return false;
	}
}
/*글수정폼 유효성 검사*/
function board_edit_check() {
	if($("#mEmail").val() == ''){
		alert("로그인 후에 글수정을 해주세요.");
		return false;
	}	
	
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
	if ($.trim($("#fPassword").val()) == "") {
		alert("비밀번호를 입력하세요!");
		$("#fPassword").val("").focus();
		return false;
	}
}

/* 댓글작성 유효성 검사*/
function board_replyinsert_check() {
	if(sessionscope.member == null){
		alert("로그인 후에 글작성을 해주세요.");
		return false;
	}
	}