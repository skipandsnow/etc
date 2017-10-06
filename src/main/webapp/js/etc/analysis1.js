/**
 * 提供給使用
 */
var history_data;
var x_seriesArr = [];
var y_seriesArr = [];
var highwayArr = [];
var dateArr = [];
var dateStartNameArr = [];
var dateEndNameArr = [];

$(document).ready(function() {
	// getDetectedStations();

	getEtcHistoryData();
	showSpeedCharts();
	showAmountCharts();
	// getImpalaTables();
	$('#drop_highway').dropdown({
		values : [ {
			name : '中山高速公路(一號高速公路)',
			value : '1',
			selected : true
		}, {
			name : '福爾摩沙高速公路(三號高速公路)',
			value : '2'
		} ]
	});

	$('#start_date').dropdown({
		values : dateStartNameArr
	});

	$('#end_date').dropdown({
		values : dateEndNameArr
	});

	// alert(JSON.stringify(getTimeVal(0)));

	$('#start_hour').dropdown({
		values : getTimeVal(0)
	});

	$('#end_hour').dropdown({
		values : getTimeVal(23)
	});
	// alert(JSON.stringify(time_val));
	// $('#drop_time_segment').dropdown({
	// values : time_val
	// });
});

function getTimeVal(selected) {
	var time_val = [];

	for (var i = 0; i < 24; i++) {
		var time_seg = '';
		var time = 0;
		if (i < 12) {
			time_seg = '早上';
			time = i;
		} else if (i == 12) {
			time_seg = '中午';
			time = i;
		} else {
			time_seg = '下午';
			time = i - 12;
		}
		if (i == 0) {
			time_seg = '半夜'
			time_val.push({
				name : time_seg + '12點',
				value : '0',
			// selected : true
			});
		}
		if (i == selected) {
			time_val.push({
				name : time_seg + time + '點',
				value : (time + 12).toString(),
				selected : true
			});
		} else {
			time_val.push({
				name : time_seg + time + '點',
				value : (time + 12).toString()
			});
		}

	}
	return time_val;
}

function showSpeedCharts() {
	Highcharts
			.chart(
					'container',
					{
						chart : {
							type : 'column',
							width : 1060,
							height : 320
						},
						rangeSelector : {
							selected : 1
						},
						title : {
							text : '高速公路平均時速'
						},
						// subtitle : {
						// text : 'Source: WorldClimate.com'
						// },
						credits : {
							enabled : false
						},
						xAxis : {
							min : 0,
							max : 10,
							categories : dateArr,
							crosshair : true,
							scrollbar : {
								enabled : true,
								barBackgroundColor : 'gray',
								barBorderRadius : 7,
								barBorderWidth : 0,
								buttonBackgroundColor : 'gray',
								buttonBorderWidth : 0,
								buttonBorderRadius : 7,
								trackBackgroundColor : 'none',
								trackBorderWidth : 1,
								trackBorderRadius : 8,
								trackBorderColor : '#CCC'
							}
						},
						yAxis : {
							min : 0,
							title : {
								text : '平均時速'
							}
						},
						tooltip : {
							headerFormat : '<span style="font-size:10px">{point.key}</span><table>',
							pointFormat : '<tr><td style="color:{series.color};padding:0">{series.name}: </td>'
									+ '<td style="padding:0"><b>{point.y:.1f} 公里/小時</b></td></tr>',
							footerFormat : '</table>',
							shared : true,
							useHTML : true
						},
						plotOptions : {
							column : {
								pointPadding : 0.2,
								borderWidth : 0

							}
						},
						// series : [x_seriesArr, y_seriesArr]
						series : y_seriesArr
					});
}

