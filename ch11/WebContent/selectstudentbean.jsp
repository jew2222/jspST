<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">


<title>데이터베이스 자바 빈즈 예제 : 테이블 student 조회</title>
</head>
<body>

<%@ page import="java.util.ArrayList, univ.StudentEntity" %>  <%---1.데이터처리 객체는 패키지가 없는 jsp에선 임포트를 한다--%>

<h2> 자바 빈즈 StudentDatabase를 이용한 테이블 student 조회 프로그램 </h2>
<hr><center>
<h2>학생정보 조회</h2>

	<jsp:useBean id="stdtdb" class="univ.StudentDatabase" scope="page" /> <%---2. 사용 자바빈 스튜던트 데이터베이스 생성하여 드라이버 로드  --%>
<%
	ArrayList<StudentEntity> list = stdtdb.getStudentList();  //3. 메소드호 출 
	//연결객체+ 리스트 객체 생성 + 구문실행 + 리절트셋 처리+ 리스트에 추가 + 클로즈

	int counter = list.size(); //행 수 
	if (counter > 0) { //처리있음 
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
		for( StudentEntity stdt : list ) {  //리스트 (전체 행)하나씩 뽑아서 겟터, 셋터 호출  // 원래는 리절트셋 담당 인데 (어레이리스트+ 엔티티클래스 )
													// db자바빈즈 _리절트셋값=->엔티티 -> 엔티티모아서 리스트 저장  =-> jsp 리스트를 한행씩 엔티티에서 겟터 함 
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

<p><hr>조회된 학생 수가 <%=counter%>명 입니다.

</body>
</html>
