<%@page import="com.VO.MyChoiceVO"%>
<%@page import="com.DAO.mychoiceDAO"%>
<%@page import="com.VO.CommentVO"%>
<%@page import="com.DAO.commetDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.DAO.snsDAO"%>
<%@page import="com.VO.SnsVO"%>
<%@page import="com.VO.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="assets/css/sns.css">
<script src="http://code.jquery.com/jquery-latest.js"></script>
</head>
<body>
	<%
	MemberVO vo = (MemberVO) session.getAttribute("vo");
	snsDAO dao = new snsDAO();
	commetDAO comment_dao = new commetDAO();
	mychoiceDAO mydao = new mychoiceDAO();
	int idx = Integer.parseInt(request.getParameter("sns_seq"));
	session.setAttribute("sns_seq", idx);
	ArrayList<SnsVO> vo2 = dao.sns_real(idx);

	String id = request.getParameter("sns_memeber_id");
	ArrayList<MemberVO> vo3 = dao.sns_member(id);
	
	ArrayList<CommentVO> vo4 = comment_dao.select_article_comment(idx);
	ArrayList<CommentVO> vo5 = comment_dao.select_market_comment(id);
	MyChoiceVO vo6 = new MyChoiceVO();
	%>
	<div id="wrapper">
		<div id="content">
			<nav class='navbar'>
				<div class='navbar__logo'>로고 자리</div>

				<div class='navbar__main' onclick="location.href='main.jsp'">할인2동</div>
				<%
      if (vo == null) {
         out.print("<div class='' onclick='location.href=\"login.jsp\"'>로그인</div></nav>");

      } else {
    	  if(vo.getMember_type().equals("0")){
         out.print("<div class='navbar__profile'>프로필</div></nav>");
         out.print("<ul class='navbar__menu'>");
         out.print("<li><a href='mypage.jsp'>마이페이지</a></li>");
         out.print("<li><a href='myzzim.jsp'>내찜정보</a></li>");
         out.print("<li><a href='sellerjoin.html'>판매자등록</a></li>");
         out.print("<li><a href='LogoutCon.java'>로그아웃</a></li>");
         out.print("</ul>");
    	  }else{
    		  out.print("<div class='navbar__profile'>프로필</div></nav>");
    	      out.print("<ul class='navbar__menu'>");
    	      out.print("<li><a href='mypage.jsp'>마이페이지</a></li>");
    	      out.print("<li><a href='myzzim.jsp'>내찜정보</a></li>");
    	      out.print("<li><a href='page.jsp'>상품판매</a></li>");
    	      out.print("<li><a href='LogoutCon.java'>로그아웃</a></li>");
    	      out.print("</ul>");
    	  }
      }
      %>


				<div id="inner">
					<div class="snshead">
						<form action="/SnsSevice">
							<div>
								<!--가게 프로필사진 -->
								<table>
									<tr class="storeimg">
										<td class="storeimg">
											<%
											if (vo3.get(0).getCompany_pic1() != null) {
											%> <img
											src="./uploadedFiles\\<%=vo3.get(0).getCompany_pic1()%>"
											class="profile"> <%
											 } else {
											 %>
											<p>업체 사진을 등록해 주세요.</p> <%
										 }
										 %>
										</td>
									</tr>

								</table>
							</div>

							<a href=""><img src="img/face.png" alt="" id="face"></a> <span
								id="name"> <strong id="storename"><%=vo3.get(0).getCompany_name()%></strong>
								<p id="storekind" name="stkind">
									<span><%=vo3.get(0).getB_type()%>
									</span>
								</p>

							</span>
						</form>
						<div class="container">

							<ul class="tabs">
								<li class="tab-link current" data-tab="tab-1">상품게시글</li>
								<li class="tab-link" data-tab="tab-2">가게정보</li>
								<li class="tab-link" data-tab="tab-3">댓글모아보기</li>
								<li><a href="page.jsp"><input type = "button" value = "상품등록"></a></li>
							</ul>



							<!-- 상품 게시글 -->
							<div id="tab-1" class="tab-content current">
								<div class="feed">
									<%-- <h3 class="name"><%=vo.getCompany_name() %></h3>
								<div class="date"><%=vo2.getInput_date() %></div>
								<a class="title"><%=vo2.getSubject() %></a>
								<p class="content">
									
									<%for(int i = 1; i <= 3; i++){ %>
										<%if(vo2.getPic1() == null){
											break;
										}else{ %>
											<img src="uploadedFiles/<%=vo2.getPic1() %>" class="pic" >
										<%} %>
									<%} %>
									</p>  --%>
									<div class="accessory">
										<input type="button" class = "zzim" value="찜♡" onclick="location.href='Zzim'">
										<span>
											찜한사람 : <%= mydao.select_choice_number(vo2.get(0).getArticle_seq()) %>
										</span>
										<%
										if (vo != null) {
										%>
										<%
										if (vo.getMember_id().equals(vo2.get(0).getMember_id())) {
										%>
										
										<form action="Sold">
											<input type="text" name="user_id" placeholder="구매자 계정 등록">
											<input type="submit" value="아이디 입력">
										</form>
										<input type="button" value="판매완료☆" onclick="location.href='SoldOut'">
										<%
										}
										}
										%>

									</div>
								</div>

								<h4>제목 : <%=vo2.get(0).getSubject()%></h4>
								<%
								if (vo != null) {
								if (vo.getMember_id().equals(vo2.get(0).getMember_id())) {
								%>
								<input type=button value="수정" OnClick="window.location='sns_update.jsp'">
								<%}} %>
								
								<%if(vo2.get(0).getPic1() !=null){ %>
	                     			<img src= "./uploadedFiles\\<%=vo2.get(0).getPic1() %>" class="profile" >
	                     			<img src= "./uploadedFiles\\<%=vo2.get(0).getPic2() %>" class="profile" >
	                     			<img src= "./uploadedFiles\\<%=vo2.get(0).getPic3() %>" class="profile" >
                    
				                    <%} else{%>
				                    <P>상품사진없음</P>
				                    <%} %>
								<div id = "innnner">
								<div>
									게시자 :
									<%=vo2.get(0).getMember_id()%>
								</div>
								<div>
									정가 :
									<%=vo2.get(0).getRegular_price()%></div>
								<div>
									판매가 :
									<%=vo2.get(0).getSale_price()%></div>
								<div>
									상호명 :
									<%=vo3.get(0).getCompany_name()%></div>
								<div>
									글내용 :
									<%=vo2.get(0).getContent()%>
								</div>
								</div>
								<br><br>
									<div>댓글</div>
									<table style="width: 100%">
										<tr>
											<td style="width: 20%">작성자</td>
											<td style="width: 45%">내용</td>
											<td style="width: 23%">날짜</td>
										</tr>
									</table>

									<table style="width: 100%">
										<%
										if (vo4.size() == 0) {
											System.out.print("댓글이 없습니다");
										} else {
											for (int i = 0; i < vo4.size(); i++) {
										%>
										<tr>
											<td style="width: 20%"><%=vo4.get(i).getMember_id()%></td>
											<td style="width: 45%"><%=vo4.get(i).getComment_content()%></td>
											<td style="width: 23%"><%=vo4.get(i).getComment_date()%></td>
										</tr>
										<%
										}
										}
										%>
									</table>
								
								<div class="coment">
									<!-- 댓글  -->
									<%
									if (vo == null) {
										out.print("");
									} else {
									%>
									<form action="Comment">
										<a>댓글 입력 : </a><input type="text" name="content"> <input
											type="submit" value="등록"
											onclick="location.href='Comment.java?sns_seq=<%=idx%>'">
									</form>
								</div>
								<%
								}
								%>
	</div>
							</div>

							<!-- 가게정보 -->
							<div id="tab-2" class="tab-content">
								<p>
									<%=vo3.get(0).getCompany_info()%>
								</p>
								<%
										if (vo != null) {
										%>
										<%
										if (vo.getMember_id().equals(vo2.get(0).getMember_id())) {
										%>
								<form action="Info_update">
								<input type="text" name="info">
								<input type="submit" value="수정하기"></input>
								</form> <% }} %>
							</div>

							<!-- 댓글 모아보기 -->
							<div id="tab-3" class="tab-content">
								<table style="width: 100%">
									<%
									if (vo5.size() == 0) {
										out.print("이 계정의 sns 댓글이 없어용");
									} else {
									%>
									<tr>
										<td style="width: 20%">작성자</td>
										<td style="width: 45%">댓글</td>
										<td style="width: 23%">작성 날짜</td>
									</tr>
									<%
									for (int i = 0; i < vo5.size(); i++) {
									%>
									<tr>
										<td style="width: 20%"><%=vo5.get(i).getMember_id()%></td>
										<td style="width: 45%"><%=vo5.get(i).getComment_content()%></td>
										<td style="width: 23%"><%=vo5.get(i).getComment_date()%></td>
									</tr>
									<%
									}
									}
									%>
								</table>
							</div>
						</div>
					</div>
				</div>
		</div>
	</div>

	<script>
		$(".navbar__profile").click(function() {
			if ($(".navbar__menu").attr('class') == 'navbar__menu') {
				$(".navbar__menu").addClass("active");
			} else {
				$(".navbar__menu").removeClass("active");
			}
		});
		
		

		var div2 = document.getElementsByClassName("div2");

		function handleClick(event) {
			console.log(event.target);
			// console.log(this);
			// 콘솔창을 보면 둘다 동일한 값이 나온다

			console.log(event.target.classList);

			if (event.target.classList[1] === "clicked") {
				event.target.classList.remove("clicked");
			} else {
				for (var i = 0; i < div2.length; i++) {
					div2[i].classList.remove("clicked");
				}

				event.target.classList.add("clicked");
			}
		}

		function init() {
			for (var i = 0; i < div2.length; i++) {
				div2[i].addEventListener("click", handleClick);
			}
		}

		init();

		function loadFile(input) {
			var file = input.files[0];

			var name = document.getElementById('fileName');
			name.textContent = file.name;

			var newImage = document.createElement("img");
			newImage.setAttribute("class", 'img');

			newImage.src = URL.createObjectURL(file);

			newImage.style.width = "50%";
			newImage.style.height = "50%";
			newImage.style.visibility = "hidden"; //버튼을 누르기 전까지는 이미지 숨기기
			newImage.style.objectFit = "contain";

			var container = document.getElementById('image-show');
			container.appendChild(newImage);
		};

		$(document).ready(function() {

			$('ul.tabs li').click(function() {
				var tab_id = $(this).attr('data-tab');

				$('ul.tabs li').removeClass('current');
				$('.tab-content').removeClass('current');

				$(this).addClass('current');
				$("#" + tab_id).addClass('current');
			})

		})
	</script>

</body>
</html>