<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>JSTL Core: forTokens</title>
</head>
<body>

<h2>JSTL Core Tag: forTokens</h2>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="str" value="JSTL�� ǥ���±׷μ� �ھ�, XML, ����ȭ, SQL, �Լ� ���� �±׷� �����ȴ�."/>
${str} <p><hr>
�� ������ forTokens��  �Ӽ� delims=" ,.���μ��ȴ�" �������� ���� �ܾ�� ����������.<hr><p>

<c:forTokens var="token" delims=" ,.���μ��ȴ�" items="${str}">
${token} 
</c:forTokens>

</body>
</html>