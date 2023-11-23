//장바구니담기
		$(function() {
			//var mEmail = $("#mEmail").val();
			//장바구니에 들어갈 값 모두 jason으로 가져가기 (1,10번 컬럼뺴고)
			//var pId = $("#pId").val();
	
			$("#bucket").click(function() {
				alert("장바구니");
			
				$.ajax({
					type : "post",
					url : "bucketInsert.do",
					data : {
					        "pId" : 3},
				    	success : function(result) {
						if (result.trim() == 'add_success') {
							var check = confirm("카트에 등록되었습니다.");
							if (check) {
								location.assign("bucketList.do");
							}else{
								  return false;
							}
						} else if (result.trim() == 'already_existed') {
							alert("이미 카트에 등록된 상품입니다.");
						}
					}
				});
			});
		});
		
		//바로구매
			$(function() {
				$("#buy").click(function() {
					location.href ="order.do";
				});
			});