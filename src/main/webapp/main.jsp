<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.DAO.memberDAO"%>
<%@page import="com.VO.SnsVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.VO.MemberVO"%>
<%@page import="com.DAO.snsDAO"%>
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
<div id = "wrapper">
	<div id = "content">

	   <%   
	 
	   request.setCharacterEncoding("euc-kr");
	   //�α��� �ѻ���� ����
	   MemberVO vo = (MemberVO) session.getAttribute("vo");
	   
	   //�˻��� �޾ƿ���
	   String want = request.getParameter("want");
	   snsDAO dao = new snsDAO();
	   
	   memberDAO m_dao = new memberDAO();
	   ArrayList<SnsVO> vo2 = dao.search(want);
	   ArrayList<SnsVO> vo3 = dao.select_random_sns();
	   %>
   <!-- ��� �޴� -->

   <nav class='navbar'>
      <div class='navbar__logo' color="#F7323F">�ΰ� �ڸ�</div>

      <div class='navbar__main' onclick="location.href='main.jsp'"\>����2��</div>
      <%
      if (vo == null) {
         out.print("<div class='' onclick='location.href=\"login.jsp\"'>�α���</div></nav>");

      } else {
    	  if(vo.getMember_type().equals("0")){
         out.print("<div class='navbar__profile'>������</div></nav>");
         out.print("<ul class='navbar__menu'>");
         out.print("<li><a href='mypage.jsp'>����������</a></li>");
         out.print("<li><a href='myzzim.jsp'>��������</a></li>");
         out.print("<li><a href='sellerjoin.html'>�Ǹ��ڵ��</a></li>");
         out.print("<li><a href='LogoutCon.java'>�α׾ƿ�</a></li>");
         out.print("</ul>");
    	  }else{
    		  out.print("<div class='navbar__profile'>������</div></nav>");
    	      out.print("<ul class='navbar__menu'>");
    	      out.print("<li><a href='mypage.jsp'>����������</a></li>");
    	      out.print("<li><a href='myzzim.jsp'>��������</a></li>");
    	      out.print("<li><a href='page.jsp'>��ǰ�Ǹ�</a></li>");
    	      out.print("<li><a href='LogoutCon.java'>�α׾ƿ�</a></li>");
    	      out.print("</ul>");
    	  }
      }
      %>



      <!-- �˻� -->
      <div id="inner">
         <form action="" class="searchBar" method="post">
            <input type="text" name="want" placeholder="�˻�(��ǰ��, ������)">
            <input type="submit" value="�˻�">
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
               <%
               if (vo2.size()==0) {
                  for (int i = 0; i < vo3.size(); i++) {
                      %>
            <div class="simpleLook" onclick="location.href='sns.jsp?sns_seq=<%=vo3.get(i).getArticle_seq()%>&sns_memeber_id=<%=vo3.get(i).getMember_id() %>'">
               <div class="img">
                  <%if(vo3.get(i).getPic1() !=null){ %>
	                    <img src= "./uploadedFiles\\<%=vo3.get(i).getPic1() %>" class="profile" >
				        <%} else{%>
				        <div>��ǰ��������</div>
				        <%} %>
               </div>
               <div class="hoho">
                  <div class="notimg">��ǰ�� : <%
                  out.print(vo3.get(i).getSubject());
                  %>
                  </div>
                  <br>
                  <div class="notimg">���� �ǸŰ� : <%
                  out.print(vo3.get(i).getSale_price());
                  %>
                  </div>
                  <br>
                  <div class="notimg">��ȣ�� : <%
                  out.print(m_dao.find_company_name((vo3.get(i).getMember_id())));
                  %></div>
                  <br>
               </div> 
            </div>
               <%    }
                    }else {%>
               <%for (int i = 0; i < vo2.size(); i++) {
                     %>
            <div class="simpleLook" onclick="location.href='sns.jsp?sns_seq=<%=vo2.get(i).getArticle_seq()%>&sns_memeber_id=<%=vo2.get(i).getMember_id() %>'">
               <div class="img">
                 <%if(vo2.get(i).getPic1() !=null){ %>
	                    <img src= "./uploadedFiles\\<%=vo2.get(i).getPic1() %>" class="profile" >
				        <%} else{%>
				        <div>��ǰ��������</div>
				        <%} %>
               </div>
               <div class="hoho">
                  <div class="notimg">��ǰ�� : <%
                  out.print(vo2.get(i).getSubject());
                  %>
                  </div>
                  <br>
                  <div class="notimg">���� �ǸŰ� : <%
                  out.print(vo2.get(i).getRegular_price());
                  %>
                  </div>
                  <br>
                  <div class="notimg">��ȣ�� : <%
                  out.print(m_dao.find_company_name((vo2.get(i).getMember_id())));
                  %></div>
                  <br>
               </div> 
            </div>
               <% }
               }%>


            <!-- �ڼ��� ������  -->
            <%
            if (vo2.size()==0) {
            for (int i = 0; i < vo3.size(); i++) {
                      %>
            <div class="closerLook" onclick="location.href='sns.jsp?sns_seq=<%=vo3.get(i).getArticle_seq()%>&sns_memeber_id=<%=vo3.get(i).getMember_id() %>'"
               style="display: none;">
               <div class="img2">
                  <%if(vo3.get(i).getPic1() !=null){ %>
	                    <img src= "./uploadedFiles\\<%=vo3.get(i).getPic1() %>" class="profile" >
				        <%} else{%>
				        <div>��ǰ��������</div>
				        <%} %>
               </div>
               <div class="hoho2">

                  <div class="notimg">��ǰ�� : <%
                  out.print(vo3.get(i).getSubject());
                  %>
                  </div>
                  <br>
                  <div class="notimg">��ȣ�� : <%
                  out.print(m_dao.find_company_name((vo3.get(i).getMember_id())));
                  %>
                  </div>
                  <br>
                  <div class="notimg">�Խ��� :  <%
                  out.print(vo3.get(i).getMember_id());
                  %></div>
                  <br>
                  <div class="notimg">�Խñ� : <%
                  out.print(vo3.get(i).getContent());
                  %>
                  </div>
                  <br>
                  <div class="notimg">���� : <%
                  out.print(vo3.get(i).getRegular_price());
                  %>
                  </div>
                  <br>
                  <div class="notimg">���ΰ� : <%
                  out.print(vo3.get(i).getDiscount_price());
                  %>
                  </div>
                  <br>
                  <div class="notimg">�ǸŰ� : <%
                  out.print(vo3.get(i).getSale_price());
                  %>
                  </div>
                  <br>
               </div>
            </div>
            <% }
            }else {%>
            <%for (int i = 0; i < vo2.size(); i++) {
                     %>
            <div class="closerLook" onclick="location.href='sns.jsp?sns_seq=<%=vo2.get(i).getArticle_seq()%>&sns_memeber_id=<%=vo2.get(i).getMember_id() %>'"
               style="display: none;">
               <div class="img2">
                  <%if(vo2.get(i).getPic1() !=null){ %>
	                    <img src= "./uploadedFiles\\<%=vo2.get(i).getPic1() %>" class="profile" >
				        <%} else{%>
				        <div>��ǰ��������</div>
				        <%} %>
               </div>
               <div class="hoho2">
                  <div class="notimg">��ǰ�� : <%
                  out.print(vo2.get(i).getSubject());
                  %>
                  </div>
                  <br>
                  <div class="notimg">��ȣ�� : <%
                  out.print(m_dao.find_company_name((vo2.get(i).getMember_id())));
                  %>
                  </div>
                  <br>
                  <div class="notimg">�Խ��� :  <%
                  out.print(vo2.get(i).getMember_id());
                  %></div>
                  <br>
                  <div class="notimg">�Խñ� : <%
                  out.print(vo2.get(i).getContent());
                  %>
                  </div>
                  <br>
                  <div class="notimg">���� : <%
                  out.print(vo2.get(i).getRegular_price());
                  %>
                  </div>
                  <br>
                  <div class="notimg">���ΰ� : <%
                  out.print(vo2.get(i).getDiscount_price());
                  %>
                  </div>
                  <br>
                  <div class="notimg">�ǸŰ� : <%
                  out.print(vo2.get(i).getSale_price());
                  %>
                  </div>
                  <br>
               </div>
            </div>
            <% }
            }%>

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
<tr height="5"><td width="25"></td></tr>
<tr style="background:url('img/table_mid.gif') repeat-x; text-align:center;">

