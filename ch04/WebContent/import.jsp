<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>JSP ���� import.jsp</title>
</head>
<body>
	<h2> page �������� import �Ӽ�</h2>
	<%@ page import="java.util.Date" %>
	���� �ð� : <%= new Date().toLocaleString() %>
</body>
</html>