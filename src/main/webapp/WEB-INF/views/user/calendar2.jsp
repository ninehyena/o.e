<%@page import="com.o.e.member.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="gtco-section-v">
	<div class="gtco-container">
		<div class="row">
			<div class="col-md-8 col-md-offset-2 text-center gtco-heading">
				<h2 class="cursive-font primary-color">My Lesson Schedule</h2>
				<input type="hidden" id="m_id" name="m_id"
					value="${sessionScope.loginMember.m_id }">
			</div>
		</div>

		<div id='calendar'></div>
	</div>
</div>
<script>
<% Member m = (Member) request.getSession().getAttribute("loginMember");%>
var m_id = $("#m_id").val();
let ar = [];
var select = '';

for(i = 0; i < 24; i++) {
	if (i < 10) {
		select += '<option>0' + i + ':00</option>';
	} else {
		select += '<option>' + i + ':00</option>';
	}
}

var list = '';
$.ajax({
	url: "getStuList",
	type: "GET",
	dataType:"JSON",
	success: function(data) {
		if (data.length != 0) {
			list += '<select id="title" class="form-control">';
			for (var key in data) {
				list += '<option>' + data[key].a_id + '님 ' + data[key].lesson.l_category + ' 레슨' + '</option>';
			}
			list += '</select>';
		} else {
			list += '<input type="text" id="title" class="form-control">';
		}
	}
});


 $.ajax({
		url: "mySchedule",
		type: "GET",
		data: {m_id:m_id},
		dataType:"JSON",
		success: function(data) {
			for (var key in data) {
				ar[key] = {
						title: data[key].s_title,
						start: data[key].s_start,
						end: data[key].s_end,
						backgroundColor:"#FBB448",
						borderColor: "#FBB448"
				}
			}
		}
	});
	/* Date 포맷 처리 */
    function dateFormat(date, time) {
        let month = date.getMonth() + 1;
        let day = date.getDate();
        let times = time.split(":");
        let hour = times[0];
        let minute = times[1];

        month = month >= 10 ? month : '0' + month;
        day = day >= 10 ? day : '0' + day;

        return date.getFullYear() + '-' + month + '-' + day + ' ' + hour + ':00:00';
	}
	
    function dateFormat2(date, time) {
        let month = date.getMonth() + 1;
        let day = date.getDate() - 1;
        let times = time.split(":");
        let hour = times[0];
        let minute = times[1];

        month = month >= 10 ? month : '0' + month;
        day = day >= 10 ? day : '0' + day;

        return date.getFullYear() + '-' + month + '-' + day + ' ' + hour + ':00:00';
	}
	
    function dateFormat3(date) {
        let month = date.getMonth() + 1;
        let day = date.getDate();
        let hour = date.getHours();
        let minute = date.getMinutes();
        let second = date.getSeconds();

        month = month >= 10 ? month : '0' + month;
        day = day >= 10 ? day : '0' + day;
        hour = hour >= 10 ? hour : '0' + hour;
        minute = minute >= 10 ? minute : '0' + minute;
        second = second >= 10 ? second : '0' + second;

        return date.getFullYear() + '-' + month + '-' + day + ' ' + hour + ':' + minute + ':' + second;
	}
    
    function dateFormat4(date) {
        let hour = date.getHours();

        hour = hour >= 10 ? hour : '0' + hour;

        return hour +":00";
	}
    
	document.addEventListener('DOMContentLoaded', function() {
    	var calendarEl = document.getElementById('calendar');
        var calendar = new FullCalendar.Calendar(calendarEl, {
            // Tool Bar 목록 document : https://fullcalendar.io/docs/toolbar
            headerToolbar: {
                left: 'prev,next',
                center: 'title',
                right: 'dayGridMonth,dayGridWeek,dayGridDay'
            },
			locale: 'ko', // 한국어 설정
            selectable: true,
            selectMirror: true,

            navLinks: true, // can click day/week names to navigate views
            editable: true,
           
            // Create new event
            <%if (m.getM_lesson().equals("lesson")) {%>
            select: function (arg) {
            	Swal.fire({
                    title: "등록하실 일정의 정보를 입력해 주세요.",
                    html: '<div style="text-align:left;"><label class="primary-color">일정명</label></div>' + list +
                    '<select id="sTime" class="form-control w50">' + select + '</select>' +
                    '<select id="eTime" class="form-control w50">' + select + '</select>',
                    showCancelButton: true,
                    buttonsStyling: false,
                    confirmButtonText: "등록하기",
                    cancelButtonText: "돌아가기",
                    customClass: {
                        confirmButton: "btn btn-primary",
                        cancelButton: "btn btn-active-light"
                    }
                }).then(function (result) {
                    if (result.value) {
                    	var title = $("#title").val();
                    	var sTime = $("#sTime").val();
                    	var eTime = $("#eTime").val();
                    	var a_id = title.split("님")[0];
                    	var start = dateFormat(arg.start, sTime);
                    	var end = dateFormat2(arg.end, eTime);
                        // title 값이 있을때, 화면에 calendar.addEvent() json형식으로 일정을 추가
                        if (title) {
                          calendar.addEvent({
                            title: title,
                            start: start,
                            end: end,
                            allDay: false,
                            backgroundColor:"#FBB448",
                            borderColor: "#FBB448"
                          });
                          $.ajax({
                      		url: "myCalendar",
                      		type: "POST",
                      		data: {
                      			a_id:a_id,
                      			title:title,
                      			start:start,
                      			end:end,
                      			sTime:sTime,
                      			eTime:eTime},
                
                      		});
                        }
                    }
                });
            	
                calendar.unselect()
            },
            <%}%>

            dayMaxEvents: true, // allow "more" link when too many events
            // 이벤트 객체 필드 document : https://fullcalendar.io/docs/event-object
        	
            eventMouseEnter: function (arg) {
            	Swal.fire({
                    title: '<div class="primary-color">' + dateFormat4(arg.event.start) + " - " + dateFormat4(arg.event.end) + "&nbsp;" + arg.event.title + "</div>",
                    buttonsStyling: false,
                    showCancelButton: true,
                    <%if (m.getM_lesson().equals("not_lesson")) {%>
                    showConfirmButton: false,
					<%}%>
                    confirmButtonText: "삭제",
                    cancelButtonText: "닫기",
                    customClass: {
                        confirmButton: "btn btn-danger",
                        cancelButton: "btn btn-active-light"
                    }
                }).then(function (result) {
                    if (result.value) {
                    	Swal.fire({
                            title: "해당 일정을 삭제하시겠어요?",
                            icon: "warning",
                            showCancelButton: true,
                            buttonsStyling: false,
                            confirmButtonText: "삭제하기",
                            cancelButtonText: "돌아가기",
                            customClass: {
                                confirmButton: "btn btn-primary",
                                cancelButton: "btn btn-active-light"
                            }
                        }).then(function (result) {
                            if (result.value) {
                            	$.ajax({
                            		url: "deleteSchedule",
                            		type: "POST",
                            		data: {title: arg.event.title,
                            			start:dateFormat3(arg.event.start)},
                            		success: function(cnt) {
                            			if (cnt > 0) {
    	                            		arg.event.remove()
    	                            		Swal.fire({
    			                                text: "일정이 삭제되었습니다.",
    			                                icon: "success",
    			                                buttonsStyling: false,
    			                                confirmButtonText: "닫기",
    			                                customClass: {
    			                                    confirmButton: "btn btn-primary",
    			                                }
    			                            });
    									} else {
    										Swal.fire({
    			                                text: "일정 삭제에 실패했습니다.",
    			                                icon: "error",
    			                                buttonsStyling: false,
    			                                confirmButtonText: "닫기",
    			                                customClass: {
    			                                    confirmButton: "btn btn-primary",
    			                                }
    			                            });
    									}
                            		} 
                            	});
                            } else if (result.dismiss === "cancel") {
                                Swal.fire({
                                    text: "일정 삭제에 실패했습니다.",
                                    icon: "error",
                                    buttonsStyling: false,
                                    confirmButtonText: "확인",
                                    customClass: {
                                        confirmButton: "btn btn-primary",
                                    }
                                });
                            }
                        });
                    }
                });
            },
          
            events: ar
            
        });
       
        calendar.render();
   
	});

    </script>