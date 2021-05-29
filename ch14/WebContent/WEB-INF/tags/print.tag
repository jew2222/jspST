<%@ tag body-content="scriptless" pageEncoding="euc-kr" 
		description="���̺� student ���ڵ� ����±�"
		import="java.util.ArrayList" %>

<%@ attribute name="bgcolor" required="true" %>
<%@ attribute name="border" required="true" %>
<%@ attribute name="list" required="true" type="java.util.ArrayList"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="count" value="<%= list.size() %>" />
<c:if test="${count > 0}" var="bool" >

	<center>
	<H2><jsp:doBody /></H2>
    <table width=100% border="${border}" cellpadding=1>
    <tr bgcolor="${bgcolor}">
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

	<c:forEach var="stdt" items="${list}" >
    <tr>
       <td align=center>${stdt.id}</td>
       <td align=center>${stdt.passwd}</td>
       <td align=center>${stdt.name}</td>
       <td align=center>${stdt.year}</td>
       <td align=center>${stdt.snum}</td>
       <td align=center>${stdt.depart}</td>
       <td align=center>${stdt.mobile1}</td>
       <td align=center>${stdt.mobile2}</td>
       <td align=center>${stdt.address}</td>
       <td align=center>${stdt.email}</td>
    </tr>
	</c:forEach>
	</table>
	</center>

</c:if>

<p><hr>��ȸ�� �л� ����  ${count}�� �Դϴ�.			
