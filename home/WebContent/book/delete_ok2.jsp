<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.sql.*"%>
   
<% request.setCharacterEncoding("EUC-KR"); //post��Ŀ����� �ѱ�ó��
 	String name=request.getParameter("name");
 	if(name==null || name.trim().equals("")){
		response.sendRedirect("delete.jsp");
 		return;
 	} %>
 	<%
 	Class.forName("oracle.jdbc.driver.OracleDriver");
 	String url= "jdbc:oracle:thin:@localhost:1521:xe";
 	String user = "jsp";
 	String pass = "jsp"; 
 	String sql = "delete from book where name=?";
 	//joindate �ڸ��� sysdate �Լ��� ������� ���� ��¥�� �Էµǵ��� �Ѵ�.
 	Connection con = DriverManager.getConnection(url,user,pass);
 	PreparedStatement ps = con.prepareStatement(sql); //�������� ���
 	ps.setString(1,name);
 	int res=ps.executeUpdate();
 	String msg = null;
 	String href = null;
 	if(res>0){
 		msg = "������������!! ���������������� �̵��մϴ�.";
 		href="list.jsp";
 	}else{
 		msg="������������!! ���������������� �̵��մϴ�.";
 		href="index.jsp";
 	}
 	ps.close();
 	con.close();
 %>
 <script type="text/javascript">
 	alert("<%=msg%>")
 	location.href="<%=href%>"
 </script>

 		