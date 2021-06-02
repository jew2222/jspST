<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">


<title>Jakarta DBCP</title>
</head>
<body>
<%--����� �̿� ���� ���� ���� xml �� ���� �ʿ�  --%>>

<%@ page import="java.sql.*, javax.sql.*, javax.naming.*" %> <%--1. �ڹٿ���,���̹�  ����Ʈ --%>

<h2>Jakarta DBCP�� �̿��� DB ���� ����  </h2> <!-- -��DBCP �� �����ͺ��̽� Ŀ�ؼ� Ǯ -->>
<%
try {
	InitialContext ctx = new InitialContext();  //2. ���ҽ��� ���� ��ü �̴ϼ����ؽ�Ʈ  //�Ϲ� ������ ����̹� ��
    DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/mysql"); //3. Lookup �޼ҵ� ���� ������ �ҽ�
    Connection con = ds.getConnection();  //4. ������ �ҽ��� ���� Ŀ�ؼ� ��ü ���  Ŀ�ؼ�  // �Ϲ��� �����͸Ŵ����� Ŀ�ؼ� ��
   
    
	/*
    Context initCtx = new InitialContext();    
    Context env = (Context) initCtx.lookup("java:comp/env/");  //env ������ �ް�  
    DataSource ds = (DataSource) env.lookup("jdbc/mysql");  //�װɷ� ���ֽ̾�ť�� ���� ���� ��
    Connection con = ds.getConnection();
	*/
	
    out.println("MySql �����ͺ��̽� univdb�� ���������� �����߽��ϴ�");
    con.close();  //5. Ŀ�ؼ� �ݱ� 
    
} catch (Exception e) {
	out.println("MySql �����ͺ��̽� univdb ���ӿ� ������ �ֽ��ϴ�. <hr>");
    out.println(e.getMessage());
    e.printStackTrace();
}
%>

</body>
</html>