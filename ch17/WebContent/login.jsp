<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>MVC ����</title>
</head>
<body>

<%
	Boolean res = (Boolean)request.getAttribute("resultlogin");
	String userid = request.getParameter("userid");
	if ( res.booleanValue() ) {
		out.println("����� " + userid + "��, �α��� �ϼ̽��ϴ�. �ݰ����ϴ�.");
	} else {
		out.println("����� " + userid + "��, ��ȣ�� �ٸ��ϴ�.");
	}
%>

<hr>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="result" value="${requestScope.resultlogin}" />

<c:choose> 
  <c:when test="${result}" > 
	����� ${param.userid}��, �α��� �ϼ̽��ϴ�. �ݰ����ϴ�.
  </c:when> 
  <c:otherwise> 
	����� ${param.userid}��, ��ȣ�� �ٸ��ϴ�.
	<jsp:include page="index.html" />
  </c:otherwise> 
</c:choose> 


</body>
</html>