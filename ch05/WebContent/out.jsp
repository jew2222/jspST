<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>JSP ���� out.jsp</title>
</head>
<body>
	<% 
		out.println("�� �κ��� ��µ��� �ʽ��ϴ�.");
		out.clear();	
	%>

	<h2>���� �������� ��� ���� ����</h2><p>

	�ʱ� ��� ���� ũ�� : <%=out.getBufferSize()%> byte<p>
	���� ��� ���� ũ�� : <%=out.getRemaining()%> byte<p>
	autoFlush : <%=out.isAutoFlush()%><p>

</body>
</html>