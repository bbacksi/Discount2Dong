<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
#wrapper {
	position: relative;
	height: 100%;
}

#content {
	left: 50%;
	position: absolute;
	transform: translate(-50%);
	text-align: center;
	width: 460px;
	margin: auto;
}

.form_box {
	background-color: #ffffff;
	margin: 10px;
	border-radius: 4px;
	border: 1px solid #ddd;
	padding: 10px;
}

.input_field {
	border: 1px solid #ddd;
	border-radius: 4px;
	padding: 4px;
	margin: 3px 0;
	font-size: 14px;
	width: 100%;
}

.textarea_field {
	border: 1px solid #ddd;
	border-radius: 4px;
	padding: 4px;
	margin: 3px 0;
	font-size: 14px;
	width: 100%;
	height: 160px;
}

.write_button {
	background-color: #475d9f;
	border: 1px solid #323f6b;
	color: #ffffff;
	border-radius: 4px;
	padding: 2px 8px;
	font-soze: 18px;
}
</style>
</head>
<body>
	<div id="wrapper">
		<div id="content">
			<div class="form_box">
				<form action = "Snspage" method = "post" enctype="multipart/form-data">
					<h3>게시물 올리기</h3>
					<input class="input_field" name = "subject" type="text" placeholder="제목을 입력해주세요.(상품명을 함께 명시해주세요)"><br> 
        			<input class="input_field" name = "regular_price" type="text" placeholder="정가 입력" name="REGULAR_PRICE"><br>
        			<input class="input_field" name = "discount_price" type="text" placeholder="할인 입력" name="DISCOUNT_PRICE"><br>
        			<input class="input_field" name = "sale_price" type="text" placeholder="판매가 입력" name="SALE_PRICE"><br>
					<input class="file" type="file" name = "pic1" value="사진"><br>
					<input class="file" type="file" name = "pic2" value="사진"><br>
					<input class="file" type="file" name = "pic3" value="사진"><br>
					<textarea class="textarea_field" name = "content" placeholder="내용을 입력해주세요."></textarea>
					<br>
					<button class="write_button">게시</button>
				</form>
			</div>
		</div>
	</div>
</body>
</html>