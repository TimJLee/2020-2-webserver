<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean id="obj" class="home.count.count" scope="request" />
<h1>Result1.jsp������ �Դϴ�</h1>
<b>request : obj�� getCount() = </b>
<jsp:getProperty property="count" name="obj" />
<br>
<h2> �ٽ� ���ƿ� ��</h2>
<jsp:setProperty property="count" name="obj" value="100"/>