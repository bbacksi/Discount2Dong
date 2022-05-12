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
	<!-- ��� �޴� -->

	<nav class='navbar'>
		<div class='navbar__logo'>�ΰ� �ڸ�</div>

		<div class='navbar__main' onclick="location.href='main.jsp'">����2��</div>
		<%
		if (vo == null) {
			out.print("<div class='' onclick='location.href=\"login.jsp\"'>�α���</div></nav>");

		} else {
			out.print("<div class='navbar__profile'>������</div></nav>");
			out.print("<ul class='navbar__menu'>");
			out.print("<li><a href='mypage.jsp'>����������</a></li>");
			out.print("<li><a href=''>����ǥ</a></li>");
			out.print("<li><a href=''>������</a></li>");
			out.print("<li><a href=''>�Ǹ��ڵ��</a></li>");
			out.print("<li><a href='LogoutCon.java'>�α׾ƿ�</a></li>");
			out.print("</ul>");
		}
		%>




		<!-- �˻� -->
		<div id="search.jsp">
			<form action="search" class="searchBar" method="post">
				<input type="text" name="want" placeholder="�˻�(��ǰ��, ������)">
				<input type="button" value="�˻�" onClick="location.href='search.jsp'">
			</form>
			<br>


			<!-- ��ư 3�� -->
			<div align="center">
				<span class="simpleLookBtn" style="display: inline"><button>������</button></span>
				<button class="closerLookBtn" style="display: inline">�ڼ���</button>
				<span class="secretLookBtn" style="display: inline"><button>�㺭��</button></span>
			</div>
			<br>


			<!-- ������ ������  -->
			<section>
				<div class="simpleLook" onclick="location.href='sns.jsp'">
					<div class="img">
						<img src="assets/img/seller.png" alt="��ǰ�̹���">
					</div>
					<div class="hoho">
						<div class="notimg">��ǰ��</div>
						<br>
						<div class="notimg">���� �ǸŰ�</div>
						<br>
						<div class="notimg">��ȣ�� :</div>
						<br>
					</div>
				</div>


				<!-- �ڼ��� ������  -->

				<div class="closerLook" onclick="location.href='sns.jsp'"
					style="display: none;">
					<div class="img2">
						<img src="assets/img/seller.png" alt="��ǰ�̹���">
					</div>
					<div class="hoho2">
						<div class="notimg">����</div>
						<br>
						<div class="notimg">��ȣ��</div>
						<br>
						<div class="notimg">�Խ���</div>
						<br>
						<div class="notimg">�Խñ�</div>
						<br>
						<div class="notimg">����</div>
						<br>
						<div class="notimg">���ΰ�</div>
						<br>
						<div class="notimg">�ǸŰ�</div>
						<br>
					</div>
				</div>


				<!-- �㺭�� -->
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
		out.print("�� �Խù� : " + total + "��");
		
		String sqlList = "SELECT ano_seq, ano_subject, ano_content, ano_pic1, ano_pic2,ano_pic3,member_id,ano_date from anonymous order by ano_seq DESC";
		// board ���̺� �ִ� Num, UserName, title, time, 
		//hit�� ���� �������� Num�� �������� ������������

				rs = stmt.executeQuery(sqlList);
		
%>
<table width="100%" cellpadding="0" cellspacing="0" border="0">
  <tr height="5"><td width="5"></td></tr>
 <tr style="background:url('img/table_mid.gif') repeat-x; text-align:center;">
   <td width="5"><img src="img/table_left.gif" width="5" height="30" /></td>
   <td width="73">��ȣ</td>
   <td width="379">����</td>
   <td width="73">�ۼ���</td>
   <td width="164">�ۼ���</td>
   <td width="58">��ȸ��</td>
   <td width="7"><img src="img/table_right.gif" width="5" height="30" /></td>
  </tr>
<%
	if(total==0) {
%>
	 		<tr align="center" bgcolor="#FFFFFF" height="30">
	 	   <td colspan="6">��ϵ� ���� �����ϴ�.</td>
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
	<td align="center">�͸�</td>
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
   <td><input type=button value="�۾���" onclick="move('dbr_write')"></td>
  </tr>
</table>


				</div>
				<!-- -------------------------------- -->
			</section>
		</div>

		<!-- <script src="js/jquery-3.6.0.min.js"></script> -->
		<script>
			/* ������ �޴� Ŭ�� */
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