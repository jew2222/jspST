<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>JSP ���� page.jsp</title>
</head>
<body>

	<%@ page info="���� ��ü page : page �ڱ� �ڽ��� ��ü"  %>
	<%= this.getServletInfo() %> <p>	
	<%= ((org.apache.jasper.runtime.HttpJspBase) (page)).getServletInfo() %>

</body>
</html>