//$(function () {
//	
//	// Assign handlers immediately after making the request,
//	// and remember the jqxhr object for this request
//	var situations = [];
//	
///*	var jqxhr = $.getJSON( "/controle-de-projetos/situacoes/index.json", function(data) {
//		console.log( "got json data" );
//		$.each(data, function(index, val) {
//			var situation = [];
//			situation['y'] = JSON.stringify(val.Project.length);
//			situation['indexLabel'] = val.Situation.name;
//			console.log(situation);
//			situations.push(situation);
//		});
//	}).fail(function() {
//		console.log( "error" );
//	});*/
//	
//	$.ajax({
//		url: '/controle-de-projetos/situacoes/index.json',
//	  	dataType: 'json',
//	  	async: false,
//		success: function(data) {
//			$.each(data, function(index, val) {
//				var situation = [];
//				situation['y'] = JSON.stringify(val.Project.length);
//				situation['indexLabel'] = val.Situation.name;
//				console.log(situation);
//				situations.push(situation);
//			});
//	  	}
//	});
//	
//	console.log(situations);
//	
//	var chart1 = new CanvasJS.Chart("chart1", {
//		title: {
//			text: "Projetos por Situação"
//		},
//		data: [{
//			type: "doughnut",
//			dataPoints: situations
//		}]
//	});
//	
//	
//  	chart1.render();
//});
