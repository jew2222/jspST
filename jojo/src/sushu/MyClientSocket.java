package sushu;

import java.io.*;
import java.net.*;

public class MyClientSocket
{
  public static void main(String[] args)
  {
	  
    try{
    
      Socket mySocket= new Socket("192.168.25.6", 8080); // ������ ���� ������/ ��Ʈ
      System.out.println("������ �����߽��ϴ�.");
   

      // ���� ���Ͽ� ��Ʈ���� ����
      BufferedReader in= new BufferedReader(new InputStreamReader(mySocket.getInputStream())); //��Ʈ�� ������ ��� ����
      //��Ʈ�� ������ ĳ���� ������ �ޱ����� 
      //���۸� ���� ���������� �ӵ��� �����༭ ������ �Ȥ����� 
      PrintWriter out= new PrintWriter(new OutputStreamWriter(mySocket.getOutputStream())); //������ ��Ʈ�� ��ü ����

      //��Ʈ������ �ְ� ������ �����
      // Ŭ���̾�Ʈ ���Ͽ� �޽��� ����
      String msg="�ȳ��ϼ���? Ŭ���̾�Ʈ�Դϴ�.";
      
      System.out.println("�������� ���� �޽���: "+ msg);
      out.println(msg);
      out.flush(); //��Ƽ� ������ ����

      // ���� �������κ��� ���� �޽����� ȭ�鿡 ���
      System.out.println("�����κ��� ���� �޽���: "+ in.readLine()); //�ö����� �⤿�ٷ��� ���� ����

      mySocket.close();
    }catch(MalformedURLException e){
      System.out.println(e.toString());
    }catch(IOException e){
      System.out.println(e.toString());
    }
  }
}