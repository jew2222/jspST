<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">


<title>�����ͺ��̽� �ڹ� ���� ���� : ���̺� student ��ȸ</title>
</head>
<body>

<%@ page import="java.util.ArrayList, univ.StudentEntity" %>  <%---1.������ó�� ��ü�� ��Ű���� ���� jsp���� ����Ʈ�� �Ѵ�--%>

<h2> �ڹ� ���� StudentDatabase�� �̿��� ���̺� student ��ȸ ���α׷� </h2>
<hr><center>
<h2>�л����� ��ȸ</h2>

	<jsp:useBean id="stdtdb" class="univ.StudentDatabase" scope="page" /> <%---2. ��� �ڹٺ� ��Ʃ��Ʈ �����ͺ��̽� �����Ͽ� ����̹� �ε�  --%>
<%
	ArrayList<StudentEntity> list = stdtdb.getStudentList();  //3. �޼ҵ�ȣ �� 
	//���ᰴü+ ����Ʈ ��ü ���� + �������� + ����Ʈ�� ó��+ ����Ʈ�� �߰� + Ŭ����

	int counter = list.size(); //�� �� 
	if (counter > 0) { //ó������ 
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
		for( StudentEntity stdt : list ) {  //����Ʈ (��ü ��)�ϳ��� �̾Ƽ� ����, ���� ȣ��  // ������ ����Ʈ�� ��� �ε� (��̸���Ʈ+ ��ƼƼŬ���� )
													// db�ڹٺ��� _����Ʈ�°�=->��ƼƼ -> ��ƼƼ��Ƽ� ����Ʈ ����  =-> jsp ����Ʈ�� ���྿ ��ƼƼ���� ���� �� 
 %>
    <tr>
       <td align=center><%= stdt.getId() %></td>
       <td align=center><%= stdt.getPasswd() %></td>
       <td align=center><%= stdt.getName() %></td>
       <td align=center><%= stdt.getYear() %></td>
       <td align=center><%= stdt.getSnum() %></td>
       <td align=center><%= stdt.getDepart() %></td>
       <td align=center><%= stdt.getMobile1() %></td>
       <td align=center><%= stdt.getMobile2() %></td>
       <td align=center><%= stdt.getAddress() %></td>
       <td align=center><%= stdt.getEmail() %></td>
    </tr>
<%
	    }
	}
%>
</table>
</center>

<p><hr>��ȸ�� �л� ���� <%=counter%>�� �Դϴ�.

</body>
</html>
