<%@page import="com.mysql.cj.xdevapi.Statement"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>회사 테이블 출력 DBCP</title>
</head>
<body>
<%@ page import= "java.util.ArrayList, lec.CompanyEntity" %>

<jsp:useBean id="codb" class="lec.DatabaseDBCPbean" scope="page"/>

<h3>회사</h3>

<%
   ArrayList<CompanyEntity> list = codb.getCompanyList();  //데이터베이스 클래스를 통해 리스트 얻기

int count = list.size();
if (count > 0){

%>

<table width=100% border=2 cellpadding=1>
  <tr>
     <td align=center><b>회사명</b></td>
     <td align=center><b>대표자</b></td>
     <td align=center><b>회사 소재지</b></td>
     <td align=center><b>사업분야</b></td>
     <td align=center><b>매출액</b></td>
     <td align=center><b>채용규모</b></td>
     <td align=center><b>직원수</b></td>

  </tr>
<%
		for( CompanyEntity row : list ) { //행 수 만큼 반복
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

<hr>조회된 회사 수는 <%=count %> 개 입니다.







</body>
</html>