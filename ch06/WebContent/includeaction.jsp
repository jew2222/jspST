<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>JSP ���� : includeaction.jsp</title>
</head>
<body>
	<% int i = 12; %>
	<% int n = 365; %>
	1 ���� <%=i %>�� �Դϴ�.
	<jsp:include page="includesub.jsp" />
	1 ���� <%=n %>�� �Դϴ�.
</body>
</html>