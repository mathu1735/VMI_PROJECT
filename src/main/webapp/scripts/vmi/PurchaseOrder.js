var poData;

////////////load Data/////////////////////
loadPODataFunction();
function loadPODataFunction(){
	poData = $.ajax({
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
					alert("find");
				responseHeader = xhr.getResponseHeader('Location');
			}else{
					alert("fail");
			}
			} 
		},
	async: false
	}).responseJSON;

	$("#POBody").empty();
	for(var i=0;i<poData.length;i++){
		var poCode = poData[i].POCode;
		var startquantity = poData[i].POQuantity;
		var receiveQuantity = poData[i].POUsageQuantity;
		var balanceQuantity = poData[i].POCurrentQuantity;
		var date = new Date(poData[i].updatedDate).format('dd/mm/yyyy');
		$('#POBody').append('<tr id ='+'row'+i+'>' +
				
						'<td class="text-center">'+
							 poCode+//PO NO.
						'</td>' +
						'<td class="text-center">'+
							startquantity+//Initial Quantity PO
						'</td>' +
						'<td class="text-center">'+
							receiveQuantity+//Receive Quantity
						'</td>' +
						'<td class="text-center">'+
							balanceQuantity+//Balance Quantity
						'</td>' +
						'<td class="text-center">'+
							 date+//Lastest Update
						'</td>' +

						
					'</tr>');
	}

}
