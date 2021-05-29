<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>JSP 예제</title>
</head>
<body>
<% 
	Cookie c = new Cookie("lang", "java");
	c.setMaxAge(60*60*24*7);
	response.addCookie(c);
	Cookie[] cs = request.getCookies();
	
	for ( Cookie cook : cs) {
		out.println(cook.getName() + ", ");
		out.println(cook.getValue());
	}
%>

</body>
</html>