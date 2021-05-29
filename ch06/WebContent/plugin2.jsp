<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>JSP 예제</title>
</head>
<body>

	<h3> Current time is : 시간</h3>
	<jsp:plugin type="applet" code="Clock.class" codebase="applet" jreversion="1.6" width="160" height="150" >
	    <jsp:fallback>
	        Plugin tag OBJECT or EMBED not supported by browser.
	    </jsp:fallback>
	</jsp:plugin>
	<p>
	<h4>
	<font color=red> 
	The above applet is loaded using the Java Plugin from a jsp page using the
	plugin tag.
	</font>
	</h4>

</body>
</html>