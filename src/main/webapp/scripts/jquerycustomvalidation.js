$(document).ready(function () {


	$.fn.ssShowComponentMessage = function(message) {
		this.attr("data-toggle","popover");
		this.attr("data-placement","top");
	   	this.attr("data-content", message);
	   	this.popover('show');
	   	setTimeout(
	    	function(e){e.popover('hide');},4000,this
	   	);
	};

	$.fn.ssShowRequireField = function() {
		this.attr("data-toggle","popover");
		this.attr("data-placement","top");
	   	this.attr("data-content", "Mandatory Field is Require");
	   	this.popover('show');
	   	setTimeout(
	    	function(e){e.popover('hide');},4000,this
	   	);
	};

	$.fn.ssShowErrorField = function() {
		$(this).ssShowCorrectField();
		var inputClass = $(this).parent().attr("class");
		$(this).parent().attr("class","has-error " + inputClass);
		$(this).parent().attr("oldclass",inputClass);
	};

	$.fn.ssShowCorrectField = function() {
		var inputClass = $(this).parent().attr("oldclass");
		$(this).parent().attr("class",inputClass);
		$(this).parent().attr("oldclass",null);
	};

});