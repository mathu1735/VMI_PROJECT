 var stockData;

 	
////////////////////////show data/////////////////////
locationDatafunc();
function locationDatafunc(){

	stockData = $.ajax({
	contentType: "application/json; charset=utf-8",
	dataType: "json",
	headers: {
        Accept: "application/json"
       },
	//url: '/vmi/stocklocations?page=1&size=10',
	url : session['context']+'/stocklocations',
	data :{

	},
	complete: function(xhr) {
		if (xhr.readyState == 4) {
			if (xhr.status == 200) {
					alert("find");
				responseHeader = xhr.getResponseHeader('Location');
			}else{
					alert("fail");
			}
			} 
		},
	async: false
	}).responseJSON;
	$("#LocTableBody").empty();
	for(var i=0;i<stockData.length;i++){
	
	    	var no = i+1;
	    	var SLocCode = stockData[i].SLocCode;
	    	var SLocCurrentQuantity = stockData[i].SLocCurrentQuantity;
	    	var SLocMin = stockData[i].SLocMin;
	    	var SLocMax = stockData[i].SLocMax;


			$('#LocTableBody').append('<tr id ='+'row'+i+'>' +
						// '<td class="text-center">'+
						// 	'<input class = "checkboxfordelete" type="checkbox" name="del" value = '+i+'>'
						// 	+
					 // 	'</td>' +
						// '<td class="text-center">'+
						// 	'<button type="button" class="btn btn-info" value = "'+i+'" onclick = "editChild(this,'+i+')">'+'<span class="fa fa-pencil"><jsp:text/></span>'+'</button>'
						// 	+
						// '</td>' +
						'<td class="text-center">'+
							no +
						'</td>' +
						'<td class="text-center">'+
							SLocCode+
						'</td>' +
						'<td class="text-center">'+
							SLocMin+
						'</td>' +
						'<td class="text-center">'+
							SLocMax+
						'</td>' +
						'<td class="text-center">'+
							SLocCurrentQuantity+
						'</td>' +
						
					'</tr>');

	}

}

	$('#btnAdd').click(function(){

		$('#modalAddLocation').modal({
			 show:true,
			 backdrop:'static',
		 });
	});
	$('#formAddLocation').submit(function() {
		saveAddLocationFunc();
		return false;
	});

function saveAddLocationFunc(){
	var SLocName = $('#locationName').val();
	var SLocCode = $('#locationCode').val();
	var SLocCurrentQuantity = $('#startQuantity').val();
	var SLocMin = $('#minOfQuantity').val();
	var SLocMax =$('#maxOfQuantity').val();

	var	location = {
			        SLocName: SLocName,
			        SLocCode: SLocCode,
			        SLocCurrentQuantity: SLocCurrentQuantity,
			        SLocMin: SLocMin,
			       	SLocMax:SLocMax
			    };

	var data = $.ajax({
		type: "POST",
		contentType: "application/json; charset=utf-8",
		dataType: "json",
		headers: {
        	Accept: "application/json"
        },
		url: session['context']+'/stocklocations',
		data :JSON.stringify(location),
		complete: function(xhr) {
			if (xhr.readyState == 4) {
				if (xhr.status == 201) {
					
					$('#modalAddLocation').modal('hide');
						       		bootbox.dialog({
						       			  closeButton: false,
										  message:" ",
										  title: "<div class='page-header'><h4><center>บันทึกข้อมูลสำเร็จ</center></h4></div>",
										  buttons: {
										    success: {
										      label: "<div><center>OK</center></div>",
										      className: "btn-primary",
										      
										    },
										  },
										   className: "modal25",
									});
					
					
				}else{
					$('#modalAddLocation').modal('hide');
					bootbox.dialog({
										  closeButton: false,
										  message:" ",
										  title: "<div class='page-header'><h4><center>บันทึกข้อมูลไม่สำเร็จ</center></h4></div>",
										  buttons: {
										    cancel: {
										      label: "<div><center>Cancel</center></div>",
										      className: "btn-danger",
										      
										    },
										  },
										   className: "modal25",
									});
				}
			} else {
				$('#modalAddLocation').modal('hide');
				bootbox.dialog({
										  closeButton: false,
										  message:" ",
										  title: "<div class='page-header'><h4><center>บันทึกข้อมูลไม่สำเร็จ</center></h4></div>",
										  buttons: {
										    cancel: {
										      label: "<div><center>Cancel</center></div>",
										      className: "btn-danger",
										      
										    },
										  },
										   className: "modal25",
									});
			}
		},
		async: false
	});
}
