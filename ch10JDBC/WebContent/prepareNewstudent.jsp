<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>  DBCP 이용 : 테이블 student 레코드 삽입</title>
</head>
<body>

<%@ page import="java.sql.*, javax.sql.*, javax.naming.*" %>  <%--1. 자바엑스,네이밍  임포트 --%>

<h2>DBCP 이용 : 데이터베이스 univdb의 테이블 student에 학생 삽입 프로그램 </h2>

<hr><center>
<h2>학생 삽입</h2>

<%
    Connection con = null;
    PreparedStatement pstmt = null;
    Statement stmt = null;
    
    //
    StringBuffer SQL = new StringBuffer("insert into student "); // 초기화시 먼저 구문 넣어 두기 
    SQL.append("values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");  //어펜드로 ? 조건들 을 넣음 
    String name = "전미정";

    try {
    	//DBCP
        Context initCtx = new InitialContext();      //2. 리소스를 위한 객체 이니셜콘텍스트  
        Context env = (Context) initCtx.lookup("java:comp/env/");     //3. Lookup 메소들 통해 데이터 소스 얻
        DataSource ds = (DataSource) env.lookup("jdbc/mysql");   
        con = ds.getConnection();  //4. 데이터 소스를 통해 커넥션 객체 얻기  커넥션
        
       /* InitialContext ctx = new InitialContext();  //2. 리소스를 위한 객체 이니셜콘텍스트  //일반 연결은 드라이버 얻
        DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/mysql"); //3. Lookup 메소들 통해 데이터 소스
        Connection con = ds.getConnection();  //4. 데이터 소스를 통해 커넥션 객체 얻기  커넥션  // 일반은 데이터매니저로 커넥션 얻
       */
        

        pstmt = con.prepareStatement(SQL.toString());  //5. 커넥션 통해 스테이트먼트 객체 만들가ㅣ (조건이 있는)  //버퍼로 저장한 구문 문자로
        //
        //6. ? 삽입할 학생 레코드 데이터 입력
        pstmt.setString(1, "DBCP");
        pstmt.setString(2, "commons");
        pstmt.setString(3, name);
        pstmt.setInt(4, 2010);
        pstmt.setString(5, "1039653");
        pstmt.setString(6, "전산정보과");
        pstmt.setString(7, "011");
        pstmt.setString(8, "2398-9750");
        pstmt.setString(9, "인천시");
        pstmt.setString(10, "dbcp@gmail.com");

        int rowCount = pstmt.executeUpdate();        //7. 변경돤 항목 수를 반환하는 실행메소드
        if (rowCount == 1) out.println("<hr>학생 [" + name+ "] 레코드 하나가 성공적으로 삽입 되었습니다.<hr>");  //하나 변경이 있었다면 
        else out.println("학생 레코드 삽입에 문제가 있습니다.");
        
     
        
        
       //다시 다른 구문으로  학생 조회
        stmt = con.createStatement();
        ResultSet result = stmt.executeQuery("select * from student;");        
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
<%
        while (result.next()) {
%>
  <tr>
     <td align=center><%= result.getString(1) %></td>
     <td align=center><%= result.getString(2) %></td>
     <td align=center><%= result.getString(3) %></td>
     <td align=center><%= result.getString(4) %></td>
     <td align=center><%= result.getString(5) %></td>
     <td align=center><%= result.getString(6) %></td>
     <td align=center><%= result.getString(7) %></td>
     <td align=center><%= result.getString(8) %></td>
     <td align=center><%= result.getString(9) %></td>
     <td align=center><%= result.getString(10) %></td>
  </tr>
<%
        }
        result.close();  //리절트 셋 닫 
    }
    catch(Exception e) {
    	out.println("MySql 데이터베이스 univdb의 student에 삽입 또는 조회에 문제가 있습니다.<hr>");
        out.println(e.toString());
        e.printStackTrace();
    }
    finally {  //p스테이트먼트와 연결 닫
        if(pstmt != null) pstmt.close();
        if(con != null) con.close();
    }
%>
</table>
</center>

</body>
</html>