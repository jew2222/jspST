<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>JSP ���� scriptlet.jsp</title>
</head>
<body>
	<% int i = 24; %>
	<% 
	   out.println("�Ϸ�� " + i + " �ð��̸�, <br>");
	   out.println("�Ϸ�� " + i*60 + " �� �Դϴ�.");
	%>
</body>
</html>