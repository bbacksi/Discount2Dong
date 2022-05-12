package com.servlet;

import java.io.IOException;
import java.net.URLEncoder;
import java.util.Enumeration;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DAO.memberDAO;
import com.VO.MemberVO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@WebServlet("/JoinService")
public class JoinService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	request.setCharacterEncoding("euc-kr");
 
	
	String saveDri = request.getServletContext().getRealPath("./uploadedFiles");

//			"C:\\Users\\smhrd\\git\\whitebeard123\\testProject0923\\src\\main\\webapp\\uploadedFiles";
//			request.getServletContext().getRealPath("uploadedFiles");
	System.out.println(saveDri);
	int maxSize = 5*1024*1024;
	String encoding = "EUC-KR";
	
	
	
	MultipartRequest multi = new MultipartRequest(request, saveDri, maxSize, encoding, new DefaultFileRenamePolicy());

	String id = multi.getParameter("id");
	String pw = multi.getParameter("pw");
	String name = multi.getParameter("name");
	String nick = multi.getParameter("nick");
	String email = multi.getParameter("email");
	String phone = multi.getParameter("phone");
	String yy = multi.getParameter("yy");
	yy = yy.substring(2);
	String mm = multi.getParameter("mm");
	String dd = multi.getParameter("dd");
	 
	String date =  yy+"/"+mm+"/"+dd;
	String file = URLEncoder.encode(multi.getFilesystemName("file"), "EUC-KR");
	//saveDri +"\\"+ 
	
//	String id = request.getParameter("id");
//	String pw = request.getParameter("pw");
////	String pwcheck = request.getParameter("pwcheck");
//	String file = request.getParameter("file");
//	System.out.println(file);
//	String name = request.getParameter("name");
//	String nick = request.getParameter("nick");
//	String email = request.getParameter("email");
//	String phone = request.getParameter("phone");
//	String company_pic1 = request.getParameter("company_pic1");
//	//String yy = request.getParameter("yy");
//	//
//	String mm = request.getParameter("mm");
//	String dd = request.getParameter("dd");
//	String date = yy+"/"+mm+"/"+dd;
//	System.out.println(date);
	
	memberDAO dao = new memberDAO();
	int cnt = dao.join(id, pw, name, date, nick, email, phone, file);
	
	if(cnt>0) {
		response.sendRedirect("joincomplete.html");
	}else {
		response.sendRedirect("join.html");
		System.out.println("가입실패");
	}
	
	
	}

}
