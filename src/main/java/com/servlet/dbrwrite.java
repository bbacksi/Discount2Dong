package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.sql.Timestamp;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.dbrDAO;
import com.VO.MemberVO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;



@WebServlet("/dbrwrite")
public class dbrwrite extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("euc-kr");

		HttpSession session = request.getSession();
		MemberVO vo = (MemberVO) session.getAttribute("vo");
		
		String saveDri = request.getServletContext().getRealPath("./uploadedFiles");
		System.out.println(saveDri);
		int maxSize = 5*1024*1024;
		String encoding = "EUC-KR";
		
		MultipartRequest multi = new MultipartRequest(request, saveDri, maxSize, encoding, new DefaultFileRenamePolicy());

		String member_id = vo.getMember_id();
		String ano_subject = multi.getParameter("ano_subject");
		String ano_content = multi.getParameter("ano_content");
		String ano_pic1 = URLEncoder.encode(multi.getFilesystemName("ano_pic1"), "EUC-KR");
		String ano_pic2 = URLEncoder.encode(multi.getFilesystemName("ano_pic2"), "EUC-KR");
		String ano_pic3 = URLEncoder.encode(multi.getFilesystemName("ano_pic3"), "EUC-KR");
		
//		String member_id = vo.getMember_id();
//		String ano_subject = request.getParameter("ano_subject");
//		String ano_content = request.getParameter("ano_content");
//		String ano_pic1 = request.getParameter("ano_pic1");
//		String ano_pic2 = request.getParameter("ano_pic2");
//		String ano_pic3 = request.getParameter("ano_pic3");
		int readcount = 0;//
		Timestamp nowdate = new Timestamp(System.currentTimeMillis());
		

		

		
		dbrDAO dbr = new dbrDAO();  
		int num= 0;
		int cnt = dbr.write(member_id,ano_subject, ano_content,
				ano_pic1, ano_pic2, ano_pic3);
		
		response.setCharacterEncoding("euc-kr");	
		PrintWriter out = response.getWriter();
		
		if(cnt>0) {
		out.print("<script language='javascript' charset='euc-kr'>");	
		out.println("alert('등록완료');");
		out.println("history.go(-3);");
		out.println("</script>"); 
		
		} else {
		
		out.println("<script>");
		out.println("alert('등록실패');");
		out.println("history.back();");
		out.println("</script>"); 
	}
		
				
		
		
		
		
		
		
		
		
		
	}

}
