<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.sql.*"%>
<!-- 
	1. �Ѿ�� �����͸� �޾ƿ���
	2. �Ѿ�� ����Ÿ�� ��ȿ�� �˻�
	3. DB�� �����ϱ�
	4. ������ ����
	5. ���۰���� ���� ��ü���⸦ ������, �ʱ�ȭ������ ������
 -->
 <% request.setCharacterEncoding("EUC-KR"); 
 //post��Ŀ����� �ѱ�ó��. 
 	String name = request.getParameter("name");
 	String publisher = request.getParameter("publisher");
 	String writer = request.getParameter("writer");
 	String price = request.getParameter("price");
 //  �Ķ���ͷ� �Ѿ���� �����ʹ� ��� String �̴�. 
 	if(name==null || name.trim().equals("") || publisher==null ||
 		publisher.trim().equals("") || writer==null || writer.trim().equals("")
 		|| price==null || price.trim().equals("")){%>
 		<script type="text/javascript"> 
 			alert("������ϳ������.�ٽ� �Է��ϼ���.");
 			history.back(); <!-- ����â���� ���ư��� --> 
 		</script>
 <%		return; //�̰� �����, history back �ϸ鼭 �Ʒ��� ��ɾ�� ������ ����.
 	}
 	Class.forName("oracle.jdbc.driver.OracleDriver");
 	String url= "jdbc:oracle:thin:@localhost:1521:xe";
 	String user = "jsp";
 	String pass = "jsp"; 
 	String sql = "insert into book values (?,?,?,?,sysdate)";
 	//joindate �ڸ��� sysdate �Լ��� ������� ���� ��¥�� �Էµǵ��� �Ѵ�.
 	Connection con = DriverManager.getConnection(url,user,pass);
 	PreparedStatement ps = con.prepareStatement(sql); //�������� ���
 	ps.setString(1,name);
 	ps.setString(2,writer);
 	ps.setString(3,publisher);
 	ps.setInt(4,Integer.parseInt(price));
 	int res=ps.executeUpdate();
 	//res���� 1�̻��̸� �Ѱ��̻� insert ����, 0�̸� insert ����
 	if(res>0){%> 
 	<script type="text/javascript">
 		alert("������ϼ���! ���������������� �̵��մϴ�.");
 		location.href="list.jsp";
 	</script>
 <%	}else{ %>
 	<script type="text/javascript">
 		alert("������Ͻ���! ��������������� �̵��մϴ�.");
 		location.href="insert.jsp";
 	</script>
 <%	} 
 	ps.close();
 	con.close();
 %>
 		