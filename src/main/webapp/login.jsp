<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="assets/css/login.css">
</head>
<body>
 <div class="wrap">
        <div class="login">
        <div>
            <h2><a href = "main.jsp">���� 2��</a></h2>
            </div>
            <div class="login_sns">
            </div>
            <form action="LoginCon" method="post">
	            <div class="login_id">
	                <input type="text" name="ID" id="" placeholder="���̵� �Է��ϼ���.">
	            </div>
	            <div class="login_pw">
	                <input type="password" name="PW" id="" placeholder="��й�ȣ�� �Է��ϼ���.">
	            </div>
	            <div class="submit">
	                <input type="submit" value="�α���">
	            </div>
            </form>
            <!-- <div class="login_etc">
                <div class="checkbox">
                    <input type="checkbox" name="" id=""> �α��� ���� ����
                </div>
            </div> -->
            <div class="login_etc2">
                <a href="find_id_pw.html">�������� ã�� | </a>
                
                <a href="join.html">ȸ������</a>
            </div>
        </div>
    </div>
</body>
</html>