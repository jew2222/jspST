<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>JSP ���� : forwardlogin.jsp</title>
</head>
<body>
	<h2>forward �±׸� �̿��� �α��� ����</h2>
	<%
	request.setCharacterEncoding("euc-kr");
	String userid = request.getParameter("userid");
	String passwd = request.getParameter("passwd");
	%>
	<% 
	if ( userid == null && passwd == null ) {
	%>
		<jsp:forward page="forwardloginhandle.jsp" />
	<% 
	} else {
	%>
		<jsp:forward page="forwardloginhandle.jsp" >
			<jsp:param name="snum" value="2010-3459" />
		</jsp:forward>	
	<% 
	}
	%>
</body>
</html>