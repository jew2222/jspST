<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�����ͺ��̽� ���� : ���̺� student name���� �˻�</title>
</head>
<body>

<%@ page import="java.sql.*" %>
<% request.setCharacterEncoding("euc-kr"); //����Ʈ ��� ������ ������ %>

<h2>���̺� ���� �̸����� ��ȸ �˻��ϴ� ���α׷� </h2>
<hr><center>
<h2>�л����� ��ȸ</h2>

<%
    Connection con = null;
    PreparedStatement pstmt = null;
   // String driverName = "org.gjt.mm.mysql.Driver";
    String driverName = "com.mysql.jdbc.Driver";
    String dbURL = "jdbc:mysql://localhost:3306/univdb?serverTimezone=UTC";
    
    String sql = "select * from student where name like ?"; //3-1.������ ���� ���ǿ� ? �� �ִ´�
    String name = request.getParameter("sname") + "%"; 
          //4.selectname.html���� ��ǲ���� �޴´�.�ڿ��� %����Ʈī�带 ���δ�
    int rowCount = 0;

    try {
        Class.forName(driverName);//1
        con = DriverManager.getConnection(dbURL, "root", "sushu");//2
        
        pstmt = con.prepareStatement(sql); //3. ������Ʈ��Ʈ  ��ü �� ?�� ���� ������ ���� ��ü ����
        pstmt.setString(1, name); //5.���� ��ü�� ?�� ()�� �����Ͽ�  ����� �Է°����� ��ü�Ѵ� 
        		
        ResultSet result = pstmt.executeQuery(); //6. ���� ������ ����Ʈ���������� ����
%>

    <table width=100% border=2 cellpadding=1>
    <tr>
       <td align=center><b>���̵�</b></td>
       <td align=center><b>��ȣ</b></td>
       <td align=center><b>�̸�</b></td>
       <td align=center><b>���г⵵</b></td>
       <td align=center><b>�й�</b></td>
       <td align=center><b>�а�</b></td>
       <td align=center><b>�޴���1</b></td>
       <td align=center><b>�޴���2</b></td>
       <td align=center><b>�ּ�</b></td>
       <td align=center><b>�̸���</b></td>
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
			rowCount++; //9. �˻� ��� ����� ����, �� ���� ���� ����
        }
        result.close();        //10.
    }
    catch(Exception e) {
    	out.println("MySql �����ͺ��̽� univdb�� student ��ȸ�� ������ �ֽ��ϴ�. <hr>");
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
	out.println("��ȸ�� ����� �����ϴ�.");
else 
	out.println("��ȸ�� ����� " + rowCount + "�� �Դϴ�.");    
%>
</font>

</body>
</html>