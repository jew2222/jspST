<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>JSTL Core: if</title>
</head>
<body>

<h2>JSTL Core Tag: if</h2>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

�ȳ��ϼ���.
<c:set var="today" value="<%= new java.util.Date()%>" />
<c:if test="${today.hours > 17 }" var="bool">
���� �Ļ�� �ϼ̴�����?<br>
</c:if>
<p>
<hr>
\${today.hours} = ${today.hours} <br>
\${bool} = ${bool} 

</body>
</html>