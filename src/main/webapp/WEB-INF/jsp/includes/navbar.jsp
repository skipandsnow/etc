<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator"
	prefix="decorator"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<link rel="icon" type="image/x-icon" sizes="16x16"
	href="<c:url value="/favicon.ico"/>">
<link rel="stylesheet" href="<c:url value="/css/nav/navbar.css"/>" />

<div id="navbarTmpl">
	<%-- <img class="img-responsive" src="<c:url value="/images/banner-graphic.png" />" /> --%>
	<nav class="navbar navbar-inverse" role="navigation">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target="#navbar-collapse-1">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
		</div>

		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse" id="navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li id="home"><a href="<s:url action='index'/>"
					style="font-size: 15px"><i class="large icon-home icon"></i><p class="head text_style" style="float: right;">首頁</p></a>
				</li>
<!-- 				<li id="analysis1"><a href="<s:url value='/etc_toAnalysis1'/>" style="font-size: 15px"><i
						class="large icon-search icon"></i><p class="text_style" style="float: right;">給我最佳路線</p></a></li>
 -->
				<li id="analysis2"><a href="<s:url value='/etc_toAnalysis2'/>"
					style="font-size: 15px"><i class="large icon-search icon"></i>
						<p class="head text_style" style="float: right;">出遊順暢日</p></a></li>
<!--				<li id="analysis3"><a href="<s:url value='/etc_toAnalysis3'/>"
					style="font-size: 15px"><i class="large icon-search icon"></i>
						<p class="text_style" style="float: right;">診療不通室</p></a></li>
-->
<%-- 				<li id="datamanagement" class="dropdown menuimg"><a href="#"
					class="dropdown-toggle" data-toggle="dropdown"><i
						class="large icon-search icon"></i>資料管理<b class="caret"></b> </a>
					<ul class="dropdown-menu">
						<li><a href="<s:url value='/dm_toDataSource'/>">質檢規則管理</a></li>
						<li><a href="<s:url value='/dm_toDatasetTopic'/>">報表權限管理</a>
						</li>
					</ul></li> --%>
			</ul>
		</div>
		<!-- /.navbar-collapse -->
	</nav>
</div>
