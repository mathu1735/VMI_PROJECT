var poMovementData;

////////////load Data/////////////////////
loadPOMovementDataFunction();
function loadPOMovementDataFunction(){
	poMovementData = $.ajax({
	contentType: "application/json; charset=utf-8",
	dataType: "json",
	headers: {
        Accept: "application/json"
       },
	//url: '/vmi/stocklocations?page=1&size=10',
	url : session['context']+'/purchaseorderdeliverys',
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

	$("#poMoveBody").empty();
	for(var i=0;i<poMovementData.length;i++){
		var poCode = poData[i].POCode;
		var startquantity = poData[i].POQuantity;
		var receiveQuantity = poData[i].POUsageQuantity;
		var balanceQuantity = poData[i].POCurrentQuantity;
		var date = new Date(poData[i].updatedDate).format('dd/mm/yyyy');
		$('#poMoveBody').append('<tr id ='+'row'+i+'>' +
				
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
						

						
					'</tr>');
	}

}
