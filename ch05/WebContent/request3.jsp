<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>JSP ���� request3.jsp</title>
</head>
<body>

<%@ page import="java.util.Enumeration" %>
<%  request.setCharacterEncoding("euc-kr"); %>

<h2> ��̿� ������ ���� ���� ���</h2>

<%
	//Enumeration e = request.getParameterNames();
	Enumeration<String> e = request.getParameterNames();

   	while ( e.hasMoreElements() ) {
   		//String name = (String) e.nextElement();
   		String name = e.nextElement();
   		String [] data = request.getParameterValues(name);
		if (data != null) {
			for ( String eachdata : data ) 
     			out.println(eachdata + " ");
		}
		out.println("<p>");
   	}
%>

</body>
</html>