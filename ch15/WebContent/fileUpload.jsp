<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>���� ���ε� ó��</title>
</head>
<body>

<h2> ���� ���ε� ����</h2><hr>
<%@ page import = "org.apache.commons.fileupload.disk.DiskFileItemFactory" %>
<%@ page import = "org.apache.commons.fileupload.servlet.ServletFileUpload" %>
<%@ page import = "org.apache.commons.fileupload.FileItem" %>
<%@ page import = "java.io.File" %>
<%@ page import = "java.io.IOException" %>
<%@ page import = "java.util.List" %>

<%
	//���ε�� ������ ����Ǵ� ����
	String strSaveDir = getServletContext().getRealPath("uploadStorage");
	File saveDir = new File(strSaveDir);
    out.println("���ε�Ǵ� ������ ����� ���� : <br>" + saveDir.getPath() + "<p>");
    
	//���ε忡 �ʿ��� �ӽ� ����
	String strTempDir = getServletContext().getRealPath("temp");
	File tempDir = new File(strTempDir);
    if ( !tempDir.exists() ) tempDir.mkdir();
    out.println("���ε带 ���� �ӽ� ���� : <br>" + tempDir.getPath() + "<br><hr>");
	
    if (ServletFileUpload.isMultipartContent(request)) {  
		// Create a factory for disk-based file items
        //DiskFileItemFactory factory = new DiskFileItemFactory(1024*100, tempDir);
        DiskFileItemFactory factory = new DiskFileItemFactory();
        factory.setSizeThreshold(1024*100);
        factory.setRepository(tempDir);

        // Create a new file upload handler
        ServletFileUpload upload = new ServletFileUpload(factory);
        // Set overall request size constraint
        upload.setSizeMax(1024*1024);
        
        // request�� �м��� �� �׸����� ó�� 
        List<FileItem> items = upload.parseRequest(request);
        out.println("<h3> ���ε� ó�� ���  </h3> <p><hr>");     	
        for ( FileItem fileItem : items ) {  
			//�Ϲ� ���ڿ� ���Ͼ��ε� ���ڸ� �����Ͽ� ó�� 
            if (fileItem.isFormField()) {
                // ���� �̿��� �Ķ���� ���� ���
                out.println(fileItem.getFieldName() + " : " + fileItem.getString("euc-kr") + "<p><hr>");
            } else {
                // ���ε��� ������ �����ϴ� ���
                if ( fileItem.getSize() > 0) {	
                	//���� �̸��� �����Ͽ� fileName�� ����
                    String fileName = new File( fileItem.getName() ).getName();
                    //���ε����� ���� ���� ���� 
                    if ( !saveDir.exists() ) saveDir.mkdir();
                    
                    try {
                        File uploadedFile = new File(saveDir, fileName);
                    	//���� �̸��� �̹� ������ ���� �ð������� �ڿ� ���� ���� �̸����� ����   
                        if ( uploadedFile.exists() ) {
                        	java.util.Date now = new java.util.Date();
                        	String newFileName = fileName + "-" + now.getTime();
                        	uploadedFile = new File(saveDir, newFileName);
                            out.println("�̸��� ���� ������ �̹� �־� ���� ���� �̸����� �����Ͽ����ϴ�. <br>");
                            out.println("���� ���� �̸� : " + fileName + ", ");
                            out.println("���� ���� �̸� : " + newFileName + "<p>");
                        }
                        //���ε� ���� ����
                        fileItem.write(uploadedFile);
                        out.println("���ε� ���� ��ġ : " + saveDir.getPath() + "<br>");
                        out.println("���ε� ���� �̸� : " + uploadedFile.getName() + "<p><hr>");
                    } catch(IOException e) {
                        // ���� ó��
                        out.println(e.toString());
                    }
                }
            }  
        }
    }
%>        

</body>
</html>