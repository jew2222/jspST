<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>JSP ���� application.jsp</title>
</head>
<body>

<%! int application = 0; %>	
<%! int count = 0; %>	

<%	
	String scount = (String) application.getAttribute("count");
	
	if (scount != null) {
		count = Integer.parseInt(scount);
	} else {
		count = 0;
	}
		
	application.setAttribute("count", Integer.toString(++count));
	application.log("������� ��ȸ �� : " + count);
%>
	���� �����̳� ���� : <%=application.getServerInfo() %> <p>
	������� ��ȸ �� : <%=count %>

</body>
</html>