<td width="80">�۹�ȣ</td>
<td width="313">����</td>
<td width="90">�ۼ���</td>
<td width="164">�ۼ���</td>

</tr>
<tr height="1" bgcolor="#F7323F"><td colspan="6" width="752"></td></tr>
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
      String date = rs.getString(8);
      String ano_pic1 = rs.getString(4);
   
%>

<tr height="25" align="center">

<td><%=ano_seq %></td>

<td align="center" border="solid"><% if(vo !=null){%><a href="dbr.jsp?ano_seq=<%=ano_seq%>"><%=ano_subject %> 
<% if( ano_pic1 != null)  {%>
<i class="fas fa-images"></i> <%} %></td><% }else{%><a href="login.jsp"onclick="alert('�α��� �����ʾ� �α����������� �̵��մϴ�');""><%=ano_subject %> 
<% if( ano_pic1 != null)  {%>
<i class="fas fa-images"></i> <%} %></td><% }%>
<td align="center">�͸�</td>
<td align="center"><%=date %></td>
<!-- <td bgcolor="#F7323F" height="1">&nbsp;</td> -->
</tr>
<tr height="1" bgcolor="#F7323F"><td colspan="6"></td></tr>
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
<tr height="1" bgcolor="#F7323F"><td colspan="6" width="752"></td></tr>
</table>

<table width="100%" cellpadding="0" cellspacing="0" border="0">
<tr align="center">
<td><input type=button value="�۾���" onclick="location.href='dbr_write.jsp'""></td>
</tr>
</table>


         </div>
            <!-- -------------------------------- -->
         </section>
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