<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.sql.*"%>
<jsp:useBean id="bdao" class="home.book.BookDAO" />

 <% request.setCharacterEncoding("EUC-KR"); //post��Ŀ����� �ѱ�ó��  �Ķ���ͷ� �Ѿ���� �����ʹ� ��� String �̴�.%>
 <jsp:useBean id="bdto" class="home.book.BookDTO" />
 <jsp:setProperty property="*" name="bdto"/>

 <%	if(bdto.getName()==null || bdto.getName().trim().equals("")){%>
 		<script type="text/javascript">
 			alert("������ ���� �̸��� �Է��ϼ���.");
 			history.back();
 		</script>
 <%		return;
 	}
 	int res=bdao.updateBook(bdto);  
 	if(res>0){%>  
 	<script type="text/javascript">
 		alert("������������! ���������������� �̵��մϴ�.");
 		location.href="list.jsp";
 	</script>
 <%	}else{ %>
 	<script type="text/javascript">
 		alert("������������! ���������������� �̵��մϴ�.");
 		location.href="update.jsp";
 	</script>
 <%	} %>
 		