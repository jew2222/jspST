<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>JSP 예제 : cookies.jsp</title>
</head>
<body>
	<h1>쿠키 예제</h1>
	<hr><h2>쿠키 만들기</h2>
	<%
		Cookie cookie1 = new Cookie("user", "hong");
		cookie1.setMaxAge(10); //One minute
		response.addCookie(cookie1);
		Cookie cookie2 = new Cookie("passwd", "3987");
		cookie2.setMaxAge(10); //One minute
		response.addCookie(cookie2);
	%>
	<hr><h2>쿠키 조회</h2>
	<%
		Cookie[] cookies = request.getCookies();
		if (cookies == null) {
			out.println("쿠키가 없습니다.");
		} else {
			for (int i=0; i<cookies.length; ++i) {
				out.println("Cookie Name : " + cookies[i].getName() + ", " );
				out.println("Cookie Value : " + cookies[i].getValue() + "<br>" );
			}
		}
	%>
</body>
</html>