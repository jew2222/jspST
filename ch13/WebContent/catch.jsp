<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>JSTL Core: catch</title>
</head>
<body>

<h2>JSTL Core Tag: catch</h2>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>

<c:catch var="errMessage">
	<%= 2/0 %>
</c:catch>

<p>
<c:if test="${ !(empty errMessage) }">
���ܰ� �߻��Ͽ����ϴ�. ���� �޽��� : <hr>
${errMessage}
</c:if>

</body>
</html>