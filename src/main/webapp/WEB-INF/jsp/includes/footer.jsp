<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator"
	prefix="decorator"%>
<link href="<c:url value="/css/commons/application.css"/>"
	rel="stylesheet">
<div id="footerTmpl" style="margin: 0px auto;">
	<footer id="footer">

		<p></p>
		<div style="text-align: center;">
			<div style="position: relative; width: 450px; margin: 0 auto;">
				<label id='title_platform'
					style="position: absolute; top: 18%; left: 20%; font-size: 25px;">E起定疏通</label>
				<label id='title_platform_en'
					style="position: absolute; top: 60%; left: 20%; font-size: 13px;">The "e" Highway</label>
				<p>
					<img src="<c:url value='/images/0917Banner_03_blank.png' />" />
				</p>
			</div>
		</div>
		<p style="font-weight: bold">建議最佳瀏覽解析度 1024×768
			建議採用Chrome、Firefox獲得最佳瀏覽效果</p>

	</footer>
</div>

<style type="text/css">
/*讓footerTmpl內容置中*/
#footerTmpl {
	text-align: center;
	margin-left: auto;
	margin-right: auto;
}
</style>
