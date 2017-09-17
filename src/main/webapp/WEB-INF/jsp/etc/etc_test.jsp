<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<html>
<head>
<script
	src="<c:url value="/js/commons/JQuery-3.2.1/jquery-3.2.1.min.js"/>"></script>
<script src="<c:url value="/js/commons/Popper-1.12.5/popper.min.js"/>"></script>
<script src="<c:url value="/js/semantic/semantic-2.2/semantic.min.js"/>"></script>
<link href="<c:url value="/js/semantic/semantic-2.2/semantic.min.css"/>"
	rel="stylesheet">
</head>
<body>
	<h1>高速公路車流分析網</h1>
	<div class="ui fluid search selection dropdown" style="width: 150px">
		<input type="hidden" name="start"> <i class="dropdown icon"></i>
		<div class="default text">請選擇起始地</div>
		<div class="menu">
			<div class="item" data-value="1">基隆端</div>
			<div class="item" data-value="2">基隆交流道</div>
			<div class="item" data-value="3">八堵交流道</div>
			<div class="item" data-value="4">大華系統交流道</div>
			<div class="item" data-value="5">五堵交流道</div>
			<div class="item" data-value="6">汐止交流道</div>
		</div>
	</div>
</body>
</html>