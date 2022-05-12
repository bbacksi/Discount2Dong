
<%@page import="javax.websocket.Session"%>
<%@page import="com.VO.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="assets/css/dbr_write.css" />

</head>

    <script type="text/javascript">
      function move(url) {
        location.href = url;
      }
      function boardWriteCheck() {
        var form = document.BoardWriteForm;
        return true;
      }
    </script>
  </head>

  <body>
   <%
   MemberVO vo = (MemberVO)session.getAttribute("vo");
  
   %>
  
  <% //
  String member_id = vo.getMember_id();//
  
  %>
 
 
 
  	<div id = "wrapper">
  	<div id = "content">
  	
  
    <table summary="글쓰기 전체 테이블">
      <form
        name="dbrWriteForm"
        method="post"
        action="dbrwrite"
        onsubmit="return boardWriteCheck();"
        enctype="multipart/form-data"
      >
        <colgroup>
          <col width="20%" />
          <col width="80%" />
        </colgroup>

        <table summary="테이블 구성">
        	<caption>
         		담벼락 글쓰기
        	</caption>
          <tr>
            <td>제 목</td>
            <td><input type="text" name="ano_subject" id = "title"></td>
          </tr>
<tr>
<td>
이미지
</td>
<td>
					<div class = "uploadwrap">
					
						<div>
							<input type="file" class="file" accept="image/*" name="ano_pic1" id = "a_pic1"
							onchange = "setThumbnail(event);">
						</div>
						<!-- <div id="image_container"><img src = ""></div> -->
					</div>
					<div>
						
						<div>
							<input type="file" class="file" accept="image/*" onchange = "setThumbnail(event);" name="ano_pic2" id = "company_pic2">
						</div>
						<!-- <div id="image_container"><img src = ""></div> -->
						
					</div>
					<div>
						
						<div>
							<input type="file" class="file" onchange = "setThumbnail(event);" accept="image/*"
								name="ano_pic3"  id = "company_pic3">
						</div>
						<!-- <div id="image_container"><img src = ""></div> -->
					</div>
				
</td>
</tr>
				<tr>
            <td>내 용</td>
            <td><textarea name="ano_content" rows="10" cols="100" id = "content_area"></textarea></td>
          </tr>
       
          <tr>
            <td colspan="2"><hr size="1" /></td>
          </tr>
          <tr>
            <td colspan="2">
              <div align="center">
                <input type="submit" value="등록" class="dbr_write_button" />&nbsp;&nbsp; 
                <input
                  type="button"
                  value="뒤로"
                  onclick="move('main.jsp');"
                  class="dbr_write_button"
                  backgroun-color="white"
                />
              </div>
            </td>
          </tr>
        </table>
      </form>
    </table>
    </div>
  	</div>
    <script>
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
	</script>
    
    
  </body>
</html>