var ready;

ready = function() {
  if ( $( "#chart1" ).length ) {
	  var chart1 = new CanvasJS.Chart("chart1", {
	  	title: {
	  		text: "Projetos por Situação"
	  	},
	  	data: [{
	  		type: "doughnut",
        indexLabel: "{label} - {y}",
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
        indexLabel: "{label} - {y}",
        dataPoints: JSON.parse($.ajax({type: "GET", url: "/scholarship_types.json", async: false}).responseText)
	  	}]
	  });

    console.log(JSON.parse($.ajax({type: "GET", url: "/scholarship_types.json", async: false}).responseText));

    chart2.render();
  }

  if ( $( "#chart3" ).length ) {
	  var chart3 = new CanvasJS.Chart("chart3", {
	  	title: {
        text: "Projetos por Ano"
	  	},
	  	data: [{
        type: "column",
        indexLabel: "{y}",
        dataPoints: JSON.parse($.ajax({type: "GET", url: "/projects/per_year.json", async: false}).responseText)
	  	}]
	  });

    console.log(JSON.parse($.ajax({type: "GET", url: "/projects/per_year.json", async: false}).responseText));

    chart3.render();
  }

  if ( $( "#chart4" ).length ) {
	  var chart4 = new CanvasJS.Chart("chart4", {
	  	title: {
        text: "Projetos por Grupo de Pesquisa"
	  	},
	  	data: [{
        type: "doughnut",
        indexLabel: "{label} - {y}",
        dataPoints: JSON.parse($.ajax({type: "GET", url: "/projects/per_research_group.json", async: false}).responseText)
	  	}]
	  });

    console.log(JSON.parse($.ajax({type: "GET", url: "/projects/per_research_group.json", async: false}).responseText));

    chart4.render();
  }
};

$(document).ready(ready);

$(document).on('page:load', ready);
