package sushu;
import java.io.*;
import java.net.*;

public class MyServerSocket
{
  public static void main(String[] args)
  {
    try{
      ServerSocket myServerSocket= new ServerSocket(8080); //포트 문 여는거
      System.out.println("클라이언트가 접속하길 기다리고 있습니다.");
      //바인딩 익셉션은 서버가 실행되고 있는 상태 (8080)이 이미 떠있고 클로즈가 아니라 그럼 , 콘솔 창 빨건 버튼 종료 후 다시 하거나 

      Socket mySocket= myServerSocket.accept(); // 클라이언트 접속때까지 대기 / 어셉트 될때 까지
      
      System.out.println("클라이언트가 접속했습니다.");

      // 클라이언트 소켓에 스트림을 연결
      BufferedReader in= new BufferedReader(new InputStreamReader(mySocket.getInputStream()));
      PrintWriter out= new PrintWriter(new OutputStreamWriter(mySocket.getOutputStream()));

      // 클라이언트 소켓으로부터 받은 메시지를 화면에 출력
      System.out.println("클라이언트로부터 받은 메시지: "+ in.readLine()); //클라가 먼저 보낸거 받음 / 둘다 받으면 안됨 오고가야함

      // 클라이언트 소켓에 메시지 전송
      String msg="서버에 접속하신 것을 환영합니다!!!";
      out.println(msg);
      out.flush();
      System.out.println("클라이언트에게 보낸 메시지: "+ msg);

      mySocket.close();
    }catch(MalformedURLException e){
      System.out.println(e.toString());
    }catch(IOException e){
      System.out.println(e.toString());
    }
  }
}