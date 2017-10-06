<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<html>
<%-- <script src="https://d3js.org/d3.v4.min.js"></script> --%>
<head>
<meta charset="utf-8">
<title>Vizuly - Weighted Tree</title>
<!-- D3.js ... of course! -->
<script src="<c:url value="/js/weightedtree/weightedtree/lib/d3.min.js"/>"></script>
<%-- <script src="https://d3js.org/d3.v4.min.js"></script> --%>

<!-- We use google fonts for many of the examples, but they are not necessary -->
<link href='https://fonts.googleapis.com/css?family=Roboto'
	rel='stylesheet' type='text/css'>
<link
	href='https://fonts.googleapis.com/css?family=Roboto|Raleway:600,400,200'
	rel='stylesheet' type='text/css'>

<!-- Test container style sheets -->
<link rel="stylesheet"
	href="<c:url value="/js/weightedtree/weightedtree/styles/examples.css"/>">
<!-- Vizuly specific style sheets -->
<link rel="stylesheet"
	href="<c:url value="/js/weightedtree/lib/styles/vizuly.css"/>" />
<link rel="stylesheet"
	href="<c:url value="/js/weightedtree/lib/styles/vizuly_weightedtree.css"/>" />

<!-- Supporting test container files:  Vizuly does NOT rely on these -->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">

<link rel="stylesheet"
	href="<c:url value="/js/weightedtree/lib/styles/cssmenu.css"/>" />

<script
	src="<c:url value="/js/weightedtree/lib/jquery-2.1.1.min.js"/>"></script>
<script
	src="<c:url value="/js/weightedtree/lib/cssmenu.js"/>"></script>

<script
	src="<c:url value="/js/weightedtree/weightedtree/lib/vizuly_core.min.js"/>"></script>
<script
	src="<c:url value="/js/weightedtree/weightedtree/lib/vizuly_weightedtree.min.js"/>"></script>
<script
	src="<c:url value="/js/weightedtree/weightedtree/weightedtree_test.js"/>"></script>
</head>
<body>

	<div id='cssmenu' >
		<ul class="main-menu">
			<li class='active'><a><span>Display</span><br> <span
					class="setting"></span></a>
				<ul class="options" callback="changeSize">
					<li id="currentDisplay" class="selected"><a></a></li>
					<li item_value="1000,1000"><a>1000px - 1000px</a></li>
					<li item_value="800,600"><a>800px - 600px</a></li>
					<li item_value="375,667"><a>375px - 667px</a></li>
					<li item_value="320,568"><a>320px - 568px</a></li>
				</ul></li>
			<li class='active'><a><span>Theme </span><br> <span
					class="setting"></span></a>
				<ul class="options" callback="changeSkin">
					<li item_value="None"><a>None</a></li>
					<li item_value="Axiis" class="selected"><a>Axiis</a></li>
				</ul></li>
			<li class='active'><a><span class="label">Data </span><br>
					<span class="setting"></span></a>
				<ul class="options" callback="changeData">
					<li item_value="0" class="selected"><a>Federal</a></li>
					<li item_value="1"><a>State</a></li>
					<li item_value="2"><a>Local</a></li>
				</ul></li>
		</ul>
	</div>

	<!-- Our main content container-->
	<div class="container" style="width: 100%;overflow:hidden;">
		<div id="viz_container" class="z-depth-3" style="overflow:hidden;"></div>

	</div>




	<script>
		//Once the document is ready we set javascript and page settings
		var screenWidth;
		var screenHeight;

		$(document).ready(
				function() {

					var rect;
					if (self == top) {
						rect = document.body.getBoundingClientRect();
					} else {
						rect = parent.document.body.getBoundingClientRect();
					}

					//Set display size based on window size.
					screenWidth = (rect.width < 960) ? Math
							.round(rect.width * .95) : Math
							.round((rect.width - 210) * .95);

					screenHeight = 750;

					d3.select("#currentDisplay").attr("item_value",
							(String(screenWidth) + "," + String(screenHeight)))
							.attr("class", "selected").html(
									"<a>" + screenWidth + "px - "
											+ screenHeight + "px</a>");

					$("#cssmenu").menumaker({
						title : "VIZULY WEIGHTED TREE",
						format : "multitoggle"
					});

					// Set the size of our container element.
					viz_container = d3.selectAll("#viz_container").style(
							"width", screenWidth + "px").style("height",
							screenHeight + "px");

					loadData();

				});
	</script>


</body>
</html>