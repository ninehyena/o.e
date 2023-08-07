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
    
    if($.trim($('#l_photo').val()) == '') {
    	Swal.fire({
            icon: 'warning',                         
            title: '프로필 사진을 선택해 주세요.',
            showCancelButton: false,
            confirmButtonColor: '#3085d6',
            didClose: () => {
            	$('#l_photo').focus();
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
        confirmButtonColor: '#d33',
        cancelButtonColor: '#3085d6',
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
        confirmButtonColor: '#d33',
        cancelButtonColor: '#3085d6',
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
function applicationConfirm(l_num, a_id, nickname) {
	Swal.fire({
        title: nickname + '님의 레슨 신청을 수락하시겠습니까?',
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
function finishLesson(l_num, a_id, nickname) {
	Swal.fire({
        title: nickname + '님의 레슨을 완료하시겠습니까?',
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
        	                title: nickname + '님의 레슨이 완료 되었습니다.',
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

function reviewDetail(r_num) {	
	$.ajax({
		url: "reviewDetail",
		type: "GET",
		data: {r_num:r_num},
		dataType: "json",
		success: function(data) {
			data.r_content = data.r_content.replace("\r\n", "<br>");
			Swal.fire({
                html: '<div style="margin: auto; text-align: left; margin-top: 50px;"><p style="margin: auto;"><b>' + data.r_content + '</b></p></div>',
                showConfirmButton: true,
                confirmButtonText: '닫기',
                confirmButtonColor: '#FBB448',
                width: 600,
                customClass: 'swal-height'
            });
		},
		error : function(e) {
			Swal.fire({
                icon: 'error',                         
                title: '리뷰를 읽어오는데 실패하였습니다.',
                showConfirmButton: true
            });
		}
	});
}

function updateReview(l_num, r_num) {
	location.href = "updateReview?l_num=" + l_num + "&r_num=" + r_num;
}

// 댓글
$(function() {
	 $('tr[id^=cmtCmt]').each(function(){
	        $(this).hide();
	    });
	
	
	$("[id='regC']").click(function() {
		$(this).closest("tr").next().slideToggle();
		let text = $(this).text();
		let text2 = "답글 작성";
		if (text == text2) {
			$(this).text("작성 취소");
		} else {
			$(this).text("답글 작성");
		}
		
	});
	
	$("[id='update']").click(function() {
		let con = $(this).closest("tr").next().children("#content");
		let text = con.text();
		//alert(text);
		
		let c_num = $(this).prev().val();
		
		let cc_num = $("input[name='c_num']").val();
		let l_num = $("input[name='l_num']").val();
		
		let parent = $(this).closest("tr").next();
		parent.empty();
		parent.append('<td><textarea autofocus="autofocus" name="c_content" autocomplete="off" maxlength="200" class="updateArea">'
						+ text + '</textarea></td>');
		let textarea = $(".updateArea").text();
		parent.append('<td align="right" valign="middle"><c:if test="${sessionScope.loginMember != null }"><button type="button" class="updateBtn">수정</button></c:if></td>');
		
		$("[class='updateBtn']").click(function() {
			let c_content = $(this).closest("td").prev().children(".updateArea").val();
			// alert(c_content);
			updateCmt(l_num, c_num, c_content);
		});
	}); 
});

function updateCmt(l_num, c_num, c_content) {
	
	Swal.fire({
        title: '댓글을 수정하시겠습니까?',
        icon: 'question',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: '수정하기',
        cancelButtonText: '돌아가기'
    }).then((result) => {
        if (result.isConfirmed) {
        	$.ajax({
    			url : "updateCmt",
    			type : 'POST',
    			data : {
    				l_num : l_num,
    				c_num : c_num,
    				c_content : c_content
    			},
        		success: function(cnt) {
        			if (cnt == 1) {
        				Swal.fire({
        	                icon: 'success',                         
        	                title: '댓글이 수정되었습니다.',
        	                showConfirmButton: false
        	            });
					} else {
						Swal.fire({
        	                icon: 'error',                         
        	                title: '수정에 실패하였습니다.',
        	                showConfirmButton: false
        	            });
					}
    				setTimeout(function() {
    					location.href = "lessonDetail?l_num=" + l_num;
    				}, 2000);
        		},
        		error : function(e) {
    				Swal.fire({
    	                icon: 'error',                         
    	                title: '수정에 실패하였습니다.',
    	                showConfirmButton: false
    	            });
    				setTimeout(function() {
    					location.href = "lessonDetail?l_num=" + l_num;
    				}, 2000);
        		}
        	});
        	
        } else {
        	return false;
        }
    });
}

function deleteC(l_num, c_num) {

	Swal.fire({
        title: '댓글을 삭제하시겠습니까?',
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#d33',
        cancelButtonColor: '#3085d6',
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
            	location.href = "deleteCmt?l_num=" + l_num + "&c_num=" + c_num;
			}, 2000);
        } else {
        	return false;
        }
    });
}

//레슨 삭제
function deleteReview(l_num, r_num) {
	Swal.fire({
        title: '리뷰를 삭제하시겠습니까?',
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
            	location.href = "deleteReview?l_num=" + l_num + "&r_num=" + r_num;
			}, 2000);
        }
    });
}

