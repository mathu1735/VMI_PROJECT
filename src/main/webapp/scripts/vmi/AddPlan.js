	


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