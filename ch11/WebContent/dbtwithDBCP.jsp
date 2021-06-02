<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">


<title>Jakarta DBCP</title>
</head>
<body>
<%--디비씨피 이용 위해 웹과 서버 xml 에 수정 필요  --%>>

<%@ page import="java.sql.*, javax.sql.*, javax.naming.*" %> <%--1. 자바엑스,네이밍  임포트 --%>

<h2>Jakarta DBCP를 이용한 DB 연결 점검  </h2> <!-- -ㄷDBCP 는 데이터베이스 커넥션 풀 -->>
<%
try {
	InitialContext ctx = new InitialContext();  //2. 리소스를 위한 객체 이니셜콘텍스트  //일반 연결은 드라이버 얻
    DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/mysql"); //3. Lookup 메소들 통해 데이터 소스
    Connection con = ds.getConnection();  //4. 데이터 소스를 통해 커넥션 객체 얻기  커넥션  // 일반은 데이터매니저로 커넥션 얻
   
    
	/*
    Context initCtx = new InitialContext();    
    Context env = (Context) initCtx.lookup("java:comp/env/");  //env 까지만 받고  
    DataSource ds = (DataSource) env.lookup("jdbc/mysql");  //그걸로 마이애스큐앨 받을 수도 있
    Connection con = ds.getConnection();
	*/
	
    out.println("MySql 데이터베이스 univdb에 성공적으로 접속했습니다");
    con.close();  //5. 커넥션 닫기 
    
} catch (Exception e) {
	out.println("MySql 데이터베이스 univdb 접속에 문제가 있습니다. <hr>");
    out.println(e.getMessage());
    e.printStackTrace();
}
%>

</body>
</html>