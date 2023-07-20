/**
 * 
 */

$(function(){
	searchAddress();
});

function searchAddress(){
	$("#addr1, #addr2, #addrBtn").click(function(){
	    new daum.Postcode({
	        oncomplete: function(data) {
	            $("#addr1").val(data.zonecode);
	            $("#addr2").val(data.roadAddress);
	        }
	    }).open();
	});
}