function showAmountCharts() {
	Highcharts
			.chart(
					'container_amount',
					{
						chart : {
							type : 'column',
							width : 1060,
							height : 320
						},
						rangeSelector : {
							selected : 1
						},
						title : {
							text : '高速公路車流量'
						},
						// subtitle : {
						// text : 'Source: WorldClimate.com'
						// },
						credits : {
							enabled : false
						},
						xAxis : {
							min : 0,
							max : 10,
							categories : dateArr,
							crosshair : true,
							scrollbar : {
								enabled : true,
								barBackgroundColor : 'gray',
								barBorderRadius : 7,
								barBorderWidth : 0,
								buttonBackgroundColor : 'gray',
								buttonBorderWidth : 0,
								buttonBorderRadius : 7,
								trackBackgroundColor : 'none',
								trackBorderWidth : 1,
								trackBorderRadius : 8,
								trackBorderColor : '#CCC'
							}
						},
						yAxis : {
							min : 0,
							title : {
								text : '車流量(輛)'
							}
						},
						tooltip : {
							headerFormat : '<span style="font-size:10px">{point.key}</span><table>',
							pointFormat : '<tr><td style="color:{series.color};padding:0">{series.name}: </td>'
									+ '<td style="padding:0"><b>{point.y:.1f} 公里/小時</b></td></tr>',
							footerFormat : '</table>',
							shared : true,
							useHTML : true
						},
						plotOptions : {
							column : {
								pointPadding : 0.2,
								borderWidth : 0

							}
						},
						// series : [x_seriesArr, y_seriesArr]
						series : x_seriesArr
					});
}

function getDetectedStations() {

	$.ajax({
		type : "POST",
		dataType : "json",
		url : 'etc_getDetectedStations',
		success : function(response) {
			// alert(JSON.stringify(JSON.parse(response)[0]));
		}
	});

}

function getEtcHistoryData() {

	$.ajax({
		type : "POST",
		dataType : "json",
		url : 'etc_getEtcHistoryData',
		async : false,
		success : function(response) {
			history_data = JSON.parse(response);
			// alert(JSON.stringify(history_data));
		}
	});

	dateArr.push(history_data[0].etc_date);
	for (var i = 0; i < history_data.length; i++) {
		if (dateArr.lastIndexOf(history_data[i].etc_date) == -1) {
			dateArr.push(history_data[i].etc_date);
		}
	}

//	var dateStartNameArr = [];
//	var dateEndNameArr = [];

	for (var i = 0; i < dateArr.length; i++) {

		if (i == 0) {
			var dateObj = {
				name : dateArr[i],
				value : dateArr[i],
				selected : true

			}
			dateStartNameArr.push(dateObj);
			continue;
		}
		if (i == 14) {
			var dateObj = {
				name : dateArr[i],
				value : dateArr[i],
				selected : true
			}
			dateEndNameArr.push(dateObj);
			continue;
		}
		var dateObj = {
			name : dateArr[i],
			value : dateArr[i]
		}
		dateStartNameArr.push(dateObj);
	}

	highwayArr.push(history_data[0].highwayid);
	for (var i = 0; i < history_data.length; i++) {
		if (highwayArr.lastIndexOf(history_data[i].highwayid) == -1) {
			highwayArr.push(history_data[i].highwayid);
		}
	}

	// alert(seriesArr.size);
	var highwayid = history_data[0].highwayid;
	var x_dataArr = [];
	var y_dataArr = [];
	for (var i = 0; i < history_data.length; i++) {
		if (highwayid != history_data[i].highwayid) {
			// alert(history_data[i].highwayid);

			var x_tmpHistory = {
				name : getHighwayName(highwayid),
				data : x_dataArr,
				pointWidth : 15
			}
			var y_tmpHistory = {
				name : getHighwayName(highwayid),
				data : y_dataArr,
				pointWidth : 15
			}
			x_seriesArr.push(x_tmpHistory);
			y_seriesArr.push(y_tmpHistory);
			highwayid = history_data[i].highwayid;
			// dataArr.splice(0, dataArr.length);// clear arr
			x_dataArr = new Array();
			x_dataArr.push(history_data[i].caramount);
			y_dataArr = new Array();
			y_dataArr.push(history_data[i].meanspeed);
		} else {
			x_dataArr.push(history_data[i].caramount);
			y_dataArr.push(history_data[i].meanspeed);
		}
	}
	var x_tmpHistory = {
		name : getHighwayName(highwayid),
		data : x_dataArr,
		pointWidth : 15
	}
	var y_tmpHistory = {
		name : getHighwayName(highwayid),
		data : y_dataArr,
		pointWidth : 15
	}
	x_seriesArr.push(x_tmpHistory);
	y_seriesArr.push(y_tmpHistory);

	// alert(seriesArr.length);
}
function getHighwayName(highway) {
	if (highway == '01') {
		return '國道1號'
	} else if (highway == '03') {
		return '國道3號'
	} else {
		return '國道5號'
	}
}

function getImpalaTables() {

	$.ajax({
		type : "POST",
		dataType : "json",
		url : 'etc_getImpalaTables',
		success : function(response) {
			// alert(JSON.stringify(JSON.parse(response)[0]));
		}
	});

}
