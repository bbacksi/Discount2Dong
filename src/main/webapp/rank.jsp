<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="assets/css/rank.css">
</head>
<body>

	<!-- ��� �޴� -->
	<nav class="navbar">       
        <div class="navbar__logo">
            �ΰ� �ڸ�
        </div>

        <div class="navbar__main">
            ����2��  ����
        </div>

        <div class="navbar__profile">
            �����ʻ���           
        </div>
    </nav>


	<!-- ������ ������ ������ �޴� -->
    <ul class="navbar__menu">
        <li><a href="">����������</a></li>
        <li><a href="">���߿��߰�</a></li>        
    </ul>
    
    
    <!-- �� ���� ��ũ -->
    <section align="center" class="town">
    	<div>�� ����</div><br>
    	<div class="second">2�� : ������ ���� / �г��� / ����</div>
    	<div class="first">1�� : ������ ���� / �г��� / ����</div>
    	<div class="third">3�� : ������ ���� / �г��� / ����</div><br>
    </section><br>
    
    
    <!-- �� ������ ��ũ -->
    <section align="center" class="district">
    	<div>�� ������</div><br>
    	<div class="second">2�� : ������ ���� / �г��� / ������ / ����</div>
    	<div class="first">1�� : ������ ���� / �г��� / ������ / ����</div>
    	<div class="third">3�� : ������ ���� / �г��� / ������ / ����</div><br>
    </section><br>
    
    
    <!-- ���� ��ü ��ũ -->
    <section align="center" class="city">
    	<div>�� ����</div><br>
    	<div class="second">2�� : ������ ���� / �г��� / ������ / ����</div>
    	<div class="first">1�� : ������ ���� / �г��� / ������ / ����</div>
    	<div class="third">3�� : ������ ���� / �г��� / ������ / ����</div><br>
    </section><br>
    
    
    <script src="js/jquery-3.6.0.min.js"></script>
    <script>
    
    	/* ������ �޴� Ŭ�� */
        const click__profile = document.querySelector('.navbar__profile');
        const click__profile2 = document.querySelector('.navbar__menu');
        click__profile.addEventListener('click', () => {
            click__profile2.classList.toggle('active');
        });
    </script>
</body>
</html>