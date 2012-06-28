google.load("visualization", "1", {
	packages: ["corechart"]
});
google.setOnLoadCallback(drawChart);
function drawChart() {

	function downloadUrl(url, callback) {
		var request = window.ActiveXObject ? new ActiveXObject('Microsoft.XMLHTTP') : new XMLHttpRequest();
		request.onreadystatechange = function() {
			if (request.readyState == 4) {
				callback(request.responseText, request.status);
			}
		};
		request.open('GET', url, true);
		request.send(null);
	}

	var data = new google.visualization.DataTable();
	data.addColumn('string', 'Month');
	downloadUrl("header.json", header);

	function header(arraystring) {
		console.log(arraystring);
		arr = JSON.parse(arraystring);
		for (var i = 0; i < arr.length; i++) {
			console.log(arr[i]);
			data.addColumn('number', arr[i]);
		}

		downloadUrl("total.json", rows);
	}

	function rows(rowstring) {

		console.log(rowstring);
		data.addRows(JSON.parse(rowstring));

		var options = {
			width: window.innerWidth,
			height: window.innerHeight,
			title: 'Webconverger usage'
		};

		var chart = new google.visualization.LineChart(document.getElementById('chart_div'));
		chart.draw(data, options);

	}
}

