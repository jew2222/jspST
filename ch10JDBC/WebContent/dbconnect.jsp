<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�����ͺ��̽� �����غ���</title>
</head>
<body>

<%@ page import="java.sql.*" %> <%--1. jdbc ��Ű�� �ʿ�  ����Ʈ--%>>

<h2>�����ͺ��̽� ����̹��� DB lecdb ���� ���� ���α׷� </h2>


<%
try {
    //String driverName = "org.gjt.mm.mysql.Driver"; //����
    String driverName = "com.mysql.jdbc.Driver"; //������ �̷��� ���
   
    
    String dbURL = "jdbc:mysql://localhost:3306/univdb?serverTimezone=UTC";

    Class.forName(driverName);  //2. Ŭ������� ��Ʈ�� �Է��� , ����̹� Ŭ����  �ε�
    Connection con = DriverManager.getConnection(dbURL, "root", "sushu"); //����: url , ������, ��й�ȣ
    //3. ������ ���� ���� db url ��Ʈ�� �Է��� , Ŀ�ؼ� ����
    
    out.println("MySql �����ͺ��̽� univdb�� ���������� �����߽��ϴ�");
    con.close();  //4. ���� �ڿ� �ݱ�
}
catch (Exception e) { //5.���� ó��
	out.println("MySql �����ͺ��̽� univdb ���ӿ� ������ �ֽ��ϴ�. <hr>");
    out.println(e.getMessage());
    e.printStackTrace();
}
%>

</body>
</html>