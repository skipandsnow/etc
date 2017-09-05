<%--
% This is the main decorator for pages without navbar and footer.
% It includes standard caching, style sheet, header, footer and copyright notice.
--%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator"%>
<!DOCTYPE HTML>
<html lang="zh-TW">
<head>
<title><decorator:title default="TV Framework Sample - PetClinic" /></title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<decorator:head />
</head>
<body>

  <div id="main" class="container">
    <decorator:body />
  </div>

</body>
</html>