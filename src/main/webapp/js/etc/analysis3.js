/**
 * 提供給使用
 */

$(document).ready(function() {
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
			time_val.push({
				name : time_seg + time + '點',
				value : 0,
				selected : true
			});
			continue;
		}
		alert(i);
		time_val.push({
			name : time_seg + time + '點',
			value : time,
		});
	}
	$('#drop_time_segment').dropdown({
		values : time_val
	});
});