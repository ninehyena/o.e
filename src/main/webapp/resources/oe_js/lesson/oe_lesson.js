/*
	LESSON 관련 JS 작업
 */
 
function regLesson(){
 	location.href = "regLesson";
}

// 레슨 등록
function lessonCheck() {
    
    if($.trim($('#l_category').val()) == '') {
    	Swal.fire({
            icon: 'warning',                         
            title: '음악 카테고리를 입력해 주세요.',
            showCancelButton: false,
            confirmButtonColor: '#3085d6',
            didClose: () => {
            	$('#l_category').focus();
            }
        });
    	
        return false;
    }
       
    return true;
}

//레슨 디테일 등록
function detailCheck() {
   
    if($.trim($('#l_location').val()) == '') {
    	Swal.fire({
            icon: 'warning',                         
            title: '레슨 지역을 입력해 주세요.',
            showCancelButton: false,
            confirmButtonColor: '#3085d6',
            didClose: () => {
            	$('#l_location').focus();
            }
        });
    	
        return false;
    }
    
    
    if($.trim($('#l_content').val()) == '') {
    	Swal.fire({
            icon: 'warning',                         
            title: '레슨 소개를 입력해 주세요.',
            showCancelButton: false,
            confirmButtonColor: '#3085d6',
            didClose: () => {
            	$('#l_content').focus();
            }
        });
    	
        return false;
    }
    
    if($.trim($('#l_pay').val()) == '') {
    	Swal.fire({
            icon: 'warning',                         
            title: '레슨 비용을 입력해 주세요.',
            showCancelButton: false,
            confirmButtonColor: '#3085d6',
            didClose: () => {
            	$('#l_pay').focus();
            }
        });
    	
        return false;
    }
    
    var day = document.getElementsByName('l_day');
    var num = 0;
    
    for(var i = 0; i < day.length; i++) {
    	if(day[i].checked) {
    		num++;
    	}
    }
    
    if(!num) {
    	Swal.fire({
            icon: 'warning',                         
            title: '레슨 가능 요일을 선택해 주세요.',
            showCancelButton: false,
            confirmButtonColor: '#3085d6'
        });
    	
        return false;
    }
    
    return true;    
}

// 레슨 수정
function updateCheck() {
	
	if($.trim($('#l_category').val()) == '') {
    	Swal.fire({
            icon: 'warning',                         
            title: '음악 카테고리를 입력해 주세요.',
            showCancelButton: false,
            confirmButtonColor: '#3085d6',
            didClose: () => {
            	$('#l_category').focus();
            }
        });
    	
        return false;
    }
	
	if($.trim($('#l_location').val()) == '') {
    	Swal.fire({
            icon: 'warning',                         
            title: '레슨 지역을 입력해 주세요.',
            showCancelButton: false,
            confirmButtonColor: '#3085d6',
            didClose: () => {
            	$('#l_location').focus();
            }
        });
    	
        return false;
    }
    
    
    if($.trim($('#l_content').val()) == '') {
    	Swal.fire({
            icon: 'warning',                         
            title: '레슨 소개를 입력해 주세요.',
            showCancelButton: false,
            confirmButtonColor: '#3085d6',
            didClose: () => {
            	$('#l_content').focus();
            }
        });
    	
        return false;
    }
    
    if($.trim($('#l_pay').val()) == '') {
    	Swal.fire({
            icon: 'warning',                         
            title: '레슨 비용을 입력해 주세요.',
            showCancelButton: false,
            confirmButtonColor: '#3085d6',
            didClose: () => {
            	$('#l_pay').focus();
            }
        });
    	
        return false;
    }
    
    var day = document.getElementsByName('l_day');
    var num = 0;
    
    for(var i = 0; i < day.length; i++) {
    	if(day[i].checked) {
    		num++;
    	}
    }
    
    if(!num) {
    	Swal.fire({
            icon: 'warning',                         
            title: '레슨 가능 요일을 선택해 주세요.',
            showCancelButton: false,
            confirmButtonColor: '#3085d6'
        });
    	
        return false;
    }
    
    return true;
}

