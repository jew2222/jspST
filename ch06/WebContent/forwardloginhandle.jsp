<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>JSP ���� : forwardloginhandle.jsp</title>
</head>
<body>
	<%
	request.setCharacterEncoding("euc-kr");
	String userid = request.getParameter("userid");
	String passwd = request.getParameter("passwd");
	String studentnum = request.getParameter("snum");
	%>
	<% 
	if ( userid == null ? true : userid.equals("") ) {
	%>	
		<h2>�α��� </h2>
		<form method="post" action="forwardlogin.jsp">
		���̵� : <input type="text" name="userid"><br>
		��ȣ : <input type="text" name="passwd"><p>
		<input type="submit" value="�α���">
		<input type="reset" value="�ٽ��Է�">
		</form>
	<%	
	} else {
	%>
		���̵� : <%= userid %>, 
		��ȣ : <%= passwd %>, 
		�й� : <%= studentnum %> 
		<hr> ȸ����, �ݰ����ϴ�.
	<%
	}
	%>
</body>
</html>