<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="home.book.*"%>
    <jsp:useBean id="bdao" class="home.book.BookDAO" />
<% request.setCharacterEncoding("EUC-KR"); //post��Ŀ����� �ѱ�ó��
 	String name=request.getParameter("name");
 	if(name==null || name.trim().equals("")){
		response.sendRedirect("delete.jsp");
 		return;
 	} %>
 	<%
 	int res=bdao.deleteBook(name);
 	if(res>0){%>
 	<script type="text/javascript">
 		alert("������������! ���������������� �̵��մϴ�.");
 		location.href="list.jsp";
 	</script>
 <%	}else{ %>
 	<script type="text/javascript">
 		alert("������������! ���������������� �̵��մϴ�.");
 		location.href="delete.jsp";
 	</script>
 <%	}  %>
 		