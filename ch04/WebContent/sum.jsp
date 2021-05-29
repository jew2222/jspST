<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>JSP 예제 sum.jsp</title>
</head>
<body>
	<% int i, n = 10, sum = 0; %>
	<% 
		for (i = 1; i <= n; i++) {
	   		sum += i;
		}
	%>
	1부터 <%= n %>까지의 합은  <%= sum %> 이다.
</body>
</html>