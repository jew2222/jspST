<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>JSP ���� : addcookie.jsp</title>
</head>
<body>
	<h1>��Ű ����� ����</h1>
	<hr>
	Cookie cookie = new Cookie("user", "kang"); <br>
	cookie.setMaxAge(2 * 60); //�� ���� : 2�� <br>
	response.addCookie(cookie); <br>
	<%
		Cookie cookie = new Cookie("user", "kang");
		cookie.setMaxAge(2 * 60); //�� ���� : 2��
		response.addCookie(cookie);
	%>
	<hr><a href=addtimecookie.jsp >���� ���� �ð��� ��Ű�� �߰�</a>
</body>
</html>