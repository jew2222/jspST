package sushu;

import java.io.*;
import java.net.*;

public class MyClientSocket
{
  public static void main(String[] args)
  {
	  
    try{
    
      Socket mySocket= new Socket("192.168.25.6", 8080); // 서버에 접속 아이피/ 포트
      System.out.println("서버에 접속했습니다.");
   

      // 서버 소켓에 스트림을 연결
      BufferedReader in= new BufferedReader(new InputStreamReader(mySocket.getInputStream())); //스트림 들어오는 경로 만듦
      //스트림 리더는 캐릭터 단위로 받기위해 
      //버퍼를 통해 일정순서로 속도로 보여줘서 끊기지 안ㄶ도록 
      PrintWriter out= new PrintWriter(new OutputStreamWriter(mySocket.getOutputStream())); //보내는 스트림 객체 생성

      //스트림으로 주고 받을거 만드는
      // 클라이언트 소켓에 메시지 전송
      String msg="안녕하세요? 클라이언트입니다.";
      
      System.out.println("서버에게 보낸 메시지: "+ msg);
      out.println(msg);
      out.flush(); //모아서 보내기 위해

      // 서버 소켓으로부터 받은 메시지를 화면에 출력
      System.out.println("서버로부터 받은 메시지: "+ in.readLine()); //올때까지 기ㅏ다려서 할줄 읽음

      mySocket.close();
    }catch(MalformedURLException e){
      System.out.println(e.toString());
    }catch(IOException e){
      System.out.println(e.toString());
    }
  }
}