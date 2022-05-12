<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.VO.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="assets/css/main.css">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta2/css/all.min.css"
	integrity="sha512-YWzhKL2whUzgiheMoBFwW8CKV4qpHQAEuvilg9FAn5VJUDwKZZxkJNuGM4XkWuk94WCrrwslk8yWNGmY1EduTA=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>
	<%
	MemberVO vo = (MemberVO) session.getAttribute("vo");
	%>
	<!-- 상단 메뉴 -->

	<nav class='navbar'>
		<div class='navbar__logo'>로고 자리</div>

		<div class='navbar__main' onclick="location.href='main.jsp'">할인2동</div>
		<%
		if (vo == null) {
			out.print("<div class='' onclick='location.href=\"login.jsp\"'>로그인</div></nav>");

		} else {
			out.print("<div class='navbar__profile'>프로필</div></nav>");
			out.print("<ul class='navbar__menu'>");
			out.print("<li><a href='mypage.jsp'>마이페이지</a></li>");
			out.print("<li><a href=''>순위표</a></li>");
			out.print("<li><a href=''>내찜목록</a></li>");
			out.print("<li><a href=''>판매자등록</a></li>");
			out.print("<li><a href='LogoutCon.java'>로그아웃</a></li>");
			out.print("</ul>");
		}
		%>




		<!-- 검색 -->
		<div id="search.jsp">
			<form action="search" class="searchBar" method="post">
				<input type="text" name="want" placeholder="검색(상품명, 행정동)">
				<input type="button" value="검색" onClick="location.href='search.jsp'">
			</form>
			<br>


			<!-- 버튼 3개 -->
			<div align="center">
				<span class="simpleLookBtn" style="display: inline"><button>간략히</button></span>
				<button class="closerLookBtn" style="display: inline">자세히</button>
				<span class="secretLookBtn" style="display: inline"><button>담벼락</button></span>
			</div>
			<br>


			<!-- 간단히 볼래요  -->
			<section>
				<div class="simpleLook" onclick="location.href='sns.jsp'">
					<div class="img">
						<img src="assets/img/seller.png" alt="상품이미지">
					</div>
					<div class="hoho">
						<div class="notimg">상품명</div>
						<br>
						<div class="notimg">현재 판매가</div>
						<br>
						<div class="notimg">상호명 :</div>
						<br>
					</div>
				</div>


				<!-- 자세히 볼래요  -->

				<div class="closerLook" onclick="location.href='sns.jsp'"
					style="display: none;">
					<div class="img2">
						<img src="assets/img/seller.png" alt="상품이미지">
					</div>
					<div class="hoho2">
						<div class="notimg">제목</div>
						<br>
						<div class="notimg">상호명</div>
						<br>
						<div class="notimg">게시자</div>
						<br>
						<div class="notimg">게시글</div>
						<br>
						<div class="notimg">정가</div>
						<br>
						<div class="notimg">할인가</div>
						<br>
						<div class="notimg">판매가</div>
						<br>
					</div>
				</div>


				<!-- 담벼락 -->
				<div class="secretLook"
					style="display: none;">
					
 <%
	Class.forName("oracle.jdbc.driver.OracleDriver");
	String url = "jdbc:oracle:thin:@project-db-stu.ddns.net:1524:xe";
	String id = "cgi_6_2";
	String pass = "smhrd2";
	int total = 0;
	Connection conn = null;
	try {
		conn = DriverManager.getConnection(url,id,pass);
		Statement stmt = conn.createStatement();

		String sqlCount = "SELECT COUNT(*) FROM anonymous";
		ResultSet rs = stmt.executeQuery(sqlCount);
		
		if(rs.next()){
			total = rs.getInt(1);
		}
		rs.close();
		out.print("총 게시물 : " + total + "개");
		
		String sqlList = "SELECT ano_seq, ano_subject, ano_content, ano_pic1, ano_pic2,ano_pic3,member_id,ano_date from anonymous order by ano_seq DESC";
		// board 테이블에 있는 Num, UserName, title, time, 
		//hit의 값을 가져오되 Num을 기준으로 내림차순정렬

				rs = stmt.executeQuery(sqlList);
		
%>
<table width="100%" cellpadding="0" cellspacing="0" border="0">
  <tr height="5"><td width="5"></td></tr>
 <tr style="background:url('img/table_mid.gif') repeat-x; text-align:center;">
   <td width="5"><img src="img/table_left.gif" width="5" height="30" /></td>
   <td width="73">번호</td>
   <td width="379">제목</td>
   <td width="73">작성자</td>
   <td width="164">작성일</td>
   <td width="58">조회수</td>
   <td width="7"><img src="img/table_right.gif" width="5" height="30" /></td>
  </tr>
<%
	if(total==0) {
%>
	 		<tr align="center" bgcolor="#FFFFFF" height="30">
	 	   <td colspan="6">등록된 글이 없습니다.</td>
	 	  </tr>
<%
	 	} else {
	 		
		while(rs.next()) {
			int ano_seq = rs.getInt(1);
			String ano_subject = rs.getString(2);
			String ano_content = rs.getString(3);
			String date = rs.getString(8);
			int count = rs.getInt(7);
		
%>
<tr height="25" align="center">
	<td>&nbsp;</td>
	<td><%=ano_seq %></td>
	
	<td align="left"><a href="dbr.jsp?ano_seq=<%=ano_seq%>"><%=ano_subject %></td>
	<td align="center">익명</td>
	<td align="center"><%=date %></td>
	<td>&nbsp;</td>
</tr>
  <tr height="1" bgcolor="#D2D2D2"><td colspan="6"></td></tr>
<% ///////
		}
	} 
	rs.close();
	stmt.close();
	conn.close();
} catch(Exception e) { 
	out.println( e.toString() );
}
%>
 <tr height="1" bgcolor="#82B5DF"><td colspan="6" width="752"></td></tr>
 </table>
 
<table width="100%" cellpadding="0" cellspacing="0" border="0">
  <tr><td colspan="4" height="5"></td></tr>
  <tr align="center">
   <td><input type=button value="글쓰기" onclick="move('dbr_write')"></td>
  </tr>
</table>


				</div>
				<!-- -------------------------------- -->
			</section>
		</div>

		<!-- <script src="js/jquery-3.6.0.min.js"></script> -->
		<script>
			/* 프로필 메뉴 클릭 */
			/*   const click__profile = document.querySelector('.navbar__profile');
			  const click__profile2 = document.querySelector('.navbar__menu');
			  click__profile.addEventListener('click', () => {
			      click__profile2.classList.toggle('active');
			  }); */

			/*  $(".navbar__profile").on("click", function() {
			    $(".navbar__menu").addClass("active");
			    $(this).removeClass("active");
			}); */

			$(".navbar__profile").click(function() {
				if ($(".navbar__menu").attr('class') == 'navbar__menu') {
					$(".navbar__menu").addClass("active");
				} else {
					$(".navbar__menu").removeClass("active");
				}
			});

			$('.simpleLookBtn').click(function() {
				$('.simpleLook').css('display', 'inline-block');
				$('.closerLook').css('display', 'none');
				$('.secretLook').css('display', 'none');
			});

			$('.closerLookBtn').click(function() {

				$('.simpleLook').css('display', 'none');
				$('.closerLook').css('display', 'inline-block');
				$('.secretLook').css('display', 'none');
			});

			$('.secretLookBtn').click(function() {
				$('.simpleLook').css('display', 'none');
				$('.closerLook').css('display', 'none');
				$('.secretLook').css('display', 'inline-block');
			});
		</script>
</body>
</html>