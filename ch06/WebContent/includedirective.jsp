<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>JSP ���� : includedirective.jsp</title>
</head>
<body>
	<% int i = 12; %>
	<% //int n = 365; %>
	<% int days = 365; %>
	1 ���� <%=i %>�� �Դϴ�.
	<%@ include file="includesub.jsp" %>
	1 ���� <%=days %>�� �Դϴ�.
</body>
</html>