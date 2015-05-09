 var purchaseOrderData;
var current = new Date();
var twoDigitMonth = ((current.getMonth().length+1) === 1)? (current.getMonth()+1) : '0' + (current.getMonth()+1);
current.setFullYear(current.getFullYear()+543);
var currentDate = twoDigitMonth + "/" +current.getDate() +"/" + current.getFullYear();


////////////////regular expression////////////////
$('#PONumber').bind('keyup', function () {
		 	var x = $('#PONumber').val();   
		    var regEx = /^[0-9\b]+$/;   
		    if(!x.match(regEx)){
		    	$('#PONumber').val("");   
	}
});
$('#quantityOfPO').bind('keyup', function () {
		 	var x = $('#quantityOfPO').val();   
		    var regEx = /^[0-9\b]+$/;   
		    if(!x.match(regEx)){
		    	$('#quantityOfPO').val("");   
	}
});
/////////////form submit data///////////////////////

// $('#formAddPO').submit(function() {
// 	saveAddPOFunc();
// 	return false;
// }); 

$('#btnAddPOSubmit').on('click',function(){
	saveAddPOFunc();
});
////////////////////////show data/////////////////////
purchaseOrderDatafunc();
function purchaseOrderDatafunc(){

	purchaseOrderData = $.ajax({
	contentType: "application/json; charset=utf-8",
	dataType: "json",
	headers: {
        Accept: "application/json"
       },
	//url: '/vmi/stocklocations?page=1&size=10',
	url : session['context']+'/purchaseorders',
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
	$("#addPOBody").empty();
	for(var i=0;i<purchaseOrderData.length;i++){
	
		var POCode = purchaseOrderData[i].POCode;
		var startQuantity = purchaseOrderData[i].POQuantity;
		var receiveQuantity  = purchaseOrderData[i].POUsageQuantity==null?"-":purchaseOrderData[i].POUsageQuantity; 
		var balanceQuantity = purchaseOrderData[i].POCurrentQuantity==null?"-":purchaseOrderData[i].POCurrentQuantity; 
		var lastestUpdate = purchaseOrderData[i].updatedDate==null?"-":new Date(purchaseOrderData[i].updatedDate).format('dd/mm/yyyy');


			$('#addPOBody').append('<tr id ='+'row'+i+'>' +

						'<td class="text-center">'+
							POCode +
						'</td>' +
						'<td class="text-center">'+
							startQuantity+
						'</td>' +
						'<td class="text-center">'+
							receiveQuantity+
						'</td>' +
						'<td class="text-center">'+
							balanceQuantity+
						'</td>' +
						'<td class="text-center">'+
							lastestUpdate+
						'</td>' +
						
					'</tr>');

	}

}


function saveAddPOFunc(){
	//alert("saveAddPOFunc");
	var POCode = $('#PONumber').val();
	var POQuantity = $('#quantityOfPO').val();
	var	purchaseorder = {
			        POCode: POCode,
			        POQuantity: POQuantity,
			        updatedDate: currentDate,
			        createdDate: currentDate
			        
			    };

	var data = $.ajax({
		type: "POST",
		contentType: "application/json; charset=utf-8",
		dataType: "json",
		headers: {
        	Accept: "application/json"
        },
		url: session['context']+'/purchaseorders',
		data :JSON.stringify(purchaseorder),
		complete: function(xhr) {
			if (xhr.readyState == 4) {
				if (xhr.status == 201) {
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
 purchaseOrderDatafunc();
}
