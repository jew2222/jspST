package univ;

import java.sql.*;  //jdbc
import java.util.ArrayList;  //각각의 줄 '엔티티' 위한 객체

// 테이블 student를 위한 <<<데이터베이스 연동>>> 자바빈즈 프로그램
//드라이버 로드, 연결 객체 , 
public class StudentDatabase {

	// 데이터베이스 연결 관련 상수 선언
	private static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
	//private static final String JDBC_DRIVER = "org.gjt.mm.mysql.Driver";
	private static final String JDBC_URL = "jdbc:mysql://localhost:3306/univdb?serverTimezone=UTC";
	private static final String USER = "root";
	private static final String PASSWD = "sushu";

	// 데이터베이스 연결 관련 변수 선언
	private Connection con = null;
	private Statement stmt = null;

	
	
	
	public StudentDatabase() {    // JDBC 드라이버를 로드하는 생성자
		       
		try {
			Class.forName(JDBC_DRIVER); //// JDBC 드라이버 로드
			
		} catch (Exception e) {
			e.printStackTrace();
		}		
	}

	
	public void connect() {  //1. 데이터베이스 연결 메소드
		try {
			// 데이터베이스에 연결, Connection 객체 저장 
			con = DriverManager.getConnection(JDBC_URL, USER, PASSWD);  //
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	
	public void disconnect() {   // 데이터베이스 연결 해제 메소드 
		if(stmt != null) {   //
			try {
				stmt.close();
				
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} 
		if(con != null) {   //
			try {
				con.close();
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}


	public ArrayList<StudentEntity> getStudentList() {	 	// 게시판의 모든 레코드를 반환하는 메소드//어레이를 꿰고 문장 실행 ,리절트셋처리
		//엔티티, 어레이 리스트를 반환
		
		
		connect();  //1.
		
		
	// 2. 질의 결과를 저장할 ArrayList를 선언
	// ArrayList 내부에  StudentEntity가 삽입되도록 한정 
		ArrayList<StudentEntity> list = new ArrayList<StudentEntity>(); 

		String SQL = "select * from student";
		try {
			stmt = con.createStatement(); //3.
			ResultSet rs = stmt.executeQuery(SQL); //4. 

			//ResultSet의 결과 모든 행을 각각의 StudentEntity 객체에 저장  
			while (rs.next()) {		
				
				//한 행! 의 학생정보를 저장할 학생을 위한 빈즈 객체 생성  
				StudentEntity stu = new StudentEntity(); //5. 데이터 처리용 자바빈 생성

				//6. 자바 빈즈 엔티티 객체에 셋터를 통해  저장  <- 리절트셋에서 가져온 값				
				stu.setId ( rs.getString("id") );
				stu.setPasswd ( rs.getString("passwd") );
				stu.setName ( rs.getString("name") );
				stu.setYear ( rs.getInt("year") );
				stu.setSnum ( rs.getString("snum") );
				stu.setDepart ( rs.getString("depart") );
				stu.setMobile1 ( rs.getString("mobile1") );
				stu.setMobile2 ( rs.getString("mobile2") );
				stu.setAddress ( rs.getString("address") );
				stu.setEmail ( rs.getString("email") );
				
				
				//7. ArrayList에 학생정보 StudentEntity 객체 하나를 추가 // 반복
				list.add(stu);
			}
			rs.close();			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		finally {
			disconnect();
		}
		
		return list;  //8. 완성된 ArrayList 객체를 반환
	}

}
