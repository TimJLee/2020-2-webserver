<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
//���� �����
   String id=request.getParameter("id");
   String pwd=request.getParameter("pwd");
   
   //���̵� admin �����ϰ� ��й�ȣ�� 1234�϶��� �α����� �Ǿ��ٰ� ����
   if(id.equals("admin") && pwd.equals("1234")){
   session.setAttribute("id","admin");%>
     <script type="text/javascript">
       alert("�α��� �Ǽ̽��ϴ�.")
       location.href="resultTest2.jsp"
     </script>
    
<% }%>