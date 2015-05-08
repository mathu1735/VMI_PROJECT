var stockData;
var modalValue;
var rowLoc;
var idLoc;
var current = new Date();
var twoDigitMonth = ((current.getMonth().length+1) === 1)? (current.getMonth()+1) : '0' + (current.getMonth()+1);
var currentDate = current.getFullYear()+"/"+ twoDigitMonth+ "/" +current.getDate();
//////////////////on click//////////////////
	$('#btnAdd').click(function(){

		modalValue = 'ADD';
		$('#modalAddLocation').modal({
			 show:true,
			 backdrop:'static',
		 });
		clearLocationDatafunc();
	});
	$('#formAddLocation').submit(function() {
		if(modalValue == 'ADD'){
			//alert("add");
			saveAddLocationFunc();
		}
		else if(modalValue == 'EDIT'){
			//alert("edit");
			saveEditLocationFunc(rowLoc,idLoc);
		}
		
		return false;
	});

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
					//alert("find");
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
						
						'<td class="text-center">'+
							'<button type="button" class="btn btn-info" value = "'+i+'" onclick = "editLocationFunc(this,'+i+')">'+'<span>Edit</span>'+'</button>'
							+
						'</td>' +
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

function clearLocationDatafunc(){
	$('#locationName').val('');
	$('#locationCode').val('');
	$('#startQuantity').val('');
	$('#minOfQuantity').val('');
	$('#maxOfQuantity').val('');
	$('#locationAddr').val('');
}

function saveAddLocationFunc(){
	var SLocName = $('#locationName').val();
	var SLocCode = $('#locationCode').val();
	var SLocCurrentQuantity = $('#startQuantity').val();
	var SLocMin = $('#minOfQuantity').val();
	var SLocMax =$('#maxOfQuantity').val();
	var SLocAddress = $('#locationAddr').val();

	var	location = {
			        SLocName: SLocName,
			        SLocCode: SLocCode,
			        SLocCurrentQuantity: SLocCurrentQuantity,
			        SLocMin: SLocMin,
			       	SLocMax:SLocMax,
			       	SLocAddress:SLocAddress,
			       	createdDate:currentDate,
			       	updatedDate:currentDate
			    };


	var addData = $.ajax({
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
	locationDatafunc();
}

function editLocationFunc(row,id){
	//alert(row+";"+id);
	rowLoc = row;
	idLoc = id;
	modalValue = 'EDIT';
	$('#modalAddLocation').modal({
		 show:true,
		 backdrop:'static',
	 });
	clearLocationDatafunc();

	$('#locationModalHeader').empty();
	$('#locationModalHeader').append("Edit Location");
	$("#startQuantityLabel").attr("style", "display:none");
	$("#startQuantity").attr("style", "display:none");
	$('#startQuantity').attr("required", false);
	$('#locationCode').attr('disabled',true);

	var locCode = $(row).parent().parent().children('td:eq(2)').text();
	var locMin = $(row).parent().parent().children('td:eq(3)').text();
	var locMax = $(row).parent().parent().children('td:eq(4)').text();
	var locName  = stockData[id].SLocName;
	var locAddr = stockData[id].SLocAddress;

	$("#locationCode").val(locCode);
	$('#locationName').val(locName);
	$('#minOfQuantity').val(locMin);
	$('#maxOfQuantity').val(locMax);
	$('#locationAddr').val(locAddr);

} 

function saveEditLocationFunc(rowLoc,idLoc){
	var SLocName = $('#locationName').val();
	var SLocCode = $('#locationCode').val();
	var SLocMin = $('#minOfQuantity').val();
	var SLocMax =$('#maxOfQuantity').val();
	var SLocAddress = $('#locationAddr').val();
	var id = stockData[rowLoc.value].id;
	var version = stockData[rowLoc.value].version;
	//alert("id = "+id+"//////version = "+version);

	var	location = {
					id:id,
			        SLocName: SLocName,
			        SLocCode: SLocCode,
			        SLocMin: SLocMin,
			       	SLocMax:SLocMax,
			       	SLocAddress:SLocAddress,
			       	updatedDate:currentDate,
			       	version:version
			    };

	var data = $.ajax({
		type: "PUT",
		contentType: "application/json; charset=utf-8",
		dataType: "json",
		headers: {
        	Accept: "application/json"
        },
		url: session['context'] +'/stocklocations/'+id,
		data :JSON.stringify(location),
		complete: function(xhr) {
			if (xhr.readyState == 4) {
				if (xhr.status == 200) {
					$('#modalAddLocation').modal('hide');
						       		bootbox.dialog({
						       			  closeButton: false,
										  message:" ",
										  title: "<div class='page-header'><h4><center>แก้ไขข้อมูลสำเร็จ</center></h4></div>",
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
										  title: "<div class='page-header'><h4><center>แก้ไขข้อมูลไม่สำเร็จ</center></h4></div>",
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
										  title: "<div class='page-header'><h4><center>แก้ไขข้อมูลไม่สำเร็จ</center></h4></div>",
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
	locationDatafunc();
}