<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>JSP ���� date.jsp</title>
</head>
<body>

<% java.util.Date today = new java.util.Date(); %>
<% out.print("���� �ð��� [" + today + "] �Դϴ�"); %>

</body>
</html>