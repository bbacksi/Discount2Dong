<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="assets/css/findPW.css"/>

</head>
<body>
	<%
		String member_pw = (String)session.getAttribute("member_pw");
		String id = (String)session.getAttribute("id");
	 %>
<form>
	<div id = "pwpage">
        <header>
            <h2>��й�ȣ ã��</h2>
        <div id = "check">
            <br>
            <br>
            <br>
            <br>
            
            <span class="fontsize">
                <p><%=id %>���� ��й�ȣ��.</p>
                <p>"<%=member_pw%>"�Դϴ�.</p>
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
System.out.println(id);
System.out.println(member_pw);

%>
</body>
</html>