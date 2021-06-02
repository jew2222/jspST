package sushu;

import java.applet.Applet;
import java.awt.BorderLayout;
import java.awt.Button;
import java.awt.Panel;
import java.awt.TextArea;
import java.awt.TextField;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.net.Socket;
import java.net.UnknownHostException;

//jdk 1.8 버전 설치 필요 
//ms 949로 해죽기
//애플릿 : 작은 유아이 프로그램 
//보이드 인잇이 제일 먼저 실행
//런 부분이 스레드로 동작 부 
//(하나는 받고 , 하나는 보냄)
//보내는건 메인, 받아서 출력은 별도 스레드 

//소켓: 아이피 + 포트
//14000는 **쪽 포트 
//인은 읽어오는것 라인단위로
//메모는 애플릿 에 

public class ChatClient extends Applet
  implements ActionListener, Runnable  //스레드를 위한 러네블 
{
  Socket mySocket= null;
  PrintWriter out= null;
  BufferedReader in= null;

  TextField serverIp;
  Button connect;
  Thread clock;
  TextArea memo;
  TextField name;
  TextField input;
  Panel upPanel, downPanel;
  //유아이를 만즐어줌
  
  public void init()
  {
    // GUI
    setLayout(new BorderLayout());
    
    // 텍스트 에어리어 보더레이아웃의 중앙에 위치
    memo= new TextArea(10, 55);
    add("Center", memo);

    //패널 생성하여 패널에 IP 주소 입력을 위한 텍스트필드와 연결 버튼 추가
    upPanel = new Panel();
    
    serverIp = new TextField(12);
    serverIp.setText("서버 IP 주소 입력");
    upPanel.add(serverIp);
    
    connect = new Button("연결");
    connect.addActionListener(this);
    upPanel.add(connect);
    
    // 생성된 패널을 보더레이아웃의 위쪽에 위치
    add("North", upPanel);
    
    //패널 생성하여 대화명을 위한 텍스트필드와 입력을 위한 텍스트필드 추가
    
    downPanel= new Panel();
    name= new TextField(8);
    name.setText("대화명");
    downPanel.add(name);
    input= new TextField(32);
    input.addActionListener(this);	// 사용자가 엔터키를 누르면 메시지가 전송되도록 이벤트 연결
    downPanel.add(input);
    add("South", downPanel);		// 보더레이아웃의 아래쪽에 패널 위치
  }

  public void run()		// 쓰레드 부분으로 상대방이 보내는 메시지를 받기 위해 while을 돌면서 기다림 
  {
    out.println("LOGIN|"+ mySocket);		// 초기 서버에 접속한 후 접속 메시지를 보냄 //아웃이 서버로 메시지 보내는것 , / 프로토콜 형식으로 보내야 서버가 알아들음 
    memo.append("[접속하였습니다]" +"\n");	// 내 화면의 텍스트에어리어 memo에  접속메시지 출력

    try{
      while(true){							// 반복문
        String msg= in.readLine();			// 상대방이 보낸 메시지를 읽어들임
        if(!msg.equals("") && !msg.equals(null)){
          memo.append(msg +"\n");			// 내 화면의 memo에 받은 메시지 출력
        }
      }
    }catch(IOException e){
      memo.append(e.toString() +"\n");
    }
  }

  //'연결' 버튼이 눌렸을 떄 발생하는 이벤트, 자바제공 메소드
  public void actionPerformed(ActionEvent e)	// connect 버튼이 눌린 경우와 input 텍스트필드에 
  {												// 엔터가 들어왔을 경우 실행

	  if(e.getSource() == connect) {			// connect 버튼이 눌렸을 경우 서버에 연결
		 try{
			 mySocket= new Socket(serverIp.getText(),14001);	// 입력받은 서버 IP 주소와 포트번호 /겟텍스트가 아이피입력한거, 뒤에 포트번호
		     
			 // 생성된 소켓을 이용해 서버와의 입출력 스트림을 생성
		      out= new PrintWriter(new OutputStreamWriter(mySocket.getOutputStream(), "KSC5601"), true); //한글 인코딩 
		      in= new BufferedReader(new InputStreamReader(mySocket.getInputStream(), "KSC5601"), 1024);
		     
		     // 쓰레드를 동작시킴
		     if(clock==null){   //클락이 스레드임 
		         clock= new Thread(this);
		         clock.start();
		     }
		     
		 }catch(UnknownHostException ie){
			 System.out.println(ie.toString());
		 }catch(IOException ie){
			 System.out.println(ie.toString());
		 }
  
	  }
	  
	  //글자 입력시 의 이벤트 
	  else if(e.getSource() == input){	// input 텍스트필드에 엔터가 입력될 경우
		  String data= input.getText();	// input 텍스프필드의 값을 읽어서
		  input.setText("");
		  
		  // 형식에 맞춰 서버에 메시지를 전송
		  out.println("TALK|"+ "[" + name.getText() + "]" + " : "+ data); //헤드로 Talk :[대화명]:
		  out.flush();	// 버퍼에 있는 출력 메시지를 상대방에게 강제로 전송
    }
  }

  public void stop()	// 쓰레드를 종료시키고 종료 메시지를 서버에 전송하고 모든 연결을 닫음
  {
    if((clock!=null)&&(clock.isAlive())){
      clock= null;		// 쓰레드 종료
    }

    // 서버에 종료 메시지 보냄
    out.println("LOGOUT|"+ name.getText());
    out.flush();

    // 모든 스트림과 소켓 연결을 끊음
    try{
      out.close();
      in.close();
      mySocket.close();
    }catch(IOException e){
      memo.append(e.toString() +"\n");
    }
  }
}