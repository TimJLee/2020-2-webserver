<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean id="mbdao" class="home.member.MemberDAO" />
<%
	String no = request.getParameter("no");
	if (no==null || no.trim().equals("")){
		response.sendRedirect("memberAll.jsp");
		return;
	}
	
	int res = mbdao.deleteMember(Integer.parseInt(no));
	String msg = null, url = "memberAll.jsp";
	if (res>0){
		msg = "ȸ������ ����!! ȸ������������� �̵��մϴ�.";
	}else {
		msg = "ȸ������ ����!! ȸ������������� �̵��մϴ�.";
	}
%>
<script type="text/javascript">
	alert("<%=msg%>")
	location.href="<%=url%>"
</script>