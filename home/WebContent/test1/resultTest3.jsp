<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
   session.invalidate(); //���� ��� �ʱ�ȭ
   //session.removeAttribute("id");
%>
<h2>�α׾ƿ� �Ǿ����ϴ�.</h2>
<script type="text/javascript">
  alert("�α׾ƿ��Ǿ����ϴ�.")
  
  location.href="sessionTest1.jsp"
</script>