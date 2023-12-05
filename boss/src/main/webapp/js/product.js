/**
 *  리뷰 작성 처리 및 수정
 */
 
$(document).ready(function(){
	
	$("#review_insert_button").click(function() {
		
		if($('#rwriter').val() == ""){
			alert("작성자를 입력해주세요.");
			return false;
		}
		if($('#rtitle').val() == ""){
			alert("제목을 입력해주세요.");
			return false;
		}
		if($('#rimage1').val() == ""){
			alert("이미지를 입력해주세요.");
			return false;
		}
		if($('#rcontent').val() == ""){
			alert("내용을 입력해주세요.");
			return false;
		}
	});
	
}); /* review_insert_button end */
      