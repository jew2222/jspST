<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>���� ����</title>
</head>
<body>

	<h3>�ѱ� ó�� ���� ����</h3>
	<hr>
	<% 
		String book = request.getParameter("jspbook");
		if ( book == null || book.length() == 0 ) {
	%>
			<h3>JSP ����  ���� ������? (�ѱ��Է�)</h3>
			<form method=post action=filter.jsp>
				<input type="text" name="jspbook">
				<input type="submit" value="Ȯ��">
			</form>
	<% 			
		} else {
			out.println("JSP ���� ���� ���� �̸� : " + book);
		}
	%>

</body>
</html>