// alert("move");
var stockmovementData='';
var movementTypeData='';
//alert("move");

//////////////////loadMovementType///////////////////
	movementTypeData = $.ajax({
	contentType: "application/json; charset=utf-8",
	dataType: "json",
	headers: {
        Accept: "application/json"
       },
	//url: '/vmi/stocklocations?page=1&size=10',
	url : session['context']+'/movementtypes',
	data :{

	},
	complete: function(xhr) {
		if (xhr.readyState == 4) {
			if (xhr.status == 200) {
					//alert("find");
				responseHeader = xhr.getResponseHeader('Location');
			}else{
					//alert("fail");
			}
			} 
		},
	async: false
	}).responseJSON;
//////////////////////////////////////////////////////////////////
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
	    	var usage = stockmovementData[i].SMovQuantity;
	    	var ref = stockmovementData[i].POCode ==null?"-":stockmovementData[i].POCode.POCode;
	    	var move = stockmovementData[i].SMovStatusCode;

	    	var moveType = '';

	    	for(var j=0;j<movementTypeData.length;j++){
	    		//alert("bbbbbb");
	    		if(movementTypeData[j].moveCode == move){
	    			moveType = movementTypeData[j].moveName;
	    			break; 
	    		}
	    	}


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
							moveType+//movement
						'</td>' +
						'<td class="text-center">'+
							usage+//Usage
						'</td>' +
						'<td class="text-center">'+
							total+//Balance
						'</td>' +
						'<td class="text-center">'+
							 ref+//Ref. PO
						'</td>' +

						
					'</tr>');

	}

}