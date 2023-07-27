// 공지사항 삭제
function deleteNotice(n_no) {
	Swal.fire({
        title: '공지사항을 삭제하시겠습니까?',
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: '삭제하기',
        cancelButtonText: '돌아가기'
    }).then((result) => {
    	if (result.isConfirmed) {
        	Swal.fire({
                icon: 'success',                         
                title: '삭제가 완료되었습니다.',
                showConfirmButton: false
            });
            setTimeout(function() {
            	location.href = "deleteNotice?n_no=" + n_no;
			}, 2000);
        }
    });
}

// 정보글 삭제
function deleteBoard(b_no) {
	Swal.fire({
        title: '정보글을 삭제하시겠습니까?',
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: '삭제하기',
        cancelButtonText: '돌아가기'
    }).then((result) => {
    	if (result.isConfirmed) {
        	Swal.fire({
                icon: 'success',                         
                title: '삭제가 완료되었습니다.',
                showConfirmButton: false
            });
            setTimeout(function() {
            	location.href = "deleteBoard?b_no=" + b_no;
			}, 2000);
        }
    });
}