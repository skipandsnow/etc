$(document).ready(function() {
	var time_val = [],city_val=[];

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

	// alert(JSON.stringify(time_val));
	$('#start_time').dropdown({
		values : time_val
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
        gauge.value(92);

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
$(".form_datetime").datetimepicker({format: 'yyyy-mm-dd hh:ii'});
