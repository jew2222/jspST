<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>JSTL Core: set target</title>
</head>
<body>

<h2>JSTL Core Tag: set target</h2>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="book" value="<%= new java.util.HashMap() %>" />
<c:set target="${book}" property="java" value="�ڹٷ� ���� ���α׷��� ����" />
<c:set target="${book}" property="c" value="C�� ���� ���α׷��� ����" />
<c:set target="${book}" property="jsp" value="JSP�� ���� ���ͳ����α׷��� ����" />

\${book.java} = ${book.java} <p>
\${book.c} = ${book.c} <p>
\${book.jsp} = ${book.jsp} <p>

<c:set target="${pageScope}" property="name" value="ȫ�浿" />
\${pageScope.name} = ${pageScope.name} <p>

<jsp:useBean id="oneday" class="java.util.Date" />
<c:set target="${oneday}" property="year" value="2010" />
\${oneday.year} = ${oneday.year} <p>

</body>
</html>