<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>JSP ���� : loginhandle.jsp</title>
</head>
<body>
	<%
	request.setCharacterEncoding("euc-kr");
	String userid = request.getParameter("userid");
	String passwd = request.getParameter("passwd");
	%>
	<% 
	if (userid.equals("guest")) {
		out.println("ȸ���� �ƴϽñ���. �ݰ����ϴ�.<br>");
		out.println("�������� �α��� �ϼ���.<hr>");
	} else {
		out.println("ȸ����, �ݰ����ϴ�.<hr>");
	}
	%>
	���̵� : <%= userid %>, 
	��ȣ : <%= passwd %>
</body>
</html>