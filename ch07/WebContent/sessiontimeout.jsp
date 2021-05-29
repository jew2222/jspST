<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>JSP ���� : sessiontimeout.jsp</title>
</head>
<body>
	<%@ page import="java.util.Enumeration, java.util.Date" %>
	<h1>���� ����</h1>
	<hr><h2>���� �����</h2>
	<%! long beforetime = new Date().getTime(); //���� ������ ���� �ð��� �����ϴ� �Ҽ� ���� %>
	<%
		long nowtime = new Date().getTime();
		if ( session.isNew() ) {
			session.setAttribute("id", session.getId());
			session.setAttribute("time", new Date(session.getCreationTime()));
			session.setMaxInactiveInterval(5);
		} else {
			session.removeAttribute("id");		
		}
	%>
	<hr><h2>���� ��ȸ</h2>
	���� ID (������ �ĺ���) : <%= session.getAttribute("id") %><br>
	���� CreationTime : <%=session.getAttribute("time") %><br>
	���� MaxInactiveInterval : <%=session.getMaxInactiveInterval() %><br>
	<% long sessiontime = nowtime - session.getCreationTime(); %>
	������ ������� ���� ���� �ð� : <%=sessiontime/1000 %>��

	<font color=blue><hr> 
	<% long inactiveinterval = nowtime - beforetime; %>
	������ ������ ������ ���� �ð� : <%=inactiveinterval/1000 %>�� <br>
	�� �ð��� <%=session.getMaxInactiveInterval() %>�ʸ� ������ 
        ���� ������ ��ȿ�͵ǰ� ���ο� ������  ����</font><br>

	<% beforetime = nowtime; %>
</body>
</html>