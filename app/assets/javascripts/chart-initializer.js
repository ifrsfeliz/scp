var ready;

ready = function() {
  if ( $( "#chart1" ).length ) {
	  var chart1 = new CanvasJS.Chart("chart1", {
	  	title: {
	  		text: "Projetos por Situação"
	  	},
	  	data: [{
	  		type: "doughnut",
        dataPoints: JSON.parse($.ajax({type: "GET", url: "/situations.json", async: false}).responseText)
	  	}]
	  });

    console.log(JSON.parse($.ajax({type: "GET", url: "/situations.json", async: false}).responseText));

    chart1.render();
  }

  if ( $( "#chart2" ).length ) {
	  var chart2 = new CanvasJS.Chart("chart2", {
	  	title: {
        text: "Projetos por Tipo de Bolsa"
	  	},
	  	data: [{
	  		type: "doughnut",
        dataPoints: JSON.parse($.ajax({type: "GET", url: "/scholarship_types.json", async: false}).responseText)
	  	}]
	  });

    console.log(JSON.parse($.ajax({type: "GET", url: "/scholarship_types.json", async: false}).responseText));

    chart2.render();
  }
};

$(document).ready(ready);

$(document).on('page:load', ready);
