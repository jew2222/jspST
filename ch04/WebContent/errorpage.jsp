<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>JSP ���� errorpage.jsp</title>
</head>
<body>
	<%@ page errorPage="exception.jsp" %>
	<% String []str = {"�����մϴ�.", "Thank you."}; %>
	�ѱ���� [<%= str[0] %>]��  <br>
	����� [<%= str[2] %>]�̴�.	
</body>
</html>