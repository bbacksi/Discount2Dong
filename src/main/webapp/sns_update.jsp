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
					<h3>�Խù� �����ϱ�</h3>
					<input class="input_field" name = "subject" type="text" placeholder="������ �Է����ּ���.(��ǰ���� �Բ� ������ּ���)"><br> 
        			<input class="input_field" name = "regular_price" type="text" placeholder="���� �Է�" name="REGULAR_PRICE"><br>
        			<input class="input_field" name = "discount_price" type="text" placeholder="���� �Է�" name="DISCOUNT_PRICE"><br>
        			<input class="input_field" name = "sale_price" type="text" placeholder="�ǸŰ� �Է�" name="SALE_PRICE"><br>
					<textarea class="textarea_field" name = "content" placeholder="������ �Է����ּ���."></textarea>
					<br>
					<button class="write_button">����</button>
				</form>
			</div>
		</div>
	</div>
	
</body>
</html>