//package wipi_book_netserver;
package sushu;

import java.net.*;
import java.io.*;

/**
 * <p>Title: </p>
 * <p>Description: </p>
 * <p>Copyright: Copyright (c) 2003</p>
 * <p>Company: </p>
 * @author unascribed
 * @version 1.0
 */

public class EchoServer extends  Thread {
    static int ClientCnt = 0 ;

    Socket sock = null ;
    DataInputStream dis = null ;
    DataOutputStream dos = null ;
    

    /**
     * 클라이언트 처리 쓰래드 생성자
     * @param socket
     */
    public EchoServer(Socket socket){
        ClientCnt ++ ; //스태틱으로 접속자 늘어남 카운트
		System.out.println("전체  "+ ClientCnt +" 명의 클라이언트가 접속했습니다.");
        try{
            dis = new DataInputStream(socket.getInputStream());
            dos = new DataOutputStream(socket.getOutputStream());
        }catch(Exception  e){}
    }


    /**
     * 클라이언트가 원하는 기능을 수행한다.
     */
    public void run(){

        byte[] readdata = null ;
        try{
            while(true ){                
                int length = dis.read() ;//크기 읽기 
                readdata = new byte[length];
                int readlen = dis.read(readdata); //길이를 잼
                String msg = new String(readdata); //실제 데이터       
				System.out.println(msg);
		
				if(readlen > 0 ) { //메시지 읽은게 있으면
					if(msg.equals("접속자수")) { //알려달란 사용자 명령
						
						
						
				String answer ="접속자 수는"+ ClientCnt +" 명 입니다.";
						//response(answer);
						/* 현재 접속자수 카운트한거 뽑아주기*/
//				try{
//		          
	            dos.write((byte)answer.getBytes().length ); //크기 보내주고
		            dos.write(answer.getBytes());// 실제 데이타
//		        }catch(Exception e){}
						
					}
					else
						response(msg); 
                }
            }
        }catch(Exception e){
        }
    }

    /**
     * Re>를 추가하여 다시 클라이언트에게 보낸다.
     * @param str
     */
    private void response(String str){
        try{
            String returnstr = "RE>"+str ; //받은걸로 메시지 형식으로 생성
            dos.write((byte) returnstr.getBytes().length ); //크기 보내주고
            dos.write(returnstr.getBytes());// 실제 데이타
        }catch(Exception e){}
    }
    
    /*종료 메소드*/

    public void closeAll() {
    	try {
    		sock = null;
    		dis = null;
    		dos = null;
    	}catch(Exception e) {
    	}
    }
    /**
     * 클라이 언트의 접속을 받아 들인다.
     * @param args
     */
    //메인
    public static void main(String[] args) {
        ServerSocket m_serversocket = null ;
        try{
            m_serversocket = new ServerSocket(10000); //서버소켓 캑체
            while(true){
                System.out.println("클라이언트의 접속을 기다리고 있습니다.");
                Socket socket = m_serversocket.accept();
                new EchoServer(socket).start(); //소켓객체로 스레드 실행/ 분기 후 와일문은 계속 돈다
            }
        }catch(Exception e){}
    }
}