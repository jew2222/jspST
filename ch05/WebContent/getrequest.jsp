<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>JSP ���� getrequest.jsp</title>
</head>
<body>

<h2> �޼ҵ� get ��Ŀ��� �ѱ� ó��</h2>
<hr>
�ѱ� ���� : <%= request.getParameter("korname")%><p>
���� ���� : <%= request.getParameter("engname")%><p>

</body>
</html>