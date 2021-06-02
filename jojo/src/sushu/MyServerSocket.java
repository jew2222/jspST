package sushu;
import java.io.*;
import java.net.*;

public class MyServerSocket
{
  public static void main(String[] args)
  {
    try{
      ServerSocket myServerSocket= new ServerSocket(8080); //��Ʈ �� ���°�
      System.out.println("Ŭ���̾�Ʈ�� �����ϱ� ��ٸ��� �ֽ��ϴ�.");
      //���ε� �ͼ����� ������ ����ǰ� �ִ� ���� (8080)�� �̹� ���ְ� Ŭ��� �ƴ϶� �׷� , �ܼ� â ���� ��ư ���� �� �ٽ� �ϰų� 

      Socket mySocket= myServerSocket.accept(); // Ŭ���̾�Ʈ ���Ӷ����� ��� / ���Ʈ �ɶ� ����
      
      System.out.println("Ŭ���̾�Ʈ�� �����߽��ϴ�.");

      // Ŭ���̾�Ʈ ���Ͽ� ��Ʈ���� ����
      BufferedReader in= new BufferedReader(new InputStreamReader(mySocket.getInputStream()));
      PrintWriter out= new PrintWriter(new OutputStreamWriter(mySocket.getOutputStream()));

      // Ŭ���̾�Ʈ �������κ��� ���� �޽����� ȭ�鿡 ���
      System.out.println("Ŭ���̾�Ʈ�κ��� ���� �޽���: "+ in.readLine()); //Ŭ�� ���� ������ ���� / �Ѵ� ������ �ȵ� ��������

      // Ŭ���̾�Ʈ ���Ͽ� �޽��� ����
      String msg="������ �����Ͻ� ���� ȯ���մϴ�!!!";
      out.println(msg);
      out.flush();
      System.out.println("Ŭ���̾�Ʈ���� ���� �޽���: "+ msg);

      mySocket.close();
    }catch(MalformedURLException e){
      System.out.println(e.toString());
    }catch(IOException e){
      System.out.println(e.toString());
    }
  }
}