// 레슨 신청
function apply(l_num) {
	Swal.fire({
        title: '레슨을 신청하시겠습니까?',
        icon: 'question',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: '신청하기',
        cancelButtonText: '돌아가기'
	}).then((result) => {
        if (result.isConfirmed) {
        	Swal.fire({
                icon: 'success',                         
                title: '신청이 완료 되었습니다.',
                showConfirmButton: false
            });
            setTimeout(function() {
            	location.href = "applyLesson?l_num=" + l_num;
			}, 2000);
        }
    });
}

// 레슨 신청 취소
function cancel(l_num) {
	Swal.fire({
        title: '신청을 취소하시겠습니까?',
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: '취소하기',
        cancelButtonText: '돌아가기'
    }).then((result) => {
    	if (result.isConfirmed) {
        	Swal.fire({
                icon: 'success',                         
                title: '취소가 완료되었습니다.',
                showConfirmButton: false
            });
            setTimeout(function() {
            	location.href = "cancelApplication?l_num=" + l_num;
			}, 2000);
        }
    });
}

// 레슨 수정
function updateL(l_num) {
	location.href = "updateLesson?l_num=" + l_num;
}

// 레슨 삭제
function deleteL(l_num) {
	Swal.fire({
        title: '레슨을 삭제하시겠습니까?',
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
            	location.href = "deleteLesson?l_num=" + l_num;
			}, 2000);
        }
    });
}

function lessonDetail(l_num) {
	location.href = "lessonDetail?l_num=" + l_num;
}

function applicationDetail(l_num) {
	location.href = "applicationDetail?l_num=" + l_num;
}

/* 레슨 신청 확인 */
function applicationConfirm(l_num, a_id) {
	Swal.fire({
        title: a_id + '님의 레슨 신청을 수락하시겠습니까?',
        icon: 'question',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: '수락하기',
        cancelButtonText: '돌아가기'
    }).then((result) => {
        if (result.isConfirmed) {
        	$.ajax({
        		url: "confirm",
        		type: "POST",
        		data: {l_num:l_num,
        				'a_id':a_id},
        		success: function(cnt) {
        			if (cnt == 1) {
        				Swal.fire({
        	                icon: 'success',                         
        	                title: '수락이 완료 되었습니다.',
        	                showConfirmButton: false
        	            });
					} else {
						Swal.fire({
	    	                icon: 'error',                         
	    	                title: '수락에 실패하였습니다.',
	    	                showConfirmButton: false
	    	            });
					}
    				
    				setTimeout(function() {
    					location.href = "applicationDetail?l_num=" + l_num;
    				}, 2000);
        		},
        		error : function(e) {
    				Swal.fire({
    	                icon: 'error',                         
    	                title: '수락에 실패하였습니다.',
    	                showConfirmButton: false
    	            });
    				setTimeout(function() {
    					location.href = "applicationDetail?l_num=" + l_num;
    				}, 2000);
        		}
        	});
        	
        }
    });
}

/* 레슨 진행 -> 완료 */
function finishLesson(l_num, a_id) {
	Swal.fire({
        title: a_id + '님의 레슨을 완료하시겠습니까?',
        icon: 'question',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: '완료하기',
        cancelButtonText: '돌아가기'
    }).then((result) => {
        if (result.isConfirmed) {
        	$.ajax({
        		url: "finish",
        		type: "POST",
        		data: {l_num:l_num,
        				a_id:a_id},
        		success: function(cnt) {
        			if (cnt == 1) {
        				Swal.fire({
        	                icon: 'success',                         
        	                title: a_id + '님의 레슨이 완료 되었습니다.',
        	                showConfirmButton: false
        	            });
					} else {
						Swal.fire({
        	                icon: 'error',                         
        	                title: '완료에 실패하였습니다.',
        	                showConfirmButton: false
        	            });
					}
    				setTimeout(function() {
    					location.href = "applicationDetail?l_num=" + l_num;
    				}, 2000);
        		},
        		error : function(e) {
    				Swal.fire({
    	                icon: 'error',                         
    	                title: '완료에 실패하였습니다.',
    	                showConfirmButton: false
    	            });
    				setTimeout(function() {
    					location.href = "applicationDetail?l_num=" + l_num;
    				}, 2000);
        		}
        	});
        	
        }
    });
}

// 리뷰 작성
function writeReview(l_num) {
	location.href = "writeReview?l_num=" + l_num;
}

