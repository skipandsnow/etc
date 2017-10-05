<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<script type="text/javascript" src="http://iop.io/js/vendor/d3.v3.min.js"></script>
    <script type="text/javascript" src="http://iop.io/js/vendor/polymer/PointerEvents/pointerevents.js"></script>
    <script type="text/javascript" src="http://iop.io/js/vendor/polymer/PointerGestures/pointergestures.js"></script>
    <script type="text/javascript" src="http://iop.io/js/iopctrl.js"></script>
    <link href="<c:url value="/css/etc/analysis2.css"/>" rel="stylesheet">
    <script src="bootstrap-datepicker/js/locales/bootstrap-datepicker.zh-TW.min.js" charset="UTF-8"></script>
    <script src="<c:url value="/js/jquery/jQuery-jcMarquee.js"/>"></script>
    <script src="<c:url value="/js/jquery/liquidFillGauge.js"/>"></script>
    <script src="<c:url value="/js/etc/analysis2.js"/>"></script>
<title>出遊順暢日</title>

  <meta name="viewport" content="width=device-width, initial-scale=1">
<!-- www.bcty365.com -->
	<script src="http://d3js.org/d3.v3.min.js" language="JavaScript"></script>
	<!-- 使用 jQuery Datepicker的中文化-->
	<span style="font-family: Times New Roman;"><span style="white-space: normal;"></span></span>

</head>
<body>
<div class="total">	
	<div class="c_top">
		<div id="select_item">
				<div class="row">
<!-- 					<div class="span5 col-md-5" id="sandbox-container"><input type="text" class="form-control">
					</div>
 -->
					<div id="start_date" class="ui fluid search selection dropdown" 
						style="width: 130px; float:left">
						<input type="hidden" name="start"> <i class="dropdown icon"></i>
						<div class="default text">請選擇出發日期</div>
						<div class="menu"></div>
					</div>
					<div id="start_time" class="ui fluid search selection dropdown" 
						style="width: 130px; float:left">
						<input type="hidden" name="start"> <i class="dropdown icon"></i>
						<div class="default text">請選擇出發時間</div>
						<div class="menu"></div>
					</div>
					<div id="start_city" class="ui fluid search selection dropdown" 
						style="width: 130px; float:left">
						<input type="hidden" name="start"> <i class="dropdown icon"></i>
						<div class="default text">請選擇出發縣市</div>
						<div class="menu"></div>
					</div>
					<div id="start_area" class="ui fluid search selection dropdown" 
						style="width: 130px; float:left">
						<input type="hidden" name="start"> <i class="dropdown icon"></i>
						<div class="default text">請選擇出發地區</div>
						<div class="menu"></div>
					</div>
					<div id="end_city" class="ui fluid search selection dropdown" 
						style="width: 130px; float:left">
						<input type="hidden" name="start"> <i class="dropdown icon"></i>
						<div class="default text">請選擇到達縣市</div>
						<div class="menu"></div>
					</div>
					<div id="end_area" class="ui fluid search selection dropdown" 
						style="width: 130px; float:left">
						<input type="hidden" name="start"> <i class="dropdown icon"></i>
						<div class="default text">請選擇到達地區</div>
						<div class="menu"></div>
					</div>
					
  					<div id ="analysis_btn" class="text_style text_item" style="margin: 10px;font-size: 50px;">GO~</div>
		</div>
	</div>
		
	<div class="c_left" style="float:left;width: 130px;">
		<div></div>
		<div class="list-group">
		  <a href="#" class="text_style list-group-item">First item</a>
		  <a href="#" class="text_style list-group-item">Second item</a>
		  <a href="#" class="text_style list-group-item">Third item</a>
		</div>
	</div>
	<div class="middle">
		<div id="top_item">
			<div class="left_item"><img class="calendar" src="etc_images/c_yi.gif" /></div>
			<div class="text_style left_item"><p class="text_item">出行<p></div>
			<div class="left_item "><svg class="circle_q" id="fillgauge4" width="100px" height="100px" onclick="gauge4.update(NewValue());"></svg></div>
			<div class="left_item"><svg class="circle_q" id="fillgauge5" width="100px" height="100px" onclick="gauge5.update(NewValue());"></svg></div>
			<div class="left_item" style="margin: -49px;"><span id="speedometer"></span></div>
		</div>
		<div id ="car_road">
			<div id="mrq">
				<div id="car"><img class = "car" src="etc_images/car.png" /></div>
				<div id="Marquee_x">
					<ul>
						<li>
							<div class ="road" style="background-image: url('etc_images/constructions.png');">
								<img class = "bg" src="etc_images/clouds.png" />
							</div>
							<div class ="road" style="background-image: url('etc_images/accidents.png');">
								<img class = "bg" src="etc_images/rains.png" />
							</div>
							<div class ="road" style="background-image: url('etc_images/falls.png');">
								<img class = "bg" src="etc_images/suns.png" />
							</div>
							<div class ="road" style="background-image: url('etc_images/falls.png');">
								<img class = "bg" src="etc_images/winds.png" />
							</div>
						</li>
					</ul>
				</div>
			</div>
		</div>
		<div id ="blank" style="width: 600px;    height: 60px; background-color: #ecf4f7;"></div>
	</div>
	<!-- right-->
	
	<div class="c_right">
	<span class="map_item">
		<p class="text_style text_item">大雅<p><p class="text_style text_item" style="position: absolute;">交流道</p>
	</span>
	<img class="map_item" src="etc_images/taiwan.png" style="float:left;width:270px"/>
	
	</div>
</div>
</body>
</html>
