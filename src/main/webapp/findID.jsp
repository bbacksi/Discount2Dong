<%@page import="com.DAO.memberDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="assets/css/findID.css"/>

</head>
<body>

	<%
		String member_id = (String)session.getAttribute("member_id");
		String name = (String)session.getAttribute("name");
	 %>
<form>
	<div id = "idpage">
        <header>
            <h2>���̵� ã��</h2>
        <div id = "check">
            <br>
            <br>
            <br>
            <br>
            
            <span class="fontsize">
                <p><%=name%> ���� ���̵��</p>
                <p>"<%=member_id %>"�Դϴ�.</p>
            </span>
            <br>
            <br>
            <br>
            <br>
            <br>
            
            
            <!-- ��ư ������ �����ؾ��� -->
            <span>
                <button><a href="main.jsp">Ȩȭ���̵�</a></button>
            </span>
            <span>
                <button><a href = "login.jsp">�α���</a></button>
            </span>
        </div>
    </div>
</form>
<%
System.out.println(name);
System.out.println(member_id);
%>
</body>
</html>