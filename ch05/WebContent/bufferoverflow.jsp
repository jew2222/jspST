<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>JSP ���� bufferoverflow.jsp</title>
</head>
<body>
	<%@ page autoFlush="false" buffer="1kb" errorPage="error.jsp" %>

	<% 
		for (int i = 1; i < 25; i++) {
			out.println("���� ��� ���� ũ��(out.getRemaining()) : " + out.getRemaining() + "<br>");
		}
	%>
</body>
</html>