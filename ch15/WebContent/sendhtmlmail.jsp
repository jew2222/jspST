<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>HMTL ���� ����</title>
</head>
<body>

<h2> HTML ���� ������ ���� </h2><hr>

<%@ page import="org.apache.commons.mail.HtmlEmail" %>
<%@ page import="java.net.URL" %>

<%
String charSet = "euc-kr";
String hostSMTP = "localhost";
String toEmail = "hskang@dongyang.ac.kr";
String toName = "�� ȯ��";
String fromEmail = "hskang@infinitybooks.com";
String fromName = "������";
String subject = "HtmlEmail Ŭ������ �̿��� ���� ������";

try {
	HtmlEmail email = new HtmlEmail();
	email.setDebug(true);
	email.setCharset(charSet);  
	email.setHostName(hostSMTP);
	email.addTo(toEmail, toName, charSet);
	email.setFrom(fromEmail, fromName, charSet);
	email.setSubject(subject);
	
	// ������ �̹����� �� Content Id�� ����
	URL url = new URL("http://www.infinitybooks.co.kr/images/top_logo.jpg");
	String cid = email.embed(url, "���Ǵ�Ƽ�Ͻ� �ΰ�");

	// HTML �޼����� ����
	StringBuffer htmlmsg = new StringBuffer();
	htmlmsg.append("<html><body>");
	htmlmsg.append("���Ǵ�Ƽ�Ͻ� �ΰ� : <img src=cid:").append(cid).append(">");
	htmlmsg.append("</body></html>");
	email.setHtmlMsg(htmlmsg.toString()); 
	 
	// HTML �̸����� �������� �ʴ� Ŭ���̾�Ʈ��� ���� �޼����� ���
	email.setTextMsg("�� ������ HTML �̸����� �������� �ʽ��ϴ�");
	email.send();
	
	out.println("���� ������ ����!!!");
} catch (Exception e) {
	out.println("���� ������ ����!!! <hr>");
	out.println(e.toString() + "<hr>");
}
%>

</body>
</html>