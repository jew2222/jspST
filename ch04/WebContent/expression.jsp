<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>JSP ���� expression.jsp</title>
</head>
<body>
	<% int year = 365; %>

	<% out.println("1���� �� �� ���ϱ��? <p>"); %>
	<%= year / 7 %>
	<%= " �� �Դϴ�." %>
</body>
</html>