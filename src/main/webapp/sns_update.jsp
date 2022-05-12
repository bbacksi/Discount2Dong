<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="assets/css/sns_update.css">

</head>
<body>

<div id="wrapper">
		<div id="content">
			<div class="form_box">
				<form action = "Snsupdate" method = "post">
					<h3>게시물 수정하기</h3>
					<input class="input_field" name = "subject" type="text" placeholder="제목을 입력해주세요.(상품명을 함께 명시해주세요)"><br> 
        			<input class="input_field" name = "regular_price" type="text" placeholder="정가 입력" name="REGULAR_PRICE"><br>
        			<input class="input_field" name = "discount_price" type="text" placeholder="할인 입력" name="DISCOUNT_PRICE"><br>
        			<input class="input_field" name = "sale_price" type="text" placeholder="판매가 입력" name="SALE_PRICE"><br>
					<textarea class="textarea_field" name = "content" placeholder="내용을 입력해주세요."></textarea>
					<br>
					<button class="write_button">수정</button>
				</form>
			</div>
		</div>
	</div>
	
</body>
</html>