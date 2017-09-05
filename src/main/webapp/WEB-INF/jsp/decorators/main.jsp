<%--
% This is the main decorator for all pages.
% It includes standard caching, style sheet, header, footer and copyright notice.
--%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator"
	prefix="decorator"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE HTML>
<html lang="zh-TW">
<head>
<title><decorator:title default="ETC-Highway Analysis" /></title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<!-- Bootstrap -->
<link href="<c:url value="/css/commons/bootstrap.min.css"/>"
	rel="stylesheet">
<!-- Font Awesome -->
<link href="<c:url value="/font-awesome/css/font-awesome.min.css" />"
	rel="stylesheet">
<!-- Kendo UI -->
<link
	href="<c:url value="/css/commons/kendo.common-bootstrap.min.css"/>"
	rel="stylesheet" />
<link href="<c:url value="/css/commons/kendo.bootstrap.min.css"/>"
	rel="stylesheet" />


<%-- <script src="<c:url value="/js/commons/jquery-1.10.1.min.js"/>"></script> --%>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"
	integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
	crossorigin="anonymous"></script>
<script src="<c:url value="/js/commons/ajaxfileupload.js"/>"></script>
<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
  <script src="<c:url value="/js/html5shiv.js"/>"></script>
  <script src="<c:url value="/js/respond.min.js"/>"></script>
<![endif]-->
<script src="<c:url value="/js/commons/bootstrap.min.js"/>"></script>
<script src="<c:url value="/js/commons/kendo.web.min.js"/>"></script>
<script src="<c:url value="/js/commons/kendo.all.min.js"/>"></script>
<script
	src="<c:url value="/js/kendo/cultures/kendo.culture.zh-TW.min.js"/>"></script>
<script src="<c:url value="/js/commons/application.js"/>"></script>
<!-- semantic -->
<script
	src="<c:url value="/js/semantic/packaged/javascript/semantic.min.js"/>"></script>
<link rel="stylesheet" href="<c:url value="/css/nav/navbar_pic.css"/>" />
<link href="<c:url value="/js/semantic/packaged/css/semantic.min.css"/>"
	rel="stylesheet">
<!-- application -->
<link href="<c:url value="/css/commons/application.css"/>"
	rel="stylesheet">
<decorator:head />
</head>
<body>


	<jsp:include page="../includes/navbar.jsp" />

	<div id="main" class="container">
		<decorator:body />
	</div>

	<jsp:include page="../includes/footer.jsp" />

</body>
</html>