<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>JSP ���� membervar.jsp</title>
</head>
<body>
	<% int i = 0; %>
	[��������] i = <%= ++i %> 
	<p>
	[�ҼӺ���] memi = <%= ++memi %>
	<%! int memi = 0; %>
</body>
</html>