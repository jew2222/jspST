<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>JSP ���� stdudent.jsp</title>
</head>
<body>

	<h2>JavaBean StudentBean�� �̿��� ����</h2>

	<% request.setCharacterEncoding("euc-kr"); %>
	<jsp:useBean id="student" class="javabean.StudentBean" scope="page" />

	<hr>
	<h3>������ ���޹��� �л������� �״�� �ڹٺ� StudentBean�� ����</h3><p>
	<jsp:setProperty name="student" property="*" /> 

	<hr>
	<h3>JavaBean StudentBean�� ����� ������ ��ȸ ���</h3><p>

	�л�  ID : <jsp:getProperty name="student"  property="id" /><br>
	�л� �̸� : <jsp:getProperty name="student" property="name" /><br>
	�л� ��ȣ : <jsp:getProperty name="student" property="snum" /><br>
           ����(����) : <%=student.getAge() %>(<jsp:getProperty name="student" property="year" />)<br>
	��ȣ : <jsp:getProperty name="student" property="pass" /><br>
	���ڸ��� : <jsp:getProperty name="student" property="email" /><br>

</body>
</html>
