alert("move");
var stockmovementData='';
//alert("move");
loadStockMovementDatafunc();
function loadStockMovementDatafunc(){

	stockmovementData = $.ajax({
	contentType: "application/json; charset=utf-8",
	dataType: "json",
	headers: {
        Accept: "application/json"
       },
	//url: '/vmi/stocklocations?page=1&size=10',
	url : session['context']+'/stockmovements',
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

	$("#stockMoveBody").empty();
	for(var i=0;i<stockmovementData.length;i++){

			var date = new Date(stockmovementData[i].SMovDate).format('dd/mm/yyyy');
	    	var location = stockmovementData[i].SLocCode.SLocCode;
	    	var total = stockmovementData[i].SMovBalance ==null?"-":stockmovementData[i].SMovBalance;
	    	var receivePlan = "";
	    	var usage = stockmovementData[i].SMovQuantity;
	    	var ref = stockmovementData[i].POCode ==null?"-":stockmovementData[i].POCode.POCode;
	    	// if(stockmovementData[i].POCode== null){
	    	// 	ref = "-";
	    	// }
	    	// else if(stockmovementData[i].POCode != null){
	    	// 	ref = stockmovementData[i].POCode.POCode;
	    	// }
	    	var POBalance ="-";


			$('#stockMoveBody').append('<tr id ='+'row'+i+'>' +
						// '<td class="text-center">'+
						// 	'<input class = "checkboxfordelete" type="checkbox" name="del" value = '+i+'>'
						// 	+
					 // 	'</td>' +
						// '<td class="text-center">'+
						// 	'<button type="button" class="btn btn-info" value = "'+i+'" onclick = "editChild(this,'+i+')">'+'<span class="fa fa-pencil"><jsp:text/></span>'+'</button>'
						// 	+
						// '</td>' +
						'<td class="text-center">'+
							 date+//Date
						'</td>' +
						'<td class="text-center">'+
							 location+//Storage
						'</td>' +
						'<td class="text-center">'+
							usage+//Usage
						'</td>' +
						'<td class="text-center">'+
							total+//Grand total
						'</td>' +
						'<td class="text-center">'+
							 receivePlan+//Receive Plan
						'</td>' +
						'<td class="text-center">'+
							 ref+//Ref. PO
						'</td>' +
						// '<td class="text-center">'+
						// 	 POBalance+// PO Balance
						// '</td>' +
						
					'</tr>');

	}

}