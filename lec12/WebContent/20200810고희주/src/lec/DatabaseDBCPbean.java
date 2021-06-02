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
	
	//������
	
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
				
 		}//���ڳ�Ʈ
		
		
	//��ü ���� ����Ʈ�� ��ȯ 
	public ArrayList<CompanyEntity> getCompanyList()
	{
		
		connect();
		
		
		ArrayList<CompanyEntity> list = new ArrayList<CompanyEntity>();
		
		String sql ="select * from ȸ��";
	
		
		try {
					pstmt = con.prepareStatement(sql);
					
					ResultSet rs=pstmt.executeQuery(); 
					
		
//		if(rs.next()== false) { //���� ���� ���� �ʴ´ٸ� 
//
//			sqlin = "insert into ȸ�� " + 
//					"values('īī��','����','����','����',2000,500,100)," + 
//					"('���̹�','����','����','��',3000,1000,200)," + 
//					"('����','�̱�','�ٴ�','��',7000,5000,400)," + 
//					"('����Ʈ','��⵵','���','��',2000,3000,200)," + 
//					"('����','�̱�','����','�����',7000,5000,400)," + 
//					"('���','�̱�','�ٹ�','SW',6000,3000,100);";
//			
//			
//			pstmt = con.prepareStatement(sqlin);
//		
//			rs = pstmt.executeQuery();
//			
			
//			
//			pstmt = con.prepareStatement(sql);
//			
//			rs =pstmt.executeQuery(); //�����
//			
//			rs.beforeFirst(); //�ٽ� BOF �� Ŀ�� ��ġ  
	 //}
			
		
		
			while(rs.next()) {
				
				CompanyEntity ce = new CompanyEntity();
				
				
				ce.setCom(rs.getString("ȸ���"));
				ce.setPerson(rs.getString("��ǥ��"));
				ce.setLocation(rs.getString("ȸ��_������"));
				ce.setCategory(rs.getString("����о�"));
				ce.setMoney(rs.getInt("�����"));
				ce.setScale(rs.getInt("ä��Ը�"));
				ce.setEmployee(rs.getInt("������"));
				
				list.add(ce); //����Ʈ�� �߰� 
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
	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	