package sushu;

import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.net.Socket;
import java.util.*;

public class EchoClientTest {
	
	//����
    public static void main(String[] args) {

    	Scanner s = new Scanner(System.in); //�Է�����
    	
    	EchoClient echo = new EchoClient();//������� ������ ������ ��� Ŭ����
    	
    	echo.start();	// �����κ��� ������ �б�,�ޱ� ���� ������ ���� /��ü�� �б�Ǿ� ���α׷��� �þ/���� ���� /������ �׳� �ϳ�
    	
    	try{
            while(true){
                System.out.println("������ ���� �޽����� �Է��ϼ���.(����:exit)");
                String msg = s.next();		// ����ڷκ��� ���� �޽����� �Է¹���
                
                echo.sendMsg(msg);			// �޽��� ����                
            }
        }catch(Exception e){}
    	//������ ����ڷκ��� �޽��� ��� �޾� �����忡 ����
    	//���ڴ� �����°Ͱ� �޴°� ..
    }
	
}

class EchoClient extends Thread {
	
	    Socket mySocket = null ;
	    DataInputStream dis = null ;
	    DataOutputStream dos = null ;

	    /**
	     * Ŭ���̾�Ʈ ó�� ������ ������
	     * @param socket
	     */
	    //������ �ɋ� ������� (������)
	    public EchoClient(){
	        try{
	            mySocket= new Socket("127.0.0.1", 10000); // ������ ����
	            System.out.println("������ �����߽��ϴ�.");
	            
	            dis = new DataInputStream(mySocket.getInputStream());
	            dos = new DataOutputStream(mySocket.getOutputStream());
	            
	        }catch(Exception  e){
	        	System.out.println("������ ������ �� �����ϴ�.");
	        	System.exit(0);
	        }
	    }


	    /**
	     * ������ ������ �޽����� �����ϴ� ����� �����Ѵ�.
	     */
	    public void run(){ //������ ���� �޼ҵ� . �޽��� �޾� ȭ�鿡 �Ѹ��� ����

	        byte[] readdata = null ;
	        try{
	            while(true ){                
	                int length = dis.read() ; //����Ÿ ũ�� ������ 
	                readdata = new byte[length]; //����� �޽��� ũ�⸸ŭ�� ������ ����� 
	                int readlen = dis.read(readdata);
					System.out.println(new String(readdata)); //��Ʈ������ �ٲ���
					//�٤˽� ��ٸ�
	            }
	        }catch(Exception e){
	        }
	    }

	    /**
	     * �������� �޽����� ������ ����.
	     * @param str
	     */
	    public void sendMsg(String msg){
	        try{
	            dos.write((byte)msg.getBytes().length); //����Ʈ �޼ҵ�, �ٹ������� ����Ʈ �迭�� �ٲ� ����, ������ ���� ����
	            //����Ʈ �迭�� �ٲ� ������ ������
	            //�ڹ� ��ü������ ������ �ִ°� ���� , �� �ڹ� ������ ,�װ� �ƴϸ� ���� ���� ������ ����Ʈ ������ �ϴ°� ���� �����ͷ� ���� ����
 	            dos.write(msg.getBytes()); //�״��� ������ ���� 
	            dos.flush();
	        }catch(Exception e){}
	    }
	    
	    public void closeAll() {
	    	try {
	    		mySocket = null;
	    		dis = null;
	    		dos = null;
	    	}catch(Exception e) {
	    	}
	    }
}