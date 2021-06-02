<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>데이터베이스 연결해보자</title>
</head>
<body>

<%@ page import="java.sql.*" %> <%--1. jdbc 패키지 필요  임포트--%>>

<h2>데이터베이스 드라이버와 DB lecdb 연결 점검 프로그램 </h2>


<%
try {
    //String driverName = "org.gjt.mm.mysql.Driver"; //예전
    String driverName = "com.mysql.jdbc.Driver"; //요즘은 이렇게 사용
   
    
    String dbURL = "jdbc:mysql://localhost:3306/univdb?serverTimezone=UTC";

    Class.forName(driverName);  //2. 클래스경로 스트링 입력해 , 드라이버 클래스  로드
    Connection con = DriverManager.getConnection(dbURL, "root", "sushu"); //인자: url , 계정명, 비밀번호
    //3. 서버에 내가 만든 db url 스트링 입력해 , 커넥션 연결
    
    out.println("MySql 데이터베이스 univdb에 성공적으로 접속했습니다");
    con.close();  //4. 연결 자원 닫기
}
catch (Exception e) { //5.예외 처리
	out.println("MySql 데이터베이스 univdb 접속에 문제가 있습니다. <hr>");
    out.println(e.getMessage());
    e.printStackTrace();
}
%>

</body>
</html>