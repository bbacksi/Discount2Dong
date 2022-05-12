<%@page import="com.VO.SnsVO"%>
<%@page import="com.VO.MyChoiceVO"%>
<%@page import="com.DAO.mypointDAO"%>
<%@page import="com.DAO.mychoiceDAO"%>
<%@page import="com.VO.MyPointVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.VO.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<link rel="stylesheet" href="assets/css/myzzim.css">

</head>
<body>
	<%
	MemberVO vo = (MemberVO)session.getAttribute("vo");
	
	%>
	
	<div class="wrap">
        <div class="mypage">
	 
	<!-- 상단 메뉴 -->	
	 <nav class='navbar'>
      <div class='navbar__logo'>로고 자리</div>

      <div class='navbar__main' onclick="location.href='main.jsp'"\>할인2동</div>
      
         	<%
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
             	  } %>
    
	
	<%
	ArrayList<MyPointVO> successList = new ArrayList<MyPointVO>();
	mypointDAO p_dao = new mypointDAO();
	mychoiceDAO c_dao = new mychoiceDAO();
	ArrayList<SnsVO> vo2 = c_dao.select_my_choice(vo.getMember_id());
	System.out.println(vo2.get(0).getSubject());
	System.out.println("이곳이에요");
	System.out.println(vo.getMember_id());
	System.out.println(vo2.size());
	
	%>
	<div id = "inner">
	<section>
		<!-- 주석추가 -->
		<!-- 내 찜 목록 (내가 찜한 SNS 제목만 나옴) -->
		<div class = "list"><h3>내 찜 목록</h3></div>
		<div>
		<table border = "1">
		<%
		if (vo2.size() > 0) {%>
			<%for(int i =0; i < vo2.size(); i ++){ %>
			<tr>
				<td class = "tt">게시글 제목</td>
				<td><%=vo2.get(i).getSubject()%></td>
			</tr>
			
		<%}%>
		<%} else {%>
		 <div>내 찜이 없습니다</div>
		<% }%>	
		
		</table>
		</div>
		<br>
		<% ArrayList<MyPointVO> num = p_dao.select_count_point(vo.getMember_id());%>
		<div><h3>내 현재 포인트 : </h3><%= num.size()*10%></div>
		<br>
		
		<!-- 내가 찜에 성공한 리스트 (SNS 제목만 나옴) -->
		<div class = "list"><h3>내 찜 성공 목록</h3></div>
		<div>
		<% ArrayList<SnsVO> list = p_dao.select_my_choice(vo.getMember_id());
		if(list.size() == 0)  {%>
			<div><p> 내 찜 성공  없음</p></div>
		<%} else { 
			for(int i = 0 ; i < list.size() ; i++) {
		%> 
		<table border = "1">
			<tr>
				<td class = "tt">게시글 제목</td>
				<td><%=list.get(i).getSubject()%></td>
			</tr>
			<tr>
				<td class = "tt">상품 사진</td>
				<td>
					<img src= "./uploadedFiles\\<%=list.get(i).getPic1() %>" class = "img">
				</td>
			</tr>			
		</table>	
		<%}} %>
		</div><br>
		
		<!-- 찜을 성공한 뒤, 인증 사진 올리기  -->
		<!-- <form>
			<div>찜 인증 사진 올리기</div><br>
			<div class="uploadwrap">
				<div>
					<input type="file" class="file" accept="image/*"
						name="pic1" id="company_pic1"
						onchange="setThumbnail(event);">
				</div>
			</div>
			<div>
				<div>
					<input type="file" class="file" accept="image/*"
						onchange="setThumbnail(event);" name="pic2"
						id="company_pic2">
				</div>
			</div>
			<div>
				<div>
					<input type="file" class="file" onchange="setThumbnail(event);"
						accept="image/*" name="pic3" id="company_pic3">
				</div>
			</div>
		</form> -->
		<%-- <div>찜 인증 사진 구경하기</div><br>
		<div><% if(p_dao.select_picture(vo.getMember_id()) == null) {
		out.print("<div> 내 찜 인증 사진 없슴 </div>");
		} else { %>
			<%=p_dao.select_picture(vo.getMember_id())%>					
		<%} %>
		</div><br> --%>
		
		<!-- 내 현재 포인트 (새로고침 버튼 누르면 업데이트) -->
		
	</section>
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
	
	<script type = "text/javascript">
	function setThumbnail(event) {
        var uploadWrap = event.target.parentNode; 
              var reader = new FileReader();

               reader.onload = function(event) {
                    console.log(uploadWrap);
                    var newImg = document.createElement("img");
                    uploadWrap.appendChild(newImg);
                    newImg.setAttribute("src", event.target.result);
                    newImg.setAttribute("width", 200);
                    newImg.setAttribute("class", "pre_img");
            }; 
            reader.readAsDataURL(event.target.files[0]);
	}
	
	  /* $(".navbar__profile").click(function() {
          if ($(".navbar__menu").attr('class') == 'navbar__menu') {
             $(".navbar__menu").addClass("active");
          } else {
             $(".navbar__menu").removeClass("active");
          }
       }); */
    </script>
</body>
<tail></tail>
</html>