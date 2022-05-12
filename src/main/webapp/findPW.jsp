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
            <h2>비밀번호 찾기</h2>
        <div id = "check">
            <br>
            <br>
            <br>
            <br>
            
            <span class="fontsize">
                <p><%=id %>님의 비밀번호는.</p>
                <p>"<%=member_pw%>"입니다.</p>
            </span>
            <br>
            <br>
            <br>
            <br>
            <br>
            
            
            <!-- 버튼 디자인 변경해야함 -->
            <span>
                <button><a href="main.jsp">홈화면이동</a></button>
            </span>
            <span>
                <button><a href = "login.jsp">로그인</a></button>
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