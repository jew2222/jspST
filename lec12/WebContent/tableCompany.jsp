<%@page import="com.mysql.cj.xdevapi.Statement"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>ȸ�� ���̺� ��� DBCP</title>
</head>
<body>
<%@ page import= "java.util.ArrayList, lec.CompanyEntity" %>

<jsp:useBean id="codb" class="lec.DatabaseDBCPbean" scope="page"/>

<h3>ȸ��</h3>

<%
   ArrayList<CompanyEntity> list = codb.getCompanyList();  //�����ͺ��̽� Ŭ������ ���� ����Ʈ ���

int count = list.size();
if (count > 0){

%>

<table width=100% border=2 cellpadding=1>
  <tr>
     <td align=center><b>ȸ���</b></td>
     <td align=center><b>��ǥ��</b></td>
     <td align=center><b>ȸ�� ������</b></td>
     <td align=center><b>����о�</b></td>
     <td align=center><b>�����</b></td>
     <td align=center><b>ä��Ը�</b></td>
     <td align=center><b>������</b></td>

  </tr>
<%
		for( CompanyEntity row : list ) { //�� �� ��ŭ �ݺ�
%>
<tr>
   <td align=center><%= row.getCom() %> </td>
   <td align=center><%= row.getPerson() %> </td>
   <td align=center><%= row.getLocation() %> </td>
   <td align=center><%= row.getCategory() %> </td>
   
   <td align=center><%= row.getMoney() %> </td>
   <td align=center><%= row.getScale() %> </td>
   
   <td align=center><%= row.getEmployee() %> </td>
   
 
</tr>
<%
	    }
%>
</table>
<% 	
}

%>

<hr>��ȸ�� ȸ�� ���� <%=count %> �� �Դϴ�.







</body>
</html>