<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>JSTL Core: out</title>
</head>
<body>

<h2>JSTL Core Tag: out</h2>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:out value="<hr>" />
<c:out value="<hr>" escapeXml="false" />

<p>
<c:out value="${param.name}">
	�з����Ͱ� �����ϴ�.
</c:out>
<p>
<c:out value="${param.name}" default="�з����Ͱ� �����ϴ�." />
<p>\${param.name} = ${param.name}

</body>
</html>