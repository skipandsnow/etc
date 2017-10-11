<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<html>
<head>
<script src="<c:url value="/js/etc/analysis1.js"/>"></script>
<link href="<c:url value="/css/etc/analysis1.css"/>" rel="stylesheet">
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
</head>
<body>
	<div class="ui grid">
		<div class="row">
			<div class="vertical-center">
				<label class="selection_labels"
					style="font-size: 20px; font-family: naguri;">請選擇起始地：</label>
			</div>
			<div style="padding-left: 0 !important">
				<div id="lbl_start" class="ui input" style="width: 400px">
					<input id="txt_end" type="text" placeholder="請輸入起始地">
				</div>
			</div>
			<div class="vertical-center" style="padding-left: 10px">
				<label class="selection_labels"
					style="font-size: 20px; font-family: naguri;">請選擇目的地：</label>
			</div>
			<div style="padding-left: 0 !important">
				<div id="lbl_end" class="ui input" style="width: 400px">
					<input id="txt_end" type="text" placeholder="請輸入目的地">
				</div>
			</div>
		</div>
		<div class="row">
			<div class="vertical-center">
				<label class="selection_labels"
					style="font-size: 20px; font-family: naguri;">診察日：</label>
			</div>
			<div id="start_date" class="ui fluid search selection dropdown"
				style="width: 200px; float: left">
				<input data-format="yyyy-MM-dd" type="text" name="seldate">
				<i class="dropdown icon"></i>
				<div class="default text">請選擇診察起日</div>
				<div class="menu"></div>
			</div>
			<div class="vertical-center">
				<label class="selection_labels" style="font-size: 20px"> ~ </label>
			</div>
			<div id="end_date" class="ui fluid search selection dropdown"
				style="width: 200px; float: left">
				<input type="hidden" name="start"> <i class="dropdown icon"></i>
				<div class="default text">請選擇診察迄日</div>
				<div class="menu"></div>
			</div>

			<div id="start_hour" class="ui fluid search selection dropdown"
				style="width: 150px; margin-left: 10px; float: left">
				<input type="hidden" name="start"> <i class="dropdown icon"></i>
				<div class="default text">起時</div>
				<div class="menu"></div>
			</div>
			<div id="end_hour" class="ui fluid search selection dropdown"
				style="width: 150px; margin-left: 10px; float: left">
				<input type="hidden" name="start"> <i class="dropdown icon"></i>
				<div class="default text">迄時</div>
				<div class="menu"></div>
			</div>
		</div>
	</div>

	<div id="container"
		style="min-width: 310px;  margin: 0 auto; padding-top: 30px"></div>
	<svg width="1200" height="100">
		<defs>
    		<marker id="markerArrow" markerWidth="13" markerHeight="13" refx="2" refy="6" orient="auto">
        		<path d="M2,2 L2,11 L10,6 L2,2" style="fill: #000000;" />
    		</marker>
		</defs>
		<line x1="180" y1="60" x2="120" y2="20"  stroke="black" stroke-width="2" marker-end="url(#markerArrow)"  />	
		 <text x="190" y="65" fill="red">有2起交通障礙事件!</text>
		<line x1="280" y1="45" x2="220" y2="20"  stroke="black" stroke-width="2" marker-end="url(#markerArrow)"  />	
		 <text x="290" y="47" fill="red">發生2起交通障礙事件，多路段塞車</text>		 
		<line x1="850" y1="50" x2="730" y2="10"  stroke="black" stroke-width="2" marker-end="url(#markerArrow)"  />	
		 <text x="860" y="50" fill="red">發生3起交通障礙事件，多路段塞車</text>			 
		 
	</svg>
	<div id="container_amount"
		style="min-width: 310px; height: 400px; margin: 0 auto;"></div>
</body>
</html>