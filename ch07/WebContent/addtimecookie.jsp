<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>JSP ���� : addtimecookie.jsp</title>
</head>
<body>
	<h1>���� �ð��� ��Ű�� ����</h1>
	<hr>
	String now = new java.util.Date().toString(); <br>
	Cookie cookie = new Cookie("lastconnect", now); <br>
	cookie.setMaxAge(10); //�� ���� : 10��  <br>
	response.addCookie(cookie); <br>
	<%
		String now = new java.util.Date().toString();
		Cookie cookie = new Cookie("lastconnect", now); 
		cookie.setMaxAge(10); //�� ���� : 10��
		response.addCookie(cookie);
	%>
	<hr><a href=getcookies.jsp >��Ű ��ȸ</a>
</body>
</html>