<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
   request.setCharacterEncoding("EUC-KR");
   String saveId = request.getParameter("saveId");
%>
<jsp:useBean id="check" class="home.login.LoginCheck"/>
<jsp:setProperty property="*" name="check"/>

<%
   if(check.getId()==null || check.getId().trim().equals("")){
     response.sendRedirect("login.jsp");
     return;
   }
   String msg=null;
   String url="login.jsp";
   int res = check.loginCheck();
   
   if(res == check.OK){
	   session.setAttribute("id",check.getId());
	   /* ���� ����.
	   �α��� ���� �� top �������� �Ѿ�� ������ ���� �α��� �Ǿ��ִٴ� ���¸� �����ϱ� ���ؼ���.
	   �̷� ����, login �� index �������� �Ѿ�� �� top���� �α����� �ƴ� �α׾ƿ��̶�� ������ �̸���
	   ������� �� �� ����.
	   */
	   Cookie loginCookie = new Cookie("saveId", check.getId());
	   if(saveId != null){ //html ���� üũ�ڽ� üũ �ȵ� ���·� �Ѿ�� null��. �ݴ�� on
		   loginCookie.setMaxAge(60*60*24); // �ʴ��� �̹Ƿ� �̰� �Ϸ縦 �ǹ���.
	   }else{
		   loginCookie.setMaxAge(0);
	   }
	   response.addCookie(loginCookie);
	   /*
	   ��Ű�� ����ؼ� ���̵� ����ϱ� ��� ����
	   */
	   msg = check.getId()+"�� �α��� �Ǿ����ϴ�.";
	   url = request.getContextPath() + "/index.jsp";
   }else if(res == check.NOT_ID){
	   msg = "�������� �ʴ� ���̵� �Դϴ�. Ȯ�� �� �ٽ� �α��� �� �ּ���";
   }else if(res == check.NOT_PWD){
	   msg = "��й�ȣ�� ��ġ���� �ʽ��ϴ�. Ȯ�� �� �ٽ� �α��� �� �ּ���";
   }else if(res == check.ERROR){
	   msg = "�������� �߻�. �����ڿ��� �����ϼ���";
   }
%>
<script type="text/javascript">
  alert("<%=msg%>")
  location.href="<%=url%>"

</script>