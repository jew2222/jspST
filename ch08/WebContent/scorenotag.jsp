<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>JSP ���� : scorenotag.jsp</title>
</head>
<body>

	<h2>�±׸� ������� �ʴ� ������� JavaBeans�� �̿��ϴ� ����</h2>
	<% javabean.ScoreBean score = new javabean.ScoreBean(); %>

	<HR>
	<h3>�̸��� ������ JavaBeans ScoreBean�� ����</h3><p>
	�̸� : <%= "�輺��"%>, 
	���� : <%= "85" %><p>
	<% score.setName("�輺��"); %>
	<% score.setPoint(85); %>

	<HR>
	<h3>JavaBeans ScoreBean�� ����� ������ ��ȸ ���</h3><p>
	�̸� : <% out.println(score.getName()); %><br>
	���� : <% out.println(score.getPoint()); %>

</body>
</html>