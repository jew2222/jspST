<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>JSP ���� comments.jsp</title>
</head>
<body>
<!-- �̰��� HTML �ּ����� �� �������� [�ҽ� ����]���� ���Դϴ�. -->
	<%-- �̰��� JSP �ּ����� �������� [�ҽ� ����]���� �Ⱥ��Դϴ�.--%>
	<%! 
		/* 
			���밪�� ��ȯ�ϴ� �޼ҵ� abs()
		*/
		public int abs(int a) {  //�޼ҵ� ���� 
		    //if ������ Ȱ��
			if (a < 0) return -a; //�����̸� ����� ��ȯ
			else return a;        //����̸� �״�� ��ȯ
		}
	%>
	��������  <%= Math.PI %>�̴�. <br>
	-3�� ���밪�� <%= abs(-3) %>�̴�.
</body>
</html>