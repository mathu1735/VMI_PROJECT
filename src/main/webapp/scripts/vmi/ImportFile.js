var csvval = '';
var check = true;
var InfData = '';
var impData = '';

////////////////////////load data/////////////////////////////
var movementTypeData = $.ajax({
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

var poData = $.ajax({
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
					//alert("fail");
			}
			} 
		},
	async: false
	}).responseJSON;
var locationData = $.ajax({
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
					//alert("fail");
			}
			} 
		},
	async: false
	}).responseJSON;

////////////////////////////////////////////////////////////////////////////
$('#btnConfirmImport').on('click',function(){
	addImportToStockFunc(impData);
});
$("#filename").change(function(e) {
	var ext = $("input#filename").val().split(".").pop().toLowerCase();


	if($.inArray(ext, ["csv"]) == -1) {
		alert('Upload CSV');
		return false;
	}
	    
	if (e.target.files != undefined) {
		var reader = new FileReader();
		reader.onload = function(e) {
			csvval=e.target.result.split("/n");
			var data = $.csv.toArrays(e.target.result);
			var html = generateTable(data);
		    $('#importTBody').empty();
		    $('#importTBody').html(html);
			
		};
		reader.readAsText(e.target.files[0]);

	}
	return false;

});
function generateTable(data) {
	impData = data;
    var html = '';
    addImportToInfFunc(data);
    if(typeof(data[0]) === 'undefined') {
      return null;
    }
    
    if(data[0].constructor === Array) {
      for(var row in data) {
      	if(row == "clear"){
      		break;
      	}
      	else{
      		 html += '<tr>\r\n';
	        for(var item in data[row]) {
	        	if(item == "clear"){
	        		break;
	        	}
	        	else{
	        		
	          		html += '<td>' + data[row][item] + '</td>\r\n';
	        	}
	        	
	        }
	        html += '</tr>\r\n';
      	}
       
      }
    }
    return html;
  }

function addImportToInfFunc(data){
	for(var i=0;i<data.length;i++){
		saveImportToInfFunc(data[i]);
	}
}

function saveImportToInfFunc(value){
	
	var d = value[0];
	var dd = d.split('.');
	
	var date = dd[2]+'/'+dd[1]+'/'+dd[0];
	var storage = value[1];
	var moveType = value[2];
	var quantity = value[3];
	var refPO = value[4];
	var filename = $("input#filename").val();

	var	importInf = {
			        InfDate: date,
			        InfLocationCode: storage,
			        InfMovementType: moveType,
			        InfQuantity: quantity,
			        InfRefPO: refPO,
			        InfFileName: filename
			    };
	var data = $.ajax({
		type: "POST",
		contentType: "application/json; charset=utf-8",
		dataType: "json",
		headers: {
        	Accept: "application/json"
        },
		url: session['context']+'/interfaceimportstocks',
		data :JSON.stringify(importInf),
		complete: function(xhr) {
			if (xhr.readyState == 4) {
				if (xhr.status == 201) {
					
					
				}else{
					check = false;
			
				}
			} else {
				check = false;
			
			}
		},
		async: false
	});
}
function addImportToStockFunc(data){
	
	for(var i=0;i<data.length;i++){
		
		saveImportToStockFunc(data[i]);
	}


}
function saveImportToStockFunc(dataImp){
	var d = dataImp[0];
	var dd = d.split('.');
	var SMovDate = dd[2]+'/'+dd[1]+'/'+dd[0];
	var location = dataImp[1];
	var status = dataImp[2];
	var SMovQuantity = dataImp[3];
	var po = dataImp[4];
	var POCode;
	var SMovStatusCode;
	var SLocCode;
	for(i=0;i<movementTypeData.length;i++){
		if(movementTypeData[i].moveCode == status){
			SMovStatusCode = movementTypeData[i].id;
			break;
		}
	}
	for(i=0;i<poData.length;i++){
		if(poData[i].POCode == po){
			POCode = poData[i].id;
			break;
		}
	}
	for(i=0;i<locationData.length;i++){
		if(locationData[i].SLocCode == location){
			SLocCode = locationData[i].id;
			break;
		}
	}

	var	importStock = {
			        SMovDate: SMovDate,
			        SLocCode: {id:SLocCode,version:0},
			        SMovQuantity: SMovQuantity,
			        POCode: {id:POCode,version:0},
			        //SMovStatusCode: SMovStatusCode
			    };
	var data = $.ajax({
		type: "POST",
		contentType: "application/json; charset=utf-8",
		dataType: "json",
		headers: {
        	Accept: "application/json"
        },
		url: session['context']+'/stockmovements',
		data :JSON.stringify(importStock),
		complete: function(xhr) {
			if (xhr.readyState == 4) {
				if (xhr.status == 201) {
					
					
				}else{
					check = false;
			
				}
			} else {
				check = false;
			
			}
		},
		async: false
	});
}
