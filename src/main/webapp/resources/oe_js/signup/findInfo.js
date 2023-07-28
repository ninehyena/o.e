/*
	아이디 / 비밀번호 찾기 관련 JS
 */

function idFind() {
	Swal.fire({
        title: '<h2 class="primary-color"><b>아이디 찾기</b></h2>',
        html: '<label for="m_email" class="primary-color"><b>가입 시 사용한 이메일을 입력하세요</b></label>' +
					'<input name="m_email" id="m_email" autofocus="autofocus" class="form-control"' + 
		 				'autocomplete="off" placeholder="가입 시 사용한 이메일을 입력하세요">',
        showCancelButton: true,
        confirmButtonColor: '#FBB448',
        cancelButtonColor: '#d33',
        confirmButtonText: '아이디 찾기',
        cancelButtonText: '돌아가기'
    }).then((result) => {
        if (result.isConfirmed) {
        	var m_email = $("#m_email").val();
        	let timerInterval
        	Swal.fire({
        	  title: '아이디를 찾고 있어요.',
        	  timer: 2000,
        	  timerProgressBar: true,
        	  didOpen: () => {
        	    Swal.showLoading()
        	    
        	  },
        	  willClose: () => {
        	    clearInterval(timerInterval)
        	  }
        	}).then((result) => {
            	$.ajax({
            		url: "idFind.do",
            		type: "GET",
            		data: {m_email:m_email},
            		success: function(data) {
            			if (data.length == 0) {
    						Swal.fire({
    	    	                icon: 'error',                         
    	    	                title: '가입 정보가 없습니다.',
    	    	                showConfirmButton: true,
    	    	                confirmButtonText: '회원가입'
    	    	            }).then((result) => {
            	                if (result.isConfirmed) {
            	                	location.href = "registerAgree";
            	                }
            	            });
            			} else if (data != null) {
            				Swal.fire({
            	                icon: 'success',                         
            	                title: '회원님의 아이디는<br>\'' + data + '\'입니다.',
            	                showConfirmButton: true,
            	                confirmButtonColor: '#3085d6',
            	                confirmButtonText: '돌아가기'
            	            });
    					} 
            		},
            		error : function(e) {
        				Swal.fire({
        	                icon: 'error',                         
        	                title: '정보 조회에 실패하였습니다.',
        	                showConfirmButton: false
        	            });
        				setTimeout(function() {
        					location.href = "idFind";
        				}, 2000);
            		}
            	});
        		
        	});
        	
        	
        	
        }
    });
}

function pwFind() {
	Swal.fire({
        title: '<h2 class="primary-color"><b>비밀번호 찾기</b></h2>',
        html: '<div style="text-align:left;"><label class="primary-color"><b>아이디를 입력하세요</b></label></div>' +
				'<input name="f_id" id="f_id" autofocus="autofocus" class="form-control"' + 
		 			'autocomplete="off">' +
		 			'<div style="text-align:left;"><label class="primary-color"><b>이메일을 입력하세요</b></label></div>' +
					'<input name="m_email" id="m_email" autofocus="autofocus" class="form-control"' + 
			 		'autocomplete="off">',
        showCancelButton: true,
        confirmButtonColor: '#FBB448',
        cancelButtonColor: '#d33',
        confirmButtonText: '찾기',
        cancelButtonText: '돌아가기'
    }).then((result) => {
        if (result.isConfirmed) {
        	var m_id = $("#f_id").val();
        	var m_email = $("#m_email").val();
        	let timerInterval
        	Swal.fire({
        	  title: '가입 정보를 찾고 있어요.',
        	  timer: 2000,
        	  timerProgressBar: true,
        	  didOpen: () => {
        	    Swal.showLoading()
        	    
        	  },
        	  willClose: () => {
        	    clearInterval(timerInterval)
        	  }
        	}).then((result) => {
            	$.ajax({
            		url: "pwFind.do",
            		type: "POST",
            		data : {
        				m_id : m_id,
        				m_email : m_email
        			},
            		success: function(data) {
            			if (data === "아이디가 없습니다.") {
            				Swal.fire({
            	                icon: 'error',                         
            	                title: '아이디를 다시 확인해 주세요.',
            	                showConfirmButton: true,
            	                confirmButtonColor: '#3085d6',
            	                confirmButtonText: '돌아가기'
            	            });
    					} else if (data === "이메일이 없습니다.") {
            				Swal.fire({
            	                icon: 'error',                         
            	                title: '이메일을 다시 확인해 주세요.',
            	                showConfirmButton: true,
            	                confirmButtonColor: '#3085d6',
            	                confirmButtonText: '돌아가기'
            	            });
    					} else if (data === "아이디&이메일 불일치") {
            				Swal.fire({
            	                icon: 'error',                         
            	                title: '가입 정보가 없습니다.',
            	                showConfirmButton: true,
            	                confirmButtonColor: '#3085d6',
            	                confirmButtonText: '회원가입'
            	            }).then((result) => {
            	                if (result.isConfirmed) {
            	                	location.href = "registerAgree";
            	                }
            	            });
    					} else if (data === "이메일 발송") {
            				Swal.fire({
            	                icon: 'success',                         
            	                title: '임시 비밀번호가 이메일로 발송되었습니다.<br><p>메일함을 확인해 주세요.</p>',
            	                showConfirmButton: true,
            	                confirmButtonColor: '#3085d6',
            	                confirmButtonText: '돌아가기'
            	            });
    					}
            		},
            		error : function(e) {
        				Swal.fire({
        	                icon: 'error',                         
        	                title: '정보 조회에 실패하였습니다.',
        	                showConfirmButton: false
        	            });
        				setTimeout(function() {
        					location.href = "/e";
        				}, 2000);
            		}
            	});
        		
        	});
        	
        	
        	
        }
    });
}