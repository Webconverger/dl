// Load the Visualization API and the piechart package.
google.load('visualization', '1', {
	'packages': ['annotatedtimeline']
});

// Set a callback to run when the Google Visualization API is loaded.
google.setOnLoadCallback(drawChart);

function drawChart() {
	var jsonData = $.ajax({
		url: "/sample.json",
		dataType: "json",
		async: false
	}).responseText;

// Create our data table out of JSON data loaded from server.
var data = new google.visualization.DataTable(jsonData);

var chart = new google.visualization.AnnotatedTimeLine(document.getElementById('chart_div'));

chart.draw(data, {width: 640, height: 480});

}

