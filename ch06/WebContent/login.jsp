<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>JSP ���� : login.jsp</title>
</head>
<body>
	<h2>�α��� ����</h2>
	<%
	request.setCharacterEncoding("euc-kr");
	String userid = request.getParameter("userid");
	String passwd = request.getParameter("passwd");
	%>
	<% 
	if (userid.equals("")) {
	%>
		<jsp:include page="loginhandle.jsp" >
			<jsp:param name="userid" value="guest" />
			<jsp:param name="passwd" value="anonymous" />
		</jsp:include>
	<% 
	} else {
	%>	
		<jsp:include page="loginhandle.jsp" />
	<% 
	}
	%>
</body>
</html>