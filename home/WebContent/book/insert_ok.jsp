<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.sql.*"%>
<jsp:useBean id="bdao" class="home.book.BookDAO" />
<!-- 
	1. �Ѿ�� �����͸� �޾ƿ���
	2. �Ѿ�� ����Ÿ�� ��ȿ�� �˻�
	3. DB�� �����ϱ�
	4. ������ ����
	5. ���۰���� ���� ��ü���⸦ ������, �ʱ�ȭ������ ������
 -->
 <% request.setCharacterEncoding("EUC-KR"); //post��Ŀ����� �ѱ�ó��  �Ķ���ͷ� �Ѿ���� �����ʹ� ��� String �̴�.%>
 <jsp:useBean id="bdto" class="home.book.BookDTO" />
 <jsp:setProperty property="*" name="bdto"/>
 <%-- <jsp:setProperty property="name" name="bdto"/> --%>
 <!-- bdto.setName(request.getParameter("name")); -->
 <%	if(bdto.getName()==null || bdto.getName().trim().equals("")){%>
 		<script type="text/javascript">
 			alert("������ϳ������.�ٽ� �Է��ϼ���.");
 			history.back();
 		</script>
 <%		return;
 	}
 	int res=bdao.insertBook(bdto);  
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
 <%	} %>
 		