<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>JSP ���� : cookie.jsp</title>
</head>
<body>
	<h1>��Ű ����</h1>
	<hr><h2>��Ű �����</h2>
	<%
		Cookie cookie = new Cookie("user", "hong");
		cookie.setMaxAge(10); //One minute
		response.addCookie(cookie);
	%>
	<hr><h2>��Ű ��ȸ</h2>
	<%
		Cookie[] cookies = request.getCookies();
		if (cookies == null) {
			out.println("��Ű�� �����ϴ�.");
		} else {
			for (int i=0; i<cookies.length; ++i) {
				out.println("Cookie Name : " + cookies[i].getName() + ", " );
				out.println("Cookie Value : " + cookies[i].getValue() + "<br>" );
			}
		}
	%>
</body>
</html>