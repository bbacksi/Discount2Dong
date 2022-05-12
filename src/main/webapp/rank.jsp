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

	<!-- 상단 메뉴 -->
	<nav class="navbar">       
        <div class="navbar__logo">
            로고 자리
        </div>

        <div class="navbar__main">
            할인2동  ㅇㅇ
        </div>

        <div class="navbar__profile">
            프로필사진           
        </div>
    </nav>


	<!-- 프로필 누르면 나오는 메뉴 -->
    <ul class="navbar__menu">
        <li><a href="">마이페이지</a></li>
        <li><a href="">나중에추가</a></li>        
    </ul>
    
    
    <!-- 내 동네 랭크 -->
    <section align="center" class="town">
    	<div>내 동네</div><br>
    	<div class="second">2등 : 프로필 사진 / 닉네임 / 점수</div>
    	<div class="first">1등 : 프로필 사진 / 닉네임 / 점수</div>
    	<div class="third">3등 : 프로필 사진 / 닉네임 / 점수</div><br>
    </section><br>
    
    
    <!-- 내 지역구 랭크 -->
    <section align="center" class="district">
    	<div>내 지역구</div><br>
    	<div class="second">2등 : 프로필 사진 / 닉네임 / 행정동 / 점수</div>
    	<div class="first">1등 : 프로필 사진 / 닉네임 / 행정동 / 점수</div>
    	<div class="third">3등 : 프로필 사진 / 닉네임 / 행정동 / 점수</div><br>
    </section><br>
    
    
    <!-- 도시 전체 랭크 -->
    <section align="center" class="city">
    	<div>내 도시</div><br>
    	<div class="second">2등 : 프로필 사진 / 닉네임 / 지역구 / 점수</div>
    	<div class="first">1등 : 프로필 사진 / 닉네임 / 지역구 / 점수</div>
    	<div class="third">3등 : 프로필 사진 / 닉네임 / 지역구 / 점수</div><br>
    </section><br>
    
    
    <script src="js/jquery-3.6.0.min.js"></script>
    <script>
    
    	/* 프로필 메뉴 클릭 */
        const click__profile = document.querySelector('.navbar__profile');
        const click__profile2 = document.querySelector('.navbar__menu');
        click__profile.addEventListener('click', () => {
            click__profile2.classList.toggle('active');
        });
    </script>
</body>
</html>