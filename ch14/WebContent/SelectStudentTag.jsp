<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Ŀ���� �±�</title>
</head>
<body>

<h2> Ŀ���� �±׸� �̿��� student ��ȸ ���α׷� </h2>
<hr>

	<%@ taglib uri="/WEB-INF/tld/SelectStudentTag.tld" prefix="mytag" %> 
	<jsp:useBean id="stdtdb" class="univ.StudentDatabaseCP" scope="page" />
	
	<mytag:print border="1" bgcolor="skyblue" list="${stdtdb.studentList}" >
	�л�������ȸ
	</mytag:print>

</body>
</html>