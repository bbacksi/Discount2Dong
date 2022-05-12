<%@page import="com.DAO.dbrDAO"%>
<%@page import="com.VO.AnonymousVO"%>
<%@page import="com.VO.AnoCommentVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.DAO.dbr_comDAO"%>
<%@page import="java.sql.SQLException"%>
<%@page import="com.VO.MemberVO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>

<% Class.forName("oracle.jdbc.driver.OracleDriver"); 
	String url = "jdbc:oracle:thin:@project-db-stu.ddns.net:1524:xe"; 
	String id = "cgi_6_2"; 
	String pass = "smhrd2"; 
	// int idx = Integer.parseInt(request.getParameter("ano_seq")); 
	// int idx = Integer.parseInt(session.setAttribute("ano_seq", ano_seq)); 
	int idx = Integer.parseInt(request.getParameter("ano_seq"));
	session.setAttribute("ano_seq", idx);

	
	try { 
		Connection conn = DriverManager.getConnection(url,id,pass); 
		Statement stmt = conn.createStatement(); 
		String sql = "SELECT ano_seq,ano_subject, ano_content,ano_pic1,ano_pic2,ano_pic3,member_id,ano_date FROM anonymous WHERE ano_seq=" + idx; ResultSet rs = stmt.executeQuery(sql);
		if(rs.next()){ 
			String ano_seq = rs.getString(1); 
			String ano_subject = rs.getString(2); 
			String ano_content = rs.getString(3); 
			String ano_pic1 = rs.getString(4); 
			String ano_pic2 = rs.getString(5); 
			String ano_pic3 = rs.getString(6); 
			String ano_date = rs.getString(8); 
			%>

<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">
<head>  
<meta charset="EUC-KR">
<title>Insert title here</title>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Document</title>
<link rel="stylesheet" href="assets/css/dbr.css" />
<script src="http://code.jquery.com/jquery-latest.js"></script>
</head>
<body>

   <%
   MemberVO vo = (MemberVO) session.getAttribute("vo");
   dbr_comDAO dao = new dbr_comDAO();
   ArrayList<AnoCommentVO> anoList = dao.select_all_comdbr((int) session.getAttribute("ano_seq"));
   
   %>


   <div id="wrapper">
      <div id="content">
         <nav class="navbar">
            <div class="navbar__logo">로고 자리</div>

            <div class="navbar__main" onclick="location.href='main.jsp'">할인2동</div>

            <%
            if (vo == null) {
               out.print("<div class='' onclick='location.href=\"login.jsp\"'>로그인</div></nav>");

            } else {
               out.print("<div class='navbar__profile'>프로필</div></nav>");
               out.print("<ul class='navbar__menu'>");
               out.print("<li><a href='mypage.jsp'>마이페이지</a></li>");
               out.print("<li><a href=''>내찜정보</a></li>");
               out.print("<li><a href=''>판매자등록</a></li>");
               out.print("<li><a href='LogoutCon.java'>로그아웃</a></li>");
               out.print("</ul>");
            }
            %>
            <div id = "inner">
               <h1 id="dbr">담벼락</h1>
               
   <table>
   <tr>
   <td>
   
   </td>
   </tr>
     <tr>
      <td>글번호</td>
      <td><%=ano_seq%></td>
     </tr>
	 <tr><td colspan="4"></td></tr>
    <tr>
      <td>이름</td>
      <td >익명</td>
     </tr>
     <tr><td colspan="4"></td></tr>
    <tr>
      <td>작성일</td>
      <td><%=ano_date%></td>
     </tr>
      <tr><td colspan="4"></td></tr>
    <tr>
      <td>제목</td>
      <td><%=ano_subject%></td>
     </tr>
     
     <%String a = (ano_pic1 != null) ? ano_pic1 : ""; %>
          <%String b = (ano_pic2 != null) ? ano_pic2 : ""; %>
          <%String c = (ano_pic3 != null) ? ano_pic3 : ""; %>
     
     <tr height="1" bgcolor="#dddddd"><td colspan="4" width="307"></td></tr>
     <tr>
      <td align="center" width="76">내용</td>
      <td >
      
	        <img class = "img123" src= "./uploadedFiles\\<%=a %>" class="profile" >
                    
            <img class = "img123" src= "./uploadedFiles\\<%=b %>" class="profile" >
            <img class = "img123" src= "./uploadedFiles\\<%=c %>" class="profile" >
            <div>       
      <%=ano_content%></div>
      </td>
      
      </table>
      <table>
      
      
									<%
									if (anoList.size() == 0) {
										System.out.print("값이 없습니다");
									} else {
										for (int i = 0; i < anoList.size() ; i++) {
									%>
									<tr>
										<td style="width: 30%">익명</td>
										<td style="width: 30%"><%=anoList.get(i).getAnocom_content()%></td>
										<td style="width: 30%"><%=anoList.get(i).getDate()%></td>
									</tr>
									<%
									}
									}
									%>
      </table>
     <table>
     
     	
							
     </tr>
     	
     <tr height="1" bgcolor="#F7323F"><td colspan="4" width="407"><form action="dbr_Comment">
								<a>댓글 입력 : </a><input type="text" name="ano_content2">
								<input type="submit" value="등록">
								
						
								
								</form></td></tr>
     
                
 <% 
  	stmt.executeUpdate(sql);
 	rs.close();
 	stmt.close();
 	conn.close();
	 	} 
	}catch(SQLException e) {
}

%>



     <tr height="1" bgcolor="#82B5DF"><td colspan="4" width="407"></td></tr>
     <tr align="center">
      <td width="0">&nbsp;</td>
      <td colspan="2" width="399"><input type=button value="글쓰기"  OnClick="window.location='dbr_write.jsp'">
	
	
	<%   MemberVO vo = (MemberVO) session.getAttribute("vo");
		dbrDAO dao = new dbrDAO();
		ArrayList<AnonymousVO> vo2 = dao.select_all_dbr(idx);

	
	if (vo.getMember_id().equals(vo2.get(0).getMember_id())) {%>
	<input type=button value="목록" OnClick="window.location='main.jsp'">
	<input type=button value="수정" OnClick="window.location='dbr_edit.jsp?idx=<%=idx%>'">
	<%}else{ %>
	<input type=button value="목록" OnClick="window.location='main.jsp'">
	<% } %>
      <td width="0">&nbsp;</td>
     </tr>
    </table>
   </td>
  </tr>
 </table>
            </div>
      </div>
   </div>
   <script>
      $(".navbar__profile").click(function(){
           if($(".navbar__menu").attr('class')=='navbar__menu'){
              $(".navbar__menu").addClass("active");
           }else{
              $(".navbar__menu").removeClass("active");
           }   
        });
      </script>
</body>
</html>