<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>÷�� ���� ����</title>
</head>
<body>

<h2> ÷�� ���� ������ ���� </h2><hr>

<%@ page import="org.apache.commons.mail.MultiPartEmail" %>
<%@ page import="org.apache.commons.mail.EmailAttachment" %>

<%
String charSet = "euc-kr";
String hostSMTP = "localhost";
String toEmail = "hskang@dongyang.ac.kr";
String toName = "�� ȯ��";
String fromEmail = "hskang@infinitybooks.com";
String fromName = "ȫ�浿";
String subject = "MultiPartEmail Ŭ������ �̿��� ���� ������";
String msg = "������ �� ���� ������!!";

//÷���� ������ EmailAttachment�� ����
EmailAttachment attachment = new EmailAttachment();
attachment.setPath("C:\\java\\MySQL 5.1\\my.ini");
attachment.setDisposition(EmailAttachment.ATTACHMENT);
attachment.setDescription("MySQL �ʱ� ����");
attachment.setName("my.ini");

try {
	MultiPartEmail email = new MultiPartEmail();
	email.setCharset(charSet);  
	email.setHostName(hostSMTP);
	email.addTo(toEmail, toName, charSet);
	email.setFrom(fromEmail, fromName, charSet);
	email.setSubject(subject);
	email.setMsg(msg);
	// ������ attachment�� �߰�
	email.attach(attachment);	
	email.send();
	out.println("���� ������ ����!!!");
} catch (Exception e) {
	out.println("���� ������ ����!!! <hr>");
	out.println(e.toString() + "<hr>");
}
%>

</body>
</html>