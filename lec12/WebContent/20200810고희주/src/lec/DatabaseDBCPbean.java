package lec;

import java.sql.*;
import javax.sql.DataSource;

import sun.rmi.transport.proxy.RMIHttpToPortSocketFactory;

import java.util.ArrayList;
import javax.naming.InitialContext;
import javax.naming.NamingException;



public class DatabaseDBCPbean {
	
	private Connection con =null;
	private PreparedStatement pstmt = null;
	private DataSource ds = null;
	
	private String sqlin;
	
	//생성자
	
	public DatabaseDBCPbean() {
		
		
		
		try {
			InitialContext ctx = new InitialContext();
			ds =(DataSource)ctx.lookup("java:comp/env/jdbc/mysql");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}
	
	//
	void connect() {
		
		
		try {
			con = ds.getConnection();
			
		
	}catch (Exception e) {
		// TODO: handle exception
		e.printStackTrace();
		
	}
	}
		//
		
		void disConnect() {
			if(pstmt !=null) {
				
				
				try {
					pstmt.close();
					
				}catch (SQLException e) {
					// TODO: handle exception
					e.printStackTrace();
					
				}
			}
			if(con != null) {
				
				try {
					con.close();
				}catch (SQLException e) {
					// TODO: handle exception
					e.printStackTrace();
				}
			}
				
 		}//디스코넥트
		
		
	//전체 행의 리스트를 반환 
	public ArrayList<CompanyEntity> getCompanyList()
	{
		
		connect();
		
		
		ArrayList<CompanyEntity> list = new ArrayList<CompanyEntity>();
		
		String sql ="select * from 회사";
	
		
		try {
					pstmt = con.prepareStatement(sql);
					
					ResultSet rs=pstmt.executeQuery(); 
					
		
//		if(rs.next()== false) { //행이 존재 하지 않는다면 
//
//			sqlin = "insert into 회사 " + 
//					"values('카카오','서울','가가','어플',2000,500,100)," + 
//					"('네이버','서울','나나','웹',3000,1000,200)," + 
//					"('구글','미국','다다','웹',7000,5000,400)," + 
//					"('네이트','경기도','라라','웹',2000,3000,200)," + 
//					"('애플','미국','마마','모바일',7000,5000,400)," + 
//					"('어도비','미국','바바','SW',6000,3000,100);";
//			
//			
//			pstmt = con.prepareStatement(sqlin);
//		
//			rs = pstmt.executeQuery();
//			
			
//			
//			pstmt = con.prepareStatement(sql);
//			
//			rs =pstmt.executeQuery(); //재생성
//			
//			rs.beforeFirst(); //다시 BOF 로 커서 위치  
	 //}
			
		
		
			while(rs.next()) {
				
				CompanyEntity ce = new CompanyEntity();
				
				
				ce.setCom(rs.getString("회사명"));
				ce.setPerson(rs.getString("대표자"));
				ce.setLocation(rs.getString("회사_소재지"));
				ce.setCategory(rs.getString("사업분야"));
				ce.setMoney(rs.getInt("매출액"));
				ce.setScale(rs.getInt("채용규모"));
				ce.setEmployee(rs.getInt("직원수"));
				
				list.add(ce); //리스트에 추가 
			}
			
			rs.close();
			
			
			
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			disConnect();
		}
		
		
	return list;
		
	}
		
	
}
	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	