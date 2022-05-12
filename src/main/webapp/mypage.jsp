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
            <h2 onclick="location.href='main.jsp'">할인 2동</h2>
            <h4>마이 페이지</h4>
            <div class="imgAndNick">
                <div class="profilediv">
                	<%if(vo.getCompany_pic1() !=null){ %>
                    <!-- <img src="C:\Users\smhrd\Desktop\JavaStudy\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\testProject0923\uploadedFiles\img113.jpg" class="profile" > -->
                   <%--  <img src= "C:\\Users\\smhrd\\git\\whitebeard123\\testProject0923\\src\\main\\webapp\\uploadedFiles\\<%=vo.getCompany_pic1() %>" class="profile" > --%>
	                     <img src= "./uploadedFiles\\<%=vo.getCompany_pic1() %>" class="profile" >
                    
                    <%} else{%>
                    <P>아이콘 넣어라</P>
                    <%} %>
                   <!--  "C:\\Users\\smhrd\\git\\whitebeard123\\testProject0923\\src\\main\\webapp\\uploadedFiles"; -->
                    
                </div>
                <div class="nick">
                    <p><%=vo.getNickname() %></p>
                   
                </div>
            </div>
            
            
            <div class="submit">
			<% if(vo.getMember_type().equals("0")){%> 
                <a href = "update.html"><input type="submit" class = "upup" value=" 회원 정보 수정 "></a>
             <% } else { %>                
             	<a href = "update.html"><input type="submit" class = "upd" value=" 회원 정보 수정 "></a>
                <a href = "sellerupdate.html"><input type="submit" class = "upd" value=" 판매자 정보 수정 "></a>
                <%} %>
            </div>
            <hr>
            
            <!-- 내 동네 설정 -->
            <div class="plus">
                <a class="sub" id="ground">내 동네 설정 : </a>
                <div class="icon1"><i class="fas fa-map-marker-alt"></i></div>
                <%String town = (String)session.getAttribute("town");
                   if(town == null){
                      town = " " + "동네 없음";
                   } %>
                    <%="  "+ town %>
               
               
            </div>
            <form action="MyPageService" method="post">
                <input type="text" id="ground_input" name="town" class=''>
                <input type="submit" value="확인" id="ground_input_check" class=''>
            </form>
            
            
            <!-- 내 관심 상품 -->
            <div class="plus">
                <a class="sub" id="favitem">내 관심 상품 : </a>
                <div class="icon1"><i class="fas fa-shopping-cart"></i></div>
                <%String favitem = (String)session.getAttribute("favitem");
                   if(favitem == null){
                      favitem = " " + "아이템 없음";
                	} 
                   %>
                    <%=" " + favitem %>
 
                
            </div>
            <form action="MyPageService" method="post">
                <input type="text" id="item_input" name="favitem" class=''>
                <input type="submit" value="확인" id="item_input_check">
            </form>
            
         
            <!-- 내 관심 스토어 -->
            <div class="plus">
                <a class="sub" id="favshop">내 관심 스토어 : </a>
                <div class="icon1"><i class="fas fa-store-alt"></i></div>
                <%String favshop = (String)session.getAttribute("favshop");
                   if(favshop == null){
                      favshop = " 상점 없음";
              	  } %>
                    <%=" "+ favshop %>
            </div>
            <form action="MyPageService" method="post">
                <input type="text" id="shop_input" name="favshop" class=''>
                <input type="submit" value="확인" id="shop_input_check">
            </form>
            

            <!-- 내찜정보 -->
            <div class="plus">
                <a class="sub" href = "myzzim.jsp">내 찜 정보</a>
                <div class="icon1"><i class="fas fa-trophy"></i></div>
            </div>
            
            
            <!-- 판매자 등록 / 내 SNS 이동 -->
            <% if(vo.getMember_type().equals("0")){%>           
	            <div class="plus">
	                <a class="sub" href = "sellerjoin.html">판매자 등록</a>
	                <div class="icon1"><i class="fas fa-user-check"></i></div>
	            </div>
          <%--   <% } else {  %>
	            <div class="plus">
		           	<a class="sub" href = "sns.jsp">내 SNS 이동</a>
		            <div class="icon1"><i class="fas fa-user-check"></i></div>
	            </div>	--%>
            
            <% }%> 
            <% if(vo.getMember_type().equals("1")){%>           
	            <div class="plus">
	                <a class="sub" href = "page.jsp">상품판매 등록</a>
	                <div class="icon1"><i class="fas fa-user-check"></i></div>
	            </div>
	         <%}else{ %>
	         <%} %>
            
            <!-- 회원탈퇴 / 판매자탈퇴 -->          
            <div class="plus">
                <a class="sub" href = "delete.html">회원 탈퇴 / 판매자 탈퇴</a>
                <div class="icon1"><i class="fas fa-user-check"></i></div>
            </div>

          
        </div>
    </div>
    
    
    <script src="js/jquery-3.6.0.min.js"></script>
    <script>
    
    /* 내 동네 클릭  */
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