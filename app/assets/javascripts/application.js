// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
//= require jquery.ui.datepicker

$(function() {
 	$( "#datepicker" ).datepicker({dateFormat: 'dd.mm.yy'});
 });

var data;
$(document).on('ready page:load', function (){
	//general
	$("tr, li").click(function(){
		link=$(this).find("a").attr("href");
		if(link){
			window.location = link;
		}
	});


	//register
	

	//search related js
	set=0;
	$("#make").ready(function(){
		$.getJSON("/cars/makes",
			function(json){
				for(i=0;i<json.length;i++){
					$("#make").append($('<option>', {
					    value: json[i].id,
					    text: json[i].name
					}));
				}
				makeID=$(document).getUrlParam("makeID");
				if(makeID!=null){
					$("#make").val(makeID);
					$("#make").change();
					set=1;
				}else{
					$("#make").val(-1);
				}
			}
		);
	});

	$("#make").change(function(){
		url="/cars/model?id="+$("#make").val();
		$.getJSON(url,
			function(json){
				$("#model").empty();
				for(i=0;i<json.length;i++){
					$("#model").append($('<option>', {
					    value: json[i].id,
					    text: json[i].name
					}));
				}
				if(set){
					modelID=$(document).getUrlParam("modelID");
					$("#model").val(modelID);
					$("#model").change();
					set=0;
				}
			}
		);
	});

	$("#fuel").ready(function(){
		$.getJSON("/cars/ftypes",
			function(json){
				for(i=0;i<json.length;i++){
					$("#fuel").append($('<option>', {
					    value: json[i].id,
					    text: json[i].name
					}));
				}
				$("#fuel").val(-1);
			}
		);
	});	
	
	//car info related js
	$("#entBtn").click(function(){
		$(".hide").hide();
		$("#ent").animate({opacity: "show"}, "slow");

	});
	$("#newEntBtn").click(function(){
		$(".hide").hide();
		$("#newEnt").animate({opacity: "show"}, "slow");
	});
	$("#tlBtn").click(function(){
		$(".hide").hide();
		$("#tl").animate({opacity: "show"}, "slow");
		$("#myChart").replaceWith('<canvas id="myChart" height="400" width="700"></canvas>');
		var ctx = $("#myChart").get(0).getContext("2d");
		$.getJSON("data/car/0/timeline", function(json){
			data = {
				labels : json.labels,
				datasets : [
					{
						fillColor : "#3188D1",
						strokeColor : "#205081",
						pointColor : "#205081",
						pointStrokeColor : "#fff",
						data : json.values
					}
				]
			}
			new Chart(ctx).Line(data);
		});
		event.stopPropagation();
	});

	$("#calcBtn").click(function(){
		$(".hide").hide();
		$("#calc").animate({opacity: "show"}, "slow");
	});

	$("#datepicker").datepicker();
	$("#datepicker").datepicker("setDate", new Date());

	//user info related js
	$("#myListBtn").click(function(){
		$(".hide").hide();
		$("#myList").animate({opacity: "show"}, "slow");

	});
	$("#newCBtn").click(function(){
		$(".hide").hide();
		$("#newC").animate({opacity: "show"}, "slow");

	});
	$("#editPBtn").click(function(){
		$(".hide").hide();
		$("#editP").animate({opacity: "show"}, "slow");

	});
});

jQuery.fn.extend({
/**
* Returns get parameters.
*
* If the desired param does not exist, null will be returned
*
* To get the document params:
* @example value = $(document).getUrlParam("paramName");
* 
* To get the params of a html-attribut (uses src attribute)
* @example value = $('#imgLink').getUrlParam("paramName");
*/ 
 getUrlParam: function(strParamName){
	  strParamName = escape(unescape(strParamName));
	  
	  var returnVal = new Array();
	  var qString = null;
	  
	  if ($(this).attr("nodeName")=="#document") {
	  	//document-handler
		
		if (window.location.search.search(strParamName) > -1 ){
			
			qString = window.location.search.substr(1,window.location.search.length).split("&");
		}
			
	  } else if ($(this).attr("src")!="undefined") {
	  	
	  	var strHref = $(this).attr("src")
	  	if ( strHref.indexOf("?") > -1 ){
	    	var strQueryString = strHref.substr(strHref.indexOf("?")+1);
	  		qString = strQueryString.split("&");
	  	}
	  } else if ($(this).attr("href")!="undefined") {
	  	
	  	var strHref = $(this).attr("href")
	  	if ( strHref.indexOf("?") > -1 ){
	    	var strQueryString = strHref.substr(strHref.indexOf("?")+1);
	  		qString = strQueryString.split("&");
	  	}
	  } else {
	  	return null;
	  }
	  	
	  
	  if (qString==null) return null;
	  
	  
	  for (var i=0;i<qString.length; i++){
			if (escape(unescape(qString[i].split("=")[0])) == strParamName){
				returnVal.push(qString[i].split("=")[1]);
			}
			
	  }
	  
	  
	  if (returnVal.length==0) return null;
	  else if (returnVal.length==1) return returnVal[0];
	  else return returnVal;
	}
});