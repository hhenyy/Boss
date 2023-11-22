/**
 *  회원가입 관련 처리
 */
 
function fn_join() {
    var f = $('#join_frm');
    var formData = f.serialize(); // 직렬화
        
    $.ajax({
        type: "POST",
        url: f.attr('action'), // 폼의 action 속성을 사용
        data: formData,
        dataType: "json", // 서버로부터 JSON 데이터를 예상
        success: function(data) {
            if (data.result == "Y") {
                alert("회원가입이 완료되었습니다.");    
                location.href = "NaverLogin.do";
            } else {
                alert("회원가입에 실패하였습니다.");
            }
        },
        error: function(data) {
            alert("회원가입 에러 발생!");
            console.log(data);
        }
    });
}

 
 $(function() { 
    
    var email_auth_cd = '';
 
   $('#join').click(function(){
      
      if($('#id').val() == ""){
         alert("아이디를 입력해주세요.");
         return false;
      }
      
      if($('#nickname').val() == ""){
         alert("닉네임을 입력해주세요.");
         return false;
      }
      
      if($('#password').val() == ""){
         alert("비밀번호를 입력해주세요.");
         return false;
      }
      
      if($('#password').val() != $('#password_ck').val()){
         alert("비밀번호가 일치하지 않습니다.");
         return false;
      }
      
      if($('#email_auth_key').val() != email_auth_cd){
         alert("인증번호가 일치하지 않습니다.");
         return false;
      }
   
      fn_join();
   });
   
   $(".email_auth_btn").click(function(){            
        var email = $('#email').val();
        
        if(email == ''){
           alert("이메일을 입력해주세요.");
           return false;
        }
        
        $.ajax({
         type : "POST",
         url : "emailAuth.do",
         data : {email : email},
         success: function(data){
            alert("인증번호가 발송되었습니다.");
            email_auth_cd = data;
         },
         error: function(data){
            alert("메일 발송에 실패했습니다.");
         }
      }); 
   });
   
   $('#id').focusout(function(){
      var id = $('#id').val();
   
      $.ajax({
         type : "POST",
         url : "idCheck.do",
         data : {id : id},
         success: function(data){
            console.log(data);
            if(data == "Y"){
               $('#id_ck').removeClass("dpn");
            }else{
               $('#id_ck').addClass("dpn");
            }
         },
         error: function(data){
         }
      }); 
   });
   
   $('#nickname').focusout(function(){
      var nickname = $('#nickname').val();
   
      $.ajax({
         type : "POST",
         url : "nicknameCheck.do",
         data : {nickname : nickname},
         success: function(data){
            if(data == "Y"){
               $('#nickname_ck').removeClass("dpn");
            }else{
               $('#nickname_ck').addClass("dpn");
            }
         },
         error: function(data){
         }
      }); 
   });
 });