<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
//���� ��������
   String id = (String)session.getAttribute("id");
   if(id==null || id.trim().equals("")){%>
   <script type="text/javascript">
     alert("�α����� ���� �� �ּ���")
     location.href="sessionTest1.jsp"
   
   </script>
	   
<%}%>

<h1> �α��� �Ͻźи� ���� �� �ִ� ������(������)</h1>
<h2>�α��� ���Ѻе� ������</h2>
<h3><a href="resultTest3.jsp">�α׾ƿ�</a></h3>