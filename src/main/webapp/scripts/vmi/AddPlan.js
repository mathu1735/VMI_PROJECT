
	$('#btnAddEstimate').click(function(){

		$('#modalAddEstimate').modal({
			 show:true,
			 backdrop:'static',
		 });
	});
	$('#btnStartDate').on('click',function(){
			$('#startDate').datepicker('show');
		});
		$('#startDate').datepicker({
				format: "dd/mm/yyyy",
				todayHighlight: true,
				keyboardNavigation: false,
				forceParse: false,
				autoclose: true,
				useStrict: true
			});

 	$("#startDate").keypress(function(event) {event.preventDefault();});

 	$('#btnEndDate').on('click',function(){
			$('#endDate').datepicker('show');
		});
		$('#endDate').datepicker({
				format: "dd/mm/yyyy",
				todayHighlight: true,
				keyboardNavigation: false,
				forceParse: false,
				autoclose: true,
				useStrict: true
			});

 	$("#endDate").keypress(function(event) {event.preventDefault();});

 	
 // 	$('#formAddEstimate').submit(function() {
 // 		alert("ddd");
	// 	saveAddEstimateFunc();
	// 	return false;
	// });
	$('#btnSaveEstimate').click(function(){
		alert("save");
		saveAddEstimateFunc();
		addDataToTableFunc();
	});




function saveAddEstimateFunc(){
	var s = $('#startDate').val();
	var ss = s.split('/');
	var Start = ss[1]+'/'+ss[0]+'/'+ss[2];
	alert(Start);
	var e = $('#endDate').val();
	var ee = e.split('/');
	var End = ss[1]+'/'+ss[0]+'/'+ss[2];
	var sDate = new Date(Start);
	var eDate = new Date(End);
	//alert(sDate.addDays(1));
	// var estimate ={
	// 	EstiStartDate:Start
	// }
	// var data = $.ajax({
	// 	type: "POST",
	// 	contentType: "application/json; charset=utf-8",
	// 	dataType: "json",
	// 	headers: {
 //        	Accept: "application/json"
 //        },
	// 	url: session['context']+'/estimateusages',
	// 	data :JSON.stringify(purchaseorder),
	// 	complete: function(xhr) {
	// 		if (xhr.readyState == 4) {
	// 			if (xhr.status == 201) {
	// 					bootbox.dialog({
	// 					       			  closeButton: false,
	// 									  message:" ",
	// 									  title: "<div class='page-header'><h4><center>บันทึกข้อมูลสำเร็จ</center></h4></div>",
	// 									  buttons: {
	// 									    success: {
	// 									      label: "<div><center>OK</center></div>",
	// 									      className: "btn-primary",
										      
	// 									    },
	// 									  },
	// 									   className: "modal25",
	// 								});
					
					
	// 			}else{
	// 				bootbox.dialog({
	// 									  closeButton: false,
	// 									  message:" ",
	// 									  title: "<div class='page-header'><h4><center>บันทึกข้อมูลไม่สำเร็จ</center></h4></div>",
	// 									  buttons: {
	// 									    cancel: {
	// 									      label: "<div><center>Cancel</center></div>",
	// 									      className: "btn-danger",
										      
	// 									    },
	// 									  },
	// 									   className: "modal25",
	// 								});
	// 			}
	// 		} else {
	// 			bootbox.dialog({
	// 									  closeButton: false,
	// 									  message:" ",
	// 									  title: "<div class='page-header'><h4><center>บันทึกข้อมูลไม่สำเร็จ</center></h4></div>",
	// 									  buttons: {
	// 									    cancel: {
	// 									      label: "<div><center>Cancel</center></div>",
	// 									      className: "btn-danger",
										      
	// 									    },
	// 									  },
	// 									   className: "modal25",
	// 								});
	// 		}
	// 	},
	// 	async: false
	// });

	
}
function addDataToTableFunc(){

	var s = $('#startDate').val();
	var ss = s.split('/');
	var Start = ss[1]+'/'+ss[0]+'/'+ss[2];
	var e = $('#endDate').val();
	var ee = e.split('/');
	var End = ss[1]+'/'+ss[0]+'/'+ss[2];
	var sDate = new Date(Start);
	var eDate = new Date(End);
	


}