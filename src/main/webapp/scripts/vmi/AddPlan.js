
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

		saveAddEstimateFunc();
		addDataToTableFunc();
	});




function saveAddEstimateFunc(){
	var s = $('#startDate').val();
	var ss = s.split('/');
	var Start = ss[1]+'/'+ss[0]+'/'+ss[2];
	var e = $('#endDate').val();
	var ee = e.split('/');
	var End = ss[1]+'/'+ss[0]+'/'+ss[2];
	var sDate = new Date(Start);
	var eDate = new Date(End);
	alert(sDate.addDays(1));

	
}
function addDataToTableFunc(){

}