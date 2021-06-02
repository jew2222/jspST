<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>인터페이스 ResultSetMetaData 조회</title>
</head>
<body>

<%@ page import="java.sql.*" %>

<h2>테이블 메타데이터 조회 프로그램 </h2>

<hr><center>
<h2>인터페이스 ResultSetMetaData 이용 메타데이터 테이블 출력 </h2>

<%
    Connection con = null;
    Statement stmt = null;
    //String driverName = "org.gjt.mm.mysql.Driver";
    String driverName = "com.mysql.jdbc.Driver";
    String dbURL = "jdbc:mysql://localhost:3306/univdb?serverTimezone=UTC";

    try {
        Class.forName(driverName);
        con = DriverManager.getConnection(dbURL, "root", "sushu");
        stmt = con.createStatement();
        ResultSet result = stmt.executeQuery("select * from student;");
        
        
        ResultSetMetaData rsmd = result.getMetaData(); //리절트셋을 이용 그 메타 데이터를 가지는 객체 
        int cCount = rsmd.getColumnCount();   //행 수 를 쉽게 얻을 수 있음
%>
  <table width=100% border=2 cellpadding=1>
  <tr>
     <td align=center><b>아이디</b></td>
     <td align=center><b>암호</b></td>
     <td align=center><b>이름</b></td>
     <td align=center><b>입학년도</b></td>
     <td align=center><b>학번</b></td>
     <td align=center><b>학과</b></td>
     <td align=center><b>휴대폰1</b></td>
     <td align=center><b>휴대폰2</b></td>
     <td align=center><b>주소</b></td>
     <td align=center><b>이메일</b></td>
  </tr>
  <tr>
<%
		for ( int i = 1; i <= cCount; i++ ) { //리절트셋 객체는 첫번째 엔트리가 1
%>
       <td align=center><%= rsmd.getColumnName(i) %></td>  
<% //db에 저장된 컬럼네임을 행으로 출력 
		}
%>
    </tr>
    <tr>
<%
		for ( int i = 1; i <= cCount; i++ ) {
%>
       <td align=center><%= rsmd.getColumnTypeName(i) %></td>
<%    //db에 저장된   타입을 행으로 출력 
		}
%>
    </tr>
    <tr>
<%
		for ( int i = 1; i <= cCount; i++ ) {
%>
       <td align=center><%= rsmd.getPrecision(i) %></td>
<%      //db에 저장된 컬럼의 사이즈를 행으로 출력 
		}
%>
    </tr>
<%
        result.close();
    }
    catch(Exception e) {
    	out.println("MySql 데이터베이스 univdb의 student 조회에 문제가 있습니다. <hr>");
        out.println(e.toString());
        e.printStackTrace();
    }
    finally {
        if(stmt != null) stmt.close();
        if(con != null) con.close();
        
    }
    
%>




</table>
</center>

</body>
</html>