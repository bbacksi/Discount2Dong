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
	 
	<!-- ��� �޴� -->	
	 <nav class='navbar'>
      <div class='navbar__logo'>�ΰ� �ڸ�</div>

      <div class='navbar__main' onclick="location.href='main.jsp'"\>����2��</div>
      
         	<%
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
             	  } %>
    
	
	<%
	ArrayList<MyPointVO> successList = new ArrayList<MyPointVO>();
	mypointDAO p_dao = new mypointDAO();
	mychoiceDAO c_dao = new mychoiceDAO();
	ArrayList<SnsVO> vo2 = c_dao.select_my_choice(vo.getMember_id());
	System.out.println(vo2.get(0).getSubject());
	System.out.println("�̰��̿���");
	System.out.println(vo.getMember_id());
	System.out.println(vo2.size());
	
	%>
	<div id = "inner">
	<section>
		<!-- �ּ��߰� -->
		<!-- �� �� ��� (���� ���� SNS ���� ����) -->
		<div class = "list"><h3>�� �� ���</h3></div>
		<div>
		<table border = "1">
		<%
		if (vo2.size() > 0) {%>
			<%for(int i =0; i < vo2.size(); i ++){ %>
			<tr>
				<td class = "tt">�Խñ� ����</td>
				<td><%=vo2.get(i).getSubject()%></td>
			</tr>
			
		<%}%>
		<%} else {%>
		 <div>�� ���� �����ϴ�</div>
		<% }%>	
		
		</table>
		</div>
		<br>
		<% ArrayList<MyPointVO> num = p_dao.select_count_point(vo.getMember_id());%>
		<div><h3>�� ���� ����Ʈ : </h3><%= num.size()*10%></div>
		<br>
		
		<!-- ���� �� ������ ����Ʈ (SNS ���� ����) -->
		<div class = "list"><h3>�� �� ���� ���</h3></div>
		<div>
		<% ArrayList<SnsVO> list = p_dao.select_my_choice(vo.getMember_id());
		if(list.size() == 0)  {%>
			<div><p> �� �� ����  ����</p></div>
		<%} else { 
			for(int i = 0 ; i < list.size() ; i++) {
		%> 
		<table border = "1">
			<tr>
				<td class = "tt">�Խñ� ����</td>
				<td><%=list.get(i).getSubject()%></td>
			</tr>
			<tr>
				<td class = "tt">��ǰ ����</td>
				<td>
					<img src= "./uploadedFiles\\<%=list.get(i).getPic1() %>" class = "img">
				</td>
			</tr>			
		</table>	
		<%}} %>
		</div><br>
		
		<!-- ���� ������ ��, ���� ���� �ø���  -->
		<!-- <form>
			<div>�� ���� ���� �ø���</div><br>
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
		<%-- <div>�� ���� ���� �����ϱ�</div><br>
		<div><% if(p_dao.select_picture(vo.getMember_id()) == null) {
		out.print("<div> �� �� ���� ���� ���� </div>");
		} else { %>
			<%=p_dao.select_picture(vo.getMember_id())%>					
		<%} %>
		</div><br> --%>
		
		<!-- �� ���� ����Ʈ (���ΰ�ħ ��ư ������ ������Ʈ) -->
		
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