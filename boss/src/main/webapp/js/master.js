

 
	// JavaScript로 특정 열의 크기 동적 조절
	document.addEventListener('DOMContentLoaded', function() {
		// 테이블의 모든 행을 가져옴
		var rows = document.querySelectorAll('table tr');

		// 첫 번째 행의 모든 셀을 가져옴
		var cells = rows[0].querySelectorAll('td');

		// 각 셀의 너비를 첫 번째 행의 셀의 글자 크기에 맞게 동적으로 조절
		cells.forEach(function(cell, index) {
			cell.style.width = (cell.textContent.length * 12) + 'px'; // 글자 크기 * 추정된 폭
		});
	});



	// 입력 필드 크기를 동적으로 조절하는 함수
	function adjustInputSize(inputElement) {
		const textLength = inputElement.value.length;
		const minWidth = 30; // 최소 너비
		const maxWidth = 150; // 최대 너비

		// 입력된 글자 수에 따라 동적으로 크기 조절
		const newWidth = Math
				.min(maxWidth, Math.max(minWidth, textLength * 10));
		inputElement.style.width = newWidth + 'px';
	}


// 체크박스 전체선택/해제 

	$(document).ready(
			function() {
				$('.check-all-checkbox')
						.click(
								function() {
									var checkboxes = $(this).closest('table')
											.find('input[type="checkbox"]');
									checkboxes.prop('checked', $(this).prop(
											'checked'));
								});
			});

			

    
		
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			