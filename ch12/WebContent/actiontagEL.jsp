<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>ǥ������ �׼��±� �̿�</title>
</head>
<body>

<h2> ǥ������ �׼��±� �̿� </h2>

<jsp:useBean id="color" class="java.util.ArrayList">
<%
	color.add("red");
	color.add("orange");
	color.add("green");
	color.add("blue");
	color.add("violet");
%>
</jsp:useBean>

<ul>
	<font color="${color[0]}"> <li> �� ������ ${color[0]}���Դϴ�. </li> </font>	
	<font color="${color[1]}"> <li> �� ������ ${color[1]}���Դϴ�. </li> </font>	
	<font color="${color[2]}"> <li> �� ������ ${color[2]}���Դϴ�. </li> </font>	
	<font color="${color[3]}"> <li> �� ������ ${color[3]}���Դϴ�. </li> </font>	
	<font color="${color[4]}"> <li> �� ������ ${color[4]}���Դϴ�. </li> </font>	
</ul>

</body>
</html>