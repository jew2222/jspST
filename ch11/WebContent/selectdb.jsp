<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>데이터베이스 예제 : 테이블 student 조회</title>
</head>
<body>

<%@ page import="java.sql.*" %>

<h2>데이터베이스 univdb의 테이블 student 조회 프로그램 </h2>

<hr><center>
<h2>학생정보 조회</h2>

<%
    Connection con = null;
    Statement stmt = null;
    //String driverName = "org.gjt.mm.mysql.Driver";
    String driverName = "com.mysql.jdbc.Driver";
    String dbURL = "jdbc:mysql://localhost/univdb";

    try {
        Class.forName(driverName);
        con = DriverManager.getConnection(dbURL, "root", "");
        stmt = con.createStatement();
        ResultSet result = stmt.executeQuery("select * from student;");
%>
    <table width=100% border=2 cellpadding=1>
    <tr>
       <td align=center><b>번호</b></td>
       <td align=center><b>제목</b></td>
       <td align=center><b>작성자</b></td>
       <td align=center><b>작성일</b></td>
    </tr>
<%
        while (result.next()) {
%>
    <tr>
       <td align=center><%= result.getString(1) %></td>
       <td align=center><%= result.getString(2) %></td>
       <td align=center><%= result.getString(3) %></td>
       <td align=center><%= result.getString(4) %></td>
    </tr>
<%
        }
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
