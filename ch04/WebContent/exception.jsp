<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>JSP ���� exception.jsp</title>
</head>
<body>
	<%@ page isErrorPage="true" %>
	<h2> ó�� �� ���� �߻� </h2>
	���� ���� ���� �����ϵ��� �ϰڽ��ϴ�. <p>
	exception.getMessage() : <%= exception.getMessage() %> <p>
	exception.toString() : <%= exception.toString() %>
</body>
</html>