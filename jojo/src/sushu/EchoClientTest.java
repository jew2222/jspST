package sushu;

import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.net.Socket;
import java.util.*;

public class EchoClientTest {
	
	//메인
    public static void main(String[] args) {

    	Scanner s = new Scanner(System.in); //입력위함
    	
    	EchoClient echo = new EchoClient();//스레드로 동작할 스레드 상속 클래스
    	
    	echo.start();	// 서버로부터 데이터 읽기,받기 위한 쓰레드 실행 /객체가 분기되어 프로그램이 늘어남/별도 실행 /메인은 그냥 하나
    	
    	try{
            while(true){
                System.out.println("서버로 보낼 메시지를 입력하세요.(종료:exit)");
                String msg = s.next();		// 사용자로부터 보낼 메시지를 입력받음
                
                echo.sendMsg(msg);			// 메시지 전송                
            }
        }catch(Exception e){}
    	//메인은 사용자로부터 메시지 계속 받아 스레드에 전달
    	//애코는 보내는것과 받는것 ..
    }
	
}

class EchoClient extends Thread {
	
	    Socket mySocket = null ;
	    DataInputStream dis = null ;
	    DataOutputStream dos = null ;

	    /**
	     * 클라이언트 처리 쓰래드 생성자
	     * @param socket
	     */
	    //생성이 될떄 만들어짐 (생성자)
	    public EchoClient(){
	        try{
	            mySocket= new Socket("127.0.0.1", 10000); // 서버에 접속
	            System.out.println("서버에 접속했습니다.");
	            
	            dis = new DataInputStream(mySocket.getInputStream());
	            dos = new DataOutputStream(mySocket.getOutputStream());
	            
	        }catch(Exception  e){
	        	System.out.println("서버에 접속할 수 없습니다.");
	        	System.exit(0);
	        }
	    }


	    /**
	     * 서버가 보내는 메시지를 수신하는 기능을 수행한다.
	     */
	    public void run(){ //스레드 도는 메소드 . 메시지 받아 화면에 뿌리는 역할

	        byte[] readdata = null ;
	        try{
	            while(true ){                
	                int length = dis.read() ; //데이타 크기 얻어오기 
	                readdata = new byte[length]; //날라온 메시지 크기만큼의 공간을 만든다 
	                int readlen = dis.read(readdata);
					System.out.println(new String(readdata)); //스트링으로 바꿔줌
					//다ㅛ시 기다림
	            }
	        }catch(Exception e){
	        }
	    }

	    /**
	     * 서버에게 메시지를 보내는 역할.
	     * @param str
	     */
	    public void sendMsg(String msg){
	        try{
	            dos.write((byte)msg.getBytes().length); //롸이트 메소드, 겟바이츠로 바이트 배열로 바꿔 보냄, 렝쓰를 먼저 보냄
	            //바이트 배열로 바꿔 보내는 이유는
	            //자바 객체단위로 보낼수 있는게 장점 , 단 자바 끼리만 ,그게 아니면 가장 낮은 수준의 바이트 단위로 하는게 원래 데이터로 복원 쉬움
 	            dos.write(msg.getBytes()); //그다음 데이터 보냄 
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