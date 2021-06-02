<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>데이터베이스 예제 : 테이블 student name으로 검색</title>
</head>
<body>

<%@ page import="java.sql.*" %>
<% request.setCharacterEncoding("euc-kr"); //포스트 방식 받을때 언제나 %>

<h2>테이블 에서 이름으로 조회 검색하는 프로그램 </h2>
<hr><center>
<h2>학생정보 조회</h2>

<%
    Connection con = null;
    PreparedStatement pstmt = null;
   // String driverName = "org.gjt.mm.mysql.Driver";
    String driverName = "com.mysql.jdbc.Driver";
    String dbURL = "jdbc:mysql://localhost:3306/univdb?serverTimezone=UTC";
    
    String sql = "select * from student where name like ?"; //3-1.구문의 웨어 조건에 ? 를 넣는다
    String name = request.getParameter("sname") + "%"; 
          //4.selectname.html에서 인풋값을 받는다.뒤에는 %와일트카드를 붙인다
    int rowCount = 0;

    try {
        Class.forName(driverName);//1
        con = DriverManager.getConnection(dbURL, "root", "sushu");//2
        
        pstmt = con.prepareStatement(sql); //3. 스테이트먼트  객체 중 ?값 변경 구문을 위한 객체 생성
        pstmt.setString(1, name); //5.구문 객체에 ?를 ()로 참조하여  사용자 입력값으로 대체한다 
        		
        ResultSet result = pstmt.executeQuery(); //6. 구문 실행해 리절트셋형식으로 받음
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
      while (result.next()) {  //7.8.
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
			rowCount++; //9. 검색 결과 기록을 위해, 행 실행 갯수 세기
        }
        result.close();        //10.
    }
    catch(Exception e) {
    	out.println("MySql 데이터베이스 univdb의 student 조회에 문제가 있습니다. <hr>");
        out.println(e.toString());
        e.printStackTrace();
    }
    finally {
        if(pstmt != null) pstmt.close();
        if(con != null) con.close();
    }
    
    
%>
</table>
</center>
<!-- -- -->
<p><hr><font color=blue>
<%
if (rowCount == 0) 
	out.println("조회된 결과가 없습니다.");
else 
	out.println("조회된 결과가 " + rowCount + "건 입니다.");    
%>
</font>

</body>
</html>