$(document).ready(function() {

    $('#btn').click(function() {
        if ($('#mEmail').val() === "") {
            alert("이메일을 입력해주세요.");
            return false;
        }

        if ($('#mPwd').val() === "") {
            alert("비밀번호를 입력해주세요.");
            return false;
        }
        
    });
});