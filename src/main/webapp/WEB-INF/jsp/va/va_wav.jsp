<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="BIG5">
</head>
<script src="<c:url value="/js/commons/jquery-1.10.1.min.js"/>"></script>
<script src="<c:url value="/js/va/wav.js"/>"></script>
<body>
	<p>聽音檔</p>
	<p id="urlToWav"> </p>
	<audio id="wavSrc" controls="controls">
		<source src="http://localhost:8088/voice_analysis/wav/9129187457790000981.wav" type="audio/wav">
	</audio>​
</body>
</html>