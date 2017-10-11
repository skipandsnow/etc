var date_val=[],time_val = [],s_city_val=[],s_area_val=[],e_city_val=[],e_area_val=[];
	
$(document).ready(function() {
	getStartCityTables();
	getEndCityTables();
//	getStartAreaTables();
	//START DATE
	date_val.push({
		name:'2017-10-07',
		value:'20171007',
		selected:true
	});
	date_val.push({
		name:'2017-10-08',
		value:'20171008'
	});
	date_val.push({
		name:'2017-10-09',
		value:'20171009'
	});
	//START TIME
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
				selected : true
			});
			continue;
		}
		time_val.push({
			name : time_seg + time + '點',
			value : (time + 12).toString(),
		});
	}
//	START CITY s_city_val
//	s_city_val.push({
//		name:'基隆市',
//		value:'01',
//		selected:true
//	});
//	s_city_val.push({
//		name:'臺北市',
//		value:'02'
//	});
//	s_city_val.push({
//		name:'新北市',
//		value:'03'
//	});
//	START ARAR s_area_val
//	s_area_val.push({
//		name:'信義區',
//		value:'0101',
//		selected:true
//	});
//	s_area_val.push({
//		name:'南港區',
//		value:'0202'
//	});
//	s_area_val.push({
//		name:'三重區',
//		value:'0303'
//	});
//	END CITY
//	e_city_val.push({
//		name:'臺中市',
//		value:'06',
//		selected:true
//	});
//	e_city_val.push({
//		name:'彰化縣',
//		value:'07'
//	});
//	e_city_val.push({
//		name:'雲林縣',
//		value:'08'
//	});
//	END AREA
	e_area_val.push({
		name:'西屯區',
		value:'0606',
		selected:true
	});
	e_area_val.push({
		name:'員林市',
		value:'0707'
	});
	e_area_val.push({
		name:'斗六市',
		value:'0808'
	});
	//INPUT DATA
	// alert(JSON.stringify(time_val));
	$('#start_time').dropdown({
		values : time_val
	});
	$('#start_date').dropdown({
		values : date_val
	});

	$('#start_area').dropdown({
		values : s_area_val
	});
	$('#end_area').dropdown({
		values : e_area_val
	});
});

$(function(){
	//photo
    $('#Marquee_x').jcMarquee({ 'marquee':'x','margin_right':'0px','speed':15 });

	    var svg = d3.select("#speedometer")
                .append("svg:svg")
                .attr("width", 180)
                .attr("height", 180);

        var gauge = iopctrl.arcslider()
                .radius(50)
                .events(false)
                .indicator(iopctrl.defaultGaugeIndicator);
        gauge.axis().orient("in")
                .normalize(true)
                .ticks(13)
                .tickSubdivide(5)
                .tickSize(6, 4, 3)
                .tickPadding(2)
                .scale(d3.scale.linear()
                        .domain([0, 100])
                        .range([-3*Math.PI/4, 3*Math.PI/4]));

        var segDisplay = iopctrl.segdisplay()
                .width(45)
                .digitCount(4)
                .negative(false)
                .decimals(0);

        svg.append("g")
                .attr("class", "segdisplay")
                .attr("transform", "translate(75, 145)")
                .call(segDisplay);

        svg.append("g")
                .attr("class", "gauge")
                .call(gauge);

        segDisplay.value(450);
        gauge.value(80);

	var config4 = liquidFillGaugeDefaultSettings();
    config4.circleThickness = 0.1;
    config4.circleColor = "#FFFF33";
    config4.textColor = "#FFFF77";
    config4.waveTextColor = "#000000";
    config4.waveColor = "#FFFF00";
    config4.textVertPosition = 0.52;
    config4.waveAnimateTime = 5000;
    config4.waveHeight = 0;
    config4.waveAnimate = false;
    config4.waveCount = 2;
    config4.waveOffset = 0.25;
    config4.textSize = 1.2;
    config4.minValue = 25;
    config4.maxValue = 100
    config4.displayPercent = false;
    config4.waveCount = 1;
    var config5 = liquidFillGaugeDefaultSettings();
    config5.circleThickness = 0.1;
    config5.circleColor = "#AAAAAA";
    config5.textColor = "#666666";
    config5.waveTextColor = "#DDDDDD";
    config5.waveColor = "#444444";
    config5.textVertPosition = 0.52;
    config5.waveAnimateTime = 5000;
    config5.waveHeight = 0;
    config5.waveAnimate = false;
    config5.waveCount = 2;
    config5.waveOffset = 0.25;
    config5.textSize = 1.2;
    config5.minValue = 25;
    config5.maxValue = 100
    config5.displayPercent = false;
	var gauge5 = loadLiquidFillGauge("fillgauge5", 70, config5);
	var gauge4 = loadLiquidFillGauge("fillgauge4", 40, config4);
    function NewValue(){
        if(Math.random() > .5){
            return Math.round(Math.random()*100);
        } else {
            return (Math.random()*100).toFixed(1);
        }
    }
});

function getStartCityTables() {
	var city_data;
	$.ajax({
		type : "POST",
		dataType : "json",
		url : 'etc_getCity',
		success : function(response) {
			city_data = JSON.parse(response);
			for (var i = 0; i < city_data.length; i++) {
				if(i==0){
					s_city_val.push({
						name:city_data[i],
						value:city_data[i],
						selected:true
					});
				}else{
					s_city_val.push({
						name:city_data[i],
						value:city_data[i],
					});
				}
				
			}
			$('#start_city').dropdown({
				values : s_city_val
			});
		}
	});
//		GET THE CITY AREA
		$( "#start_city div" ).click(function() {
			alert($("#start_city .text").text());
			var area_data;
			var postData = {city:$("#start_city .text").text()};
			$.ajax({
				type : "POST",
				dataType : "json",
				data : postData,
				url : 'etc_getArea',
				success : function(response) {
					area_data = JSON.parse(response);
					alert(area_data);
//					for (var i = 0; i < city_data.length; i++) {
//						if(i==0){
//							s_city_val.push({
//								name:city_data[i],
//								value:city_data[i],
//								selected:true
//							});
//						}else{
//							s_city_val.push({
//								name:city_data[i],
//								value:city_data[i],
//							});
//						}
//						
//					}
//					$('#start_city').dropdown({
//						values : s_city_val
//					});
				}
			});
		});
}

	function getEndCityTables() {
		var city_data;
		$.ajax({
			type : "POST",
			dataType : "json",
			url : 'etc_getCity',
			success : function(response) {
				city_data = JSON.parse(response);
				for (var i = 0; i < city_data.length; i++) {
					if(i==1){
						e_city_val.push({
							name:city_data[i],
							value:city_data[i],
							selected:true
						});
					}else{
						e_city_val.push({
							name:city_data[i],
							value:city_data[i],
						});
					}
					
				}
				$('#end_city').dropdown({
					values : e_city_val
				});
			}
		});
		$( "#end_city div" ).click(function() {
				alert(JSON.stringify($("#end_city .text").text()));
			});

	

}
