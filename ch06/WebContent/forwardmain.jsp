<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>JSP ���� : forwardmain.jsp</title>
</head>
<body>
	<h2> forward �׼� �±� </h2>
	forwardmain.jsp ���� ���� �κ��Դϴ�.<br> 
	forward �±״� ������ �Ӽ� ���Ϸ� ��� �ұ�ϴ�.<br>
	forwardmain.jsp �������� ��� ������ �ϳ��� ��µ��� �ʽ��ϴ�.<br>
	
	<jsp:forward page="forwardsub.jsp" />

	forwardmain.jsp ���� �� �κ��Դϴ�. 
</body>
</html>