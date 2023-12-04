 $(document).ready(function() {
 	$('#modify').click(function(){
      
      if($('#mPwd').val() == ""){
         alert("비밀번호를 입력해주세요.");
         return false;
      }
      
      if($('#mPhone').val() == ""){
         alert("핸드폰 번호를 입력해주세요.");
         return false;
      }
      
      if($('#mPost').val() == ""){
         alert("우편번호를 입력해주세요.");
         return false;
      }
      
      if($('#mAddress').val() == ""){
         alert("주소를 입력해주세요.");
         return false;
      }
   
   });
 }); 