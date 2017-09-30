<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<html>
<head>
<script src="<c:url value="/js/etc/analysis3.js"/>"></script>
<link href="<c:url value="/css/etc/analysis3.css"/>" rel="stylesheet">
</head>
<body>
	<h1>E起定疏通</h1>
	<div class="ui grid">
		<div class="row">
			<div class="two wide column"
				style="padding-right: 0 !important; vertical-align: middle; text-align: center;">
				<label class="selection_labels" style="font-size: 20px;">請選擇起始地：</label>
			</div>
			<div class="five wide column" style="padding-left: 0 !important">
				<div id="lbl_start" class="ui input" style="width: 400px">
					<input id="txt_end" type="text" placeholder="請輸入起始地">
				</div>
			</div>
			<div class="two wide column"
				style="padding-right: 0 !important; vertical-align: middle; text-align: center;">
				<label class="selection_labels" style="font-size: 20px;">請選擇目的地：</label>
			</div>
			<div class="five wide column" style="padding-left: 0 !important">
				<div id="lbl_end" class="ui input" style="width: 400px">
					<input id="txt_end" type="text" placeholder="請輸入目的地">
				</div>
			</div>
		</div>
		<div class="row">
			<div class="two wide column"
				style="padding-right: 0 !important; vertical-align: middle; text-align: center;">
				<label class="selection_labels" style="font-size: 20px;">我要走這道：</label>
			</div>
			<div id="drop_highway" class="ui fluid search selection dropdown"
				style="width: 300px;">
				<input type="hidden" name="start"> <i class="dropdown icon"></i>
				<div class="default text">請選擇高速公路</div>
				<div class="menu"></div>
			</div>
			<div class="two wide column"
				style="padding-right: 0 !important; vertical-align: middle; text-align: center;">
				<label class="selection_labels" style="font-size: 20px;">給我好時段：</label>
			</div>
			<div id="drop_time_segment" class="ui fluid search selection dropdown"
				style="width: 300px;">
				<input type="hidden" name="start"><i class="dropdown icon"></i>
				<div class="default text">請選擇時段</div>
				<div class="menu"></div>
			</div>
		</div>
	</div>

	<!-- 			<div id="drop_start_place" class="ui fluid search selection dropdown"
				style="width: 300px;">
				<input type="hidden" name="start"> <i class="dropdown icon"></i>
				<div class="default text">起始地</div>
				<div class="menu">
					<div class="item" data-value="1">基隆端</div>
					<div class="item" data-value="2">基隆交流道</div>
					<div class="item" data-value="3">八堵交流道</div>
					<div class="item" data-value="4">大華系統交流道</div>
					<div class="item" data-value="5">五堵交流道</div>
					<div class="item" data-value="6">汐止交流道</div>
				</div>
			</div> -->
	<!-- 	<div id="drop_end_place" class="ui fluid search selection dropdown"
		style="">
		<input type="hidden" name="end"> <i class="dropdown icon"></i>
		<div class="default text">起始地</div>
		<div class="menu">
			<div class="item" data-value="1">基隆端</div>
			<div class="item" data-value="2">基隆交流道</div>
			<div class="item" data-value="3">八堵交流道</div>
			<div class="item" data-value="4">大華系統交流道</div>
			<div class="item" data-value="5">五堵交流道</div>
			<div class="item" data-value="6">汐止交流道</div>
		</div>
	</div>	 -->

</body>
</html>