<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.sql.*"%>
 
<% 
	request.setCharacterEncoding("EUC-KR");
	String search=request.getParameter("search");
 	String searchString=request.getParameter("searchString");
 	if(search==null||search.trim().equals("")||
 			searchString==null||searchString.trim().equals("")){
 		response.sendRedirect("find.jsp");
 		return;
 	} %>

<html>
<head>
	<title>����ã��</title>
</head>
<body>
<div align="center">
	<hr color="green" width="300">
	<h2>�� �� [<%=search%>] ã ��</h2>
	<a href="index.jsp">����������</a>
	<hr color="green" width="300">
	<table border="1" width="600">
		<tr bgcolor="yellow">
			<th>å�̸�</th>
			<th>������</th>
			<th>���ǻ�</th>
			<th>�ǸŰ�</th>
			<th>�԰���</th>
		</tr>
<%
	Class.forName("oracle.jdbc.driver.OracleDriver");
	String url= "jdbc:oracle:thin:@localhost:1521:xe";
	String user = "jsp";
	String pass = "jsp"; 
	String sql = "select * from book where "+search+" = ?";
	//���������� ?�� �̿��ؼ� �����͸� ���߿� �ֵ��� ����.
	//�ʵ���� ���߿� �� �� ����. -> search(�ʵ��)�� ���� ���� String�� �������� �־��ش�.
	Connection con = DriverManager.getConnection(url,user,pass);
	PreparedStatement ps = con.prepareStatement(sql);
	ps.setString(1,searchString);
	ResultSet rs = ps.executeQuery();
	while(rs.next()){%>
		<tr>
			<td><%=rs.getString("name")%></td>
			<td><%=rs.getString("writer")%></td>
			<td><%=rs.getString("publisher")%></td>
			<td><%=rs.getInt("price")%></td>
			<td><%=rs.getString("joindate")%></td>
		</tr>
<%	}
	rs.close();
	ps.close();
	con.close();
%>
 	</table>
 </div>
 </body>
 </html>
 		