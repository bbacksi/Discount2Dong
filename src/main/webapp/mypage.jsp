<%@page import="com.VO.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="assets/css/mypagestyle.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta2/css/all.min.css"
	integrity="sha512-YWzhKL2whUzgiheMoBFwW8CKV4qpHQAEuvilg9FAn5VJUDwKZZxkJNuGM4XkWuk94WCrrwslk8yWNGmY1EduTA=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
  
</head>
<body>
   <%
   MemberVO vo = (MemberVO)session.getAttribute("vo");
   session.setMaxInactiveInterval(60*60*24*365);
   %>
   
   <div class="wrap">
        <div class="mypage">
            <h2 onclick="location.href='main.jsp'">���� 2��</h2>
            <h4>���� ������</h4>
            <div class="imgAndNick">
                <div class="profilediv">
                	<%if(vo.getCompany_pic1() !=null){ %>
                    <!-- <img src="C:\Users\smhrd\Desktop\JavaStudy\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\testProject0923\uploadedFiles\img113.jpg" class="profile" > -->
                   <%--  <img src= "C:\\Users\\smhrd\\git\\whitebeard123\\testProject0923\\src\\main\\webapp\\uploadedFiles\\<%=vo.getCompany_pic1() %>" class="profile" > --%>
	                     <img src= "./uploadedFiles\\<%=vo.getCompany_pic1() %>" class="profile" >
                    
                    <%} else{%>
                    <P>������ �־��</P>
                    <%} %>
                   <!--  "C:\\Users\\smhrd\\git\\whitebeard123\\testProject0923\\src\\main\\webapp\\uploadedFiles"; -->
                    
                </div>
                <div class="nick">
                    <p><%=vo.getNickname() %></p>
                   
                </div>
            </div>
            
            
            <div class="submit">
			<% if(vo.getMember_type().equals("0")){%> 
                <a href = "update.html"><input type="submit" class = "upup" value=" ȸ�� ���� ���� "></a>
             <% } else { %>                
             	<a href = "update.html"><input type="submit" class = "upd" value=" ȸ�� ���� ���� "></a>
                <a href = "sellerupdate.html"><input type="submit" class = "upd" value=" �Ǹ��� ���� ���� "></a>
                <%} %>
            </div>
            <hr>
            
            <!-- �� ���� ���� -->
            <div class="plus">
                <a class="sub" id="ground">�� ���� ���� : </a>
                <div class="icon1"><i class="fas fa-map-marker-alt"></i></div>
                <%String town = (String)session.getAttribute("town");
                   if(town == null){
                      town = " " + "���� ����";
                   } %>
                    <%="  "+ town %>
               
               
            </div>
            <form action="MyPageService" method="post">
                <input type="text" id="ground_input" name="town" class=''>
                <input type="submit" value="Ȯ��" id="ground_input_check" class=''>
            </form>
            
            
            <!-- �� ���� ��ǰ -->
            <div class="plus">
                <a class="sub" id="favitem">�� ���� ��ǰ : </a>
                <div class="icon1"><i class="fas fa-shopping-cart"></i></div>
                <%String favitem = (String)session.getAttribute("favitem");
                   if(favitem == null){
                      favitem = " " + "������ ����";
                	} 
                   %>
                    <%=" " + favitem %>
 
                
            </div>
            <form action="MyPageService" method="post">
                <input type="text" id="item_input" name="favitem" class=''>
                <input type="submit" value="Ȯ��" id="item_input_check">
            </form>
            
         
            <!-- �� ���� ����� -->
            <div class="plus">
                <a class="sub" id="favshop">�� ���� ����� : </a>
                <div class="icon1"><i class="fas fa-store-alt"></i></div>
                <%String favshop = (String)session.getAttribute("favshop");
                   if(favshop == null){
                      favshop = " ���� ����";
              	  } %>
                    <%=" "+ favshop %>
            </div>
            <form action="MyPageService" method="post">
                <input type="text" id="shop_input" name="favshop" class=''>
                <input type="submit" value="Ȯ��" id="shop_input_check">
            </form>
            

            <!-- �������� -->
            <div class="plus">
                <a class="sub" href = "myzzim.jsp">�� �� ����</a>
                <div class="icon1"><i class="fas fa-trophy"></i></div>
            </div>
            
            
            <!-- �Ǹ��� ��� / �� SNS �̵� -->
            <% if(vo.getMember_type().equals("0")){%>           
	            <div class="plus">
	                <a class="sub" href = "sellerjoin.html">�Ǹ��� ���</a>
	                <div class="icon1"><i class="fas fa-user-check"></i></div>
	            </div>
          <%--   <% } else {  %>
	            <div class="plus">
		           	<a class="sub" href = "sns.jsp">�� SNS �̵�</a>
		            <div class="icon1"><i class="fas fa-user-check"></i></div>
	            </div>	--%>
            
            <% }%> 
            <% if(vo.getMember_type().equals("1")){%>           
	            <div class="plus">
	                <a class="sub" href = "page.jsp">��ǰ�Ǹ� ���</a>
	                <div class="icon1"><i class="fas fa-user-check"></i></div>
	            </div>
	         <%}else{ %>
	         <%} %>
            
            <!-- ȸ��Ż�� / �Ǹ���Ż�� -->          
            <div class="plus">
                <a class="sub" href = "delete.html">ȸ�� Ż�� / �Ǹ��� Ż��</a>
                <div class="icon1"><i class="fas fa-user-check"></i></div>
            </div>

          
        </div>
    </div>
    
    
    <script src="js/jquery-3.6.0.min.js"></script>
    <script>
    
    /* �� ���� Ŭ��  */
   $("#ground").click(function(){
      if($("#ground_input").attr('class')==''){
         $("#ground_input").addClass("active");
         $("#ground_input_check").addClass("active");
      }else{
         $("#ground_input").removeClass("active");
         $("#ground_input_check").removeClass("active");
      }   
   });
   $("#favitem").click(function(){
      if($("#item_input").attr('class')==''){
         $("#item_input").addClass("active");
         $("#item_input_check").addClass("active");
      }else{
         $("#item_input").removeClass("active");
         $("#item_input_check").removeClass("active");
      }   
   });
   $("#favshop").click(function(){
      if($("#shop_input").attr('class')==''){
         $("#shop_input").addClass("active");
         $("#shop_input_check").addClass("active");
      }else{
         $("#shop_input").removeClass("active");
         $("#shop_input_check").removeClass("active");
      }   
   });
   
   
    
    </script>
</body>
</html>