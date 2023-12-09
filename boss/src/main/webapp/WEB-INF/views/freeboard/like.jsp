<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script>
	$(function() {
		var likeval = '${like.likeDrop}'
		console.log(likeval);

		console.log("session:" + '${sessionScope.member.mEmail}');
		console.log("member.mEmail:" + '${member.mEmail}');
		// 좋아요를 누른 사용자의 email 주소 구하기
		console.log("mEmail:" + '${like.mEmail}');
		//	console.log("like_email:"+ '${like_email.mEmail}');

		// likeval이 Y이면 좋아요가 이미 되있는것이므로 fill-heart.svg를 출력하는 코드
		// if(likeval == 'Y') {
		if (likeval == 'Y'
				&& '${sessionScope.member.mEmail}' == '${like.mEmail}') {
			//        if(likeval == 'N' &&  '${sessionScope.member.mEmail}' == '${like_email.mEmail}' ) {
			console.log(likeval);
			$("#heart").prop("src", "images/fill-heart.png");
			//   $("#heart").html("좋아요"+${detail.fLike}+"개");
		} else {
			console.log(likeval);
			$("#heart").prop("src", "images/bin-heart.png");
			//    $("#heart").html("좋아요"+${detail.fLike}+"개");
		}
		// 좋아요 버튼을 클릭 시 실행되는 코드
//         $(".heart").on("click", function () {
//          	if('${sessionScope.member}' == ''){
//  		 		alert("로그인 후에 이용 해주세요.");
//  		 		return false;
//  	 	    }
// 		    $.ajax({
// 		    	url :'toggleLike.do',
// 		        type :'POST',
// 		        data : {'fId':'${detail.fId}', 'mEmail':'${sessionScope.member.mEmail}', 'likeDrop':'${like.likeDrop}'},
// 		    	success : function(data){
		    		
// 		    		console.log("data:"+ data);
// 		    		console.log("data.like.likeDrop:"+ data.like.likeDrop);
// 		    		console.log("data.result:"+ data.result);
// 		    		console.log("fLike:"+ data.fboard.fLike);
		    		
// 		    		$("#div_fLike").text(data.fboard.fLike);
		    		
// 		        	if('${data.like.likeDrop}' == 'Y') {
//             	     $('#heart').prop("src","images/fill-heart.png");
// 		        	} else {
//                    	 $('#heart').prop("src","images/bin-heart.png");
// 		        	}
//              	}
// 		    });
//         });
     });
</script>




</head>
<body>
	<a class="heart" style="text-decoration-line: none; cursor: pointer;">
		<img id="heart" src="images/bin-heart.png">
	</a>
</body>
</html>