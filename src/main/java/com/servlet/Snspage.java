package com.servlet;

import java.io.IOException;
import java.net.URLEncoder;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.snsDAO;
import com.VO.MemberVO;
import com.VO.SnsVO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@WebServlet("/Snspage")
public class Snspage extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("euc-kr");

		String saveDri = request.getServletContext().getRealPath("uploadedFiles");
		System.out.println(saveDri);
		int maxSize = 5*1024*1024;
		String encoding = "EUC-KR";
		
		MultipartRequest multi = new MultipartRequest(request, saveDri, maxSize, encoding, new DefaultFileRenamePolicy());
		
		HttpSession session = request.getSession();   
		MemberVO vo = (MemberVO)session.getAttribute("vo");
		
		String id = vo.getMember_id();
		
		String subject = multi.getParameter("subject");
		int regular_price = Integer.parseInt(multi.getParameter("regular_price"));
		int discount_price = Integer.parseInt(multi.getParameter("discount_price"));
		int sale_price = Integer.parseInt(multi.getParameter("sale_price"));
		String pic1 = URLEncoder.encode(multi.getFilesystemName("pic1"), "EUC-KR");
		String pic2 = URLEncoder.encode(multi.getFilesystemName("pic2"), "EUC-KR");
		String pic3 = URLEncoder.encode(multi.getFilesystemName("pic3"), "EUC-KR");
		String content = multi.getParameter("content");
		Date input_date = null;
		
		snsDAO dao = new snsDAO();
		int cnt = dao.insert_sns(id, subject, content, pic1, pic2, pic3, regular_price, discount_price, sale_price, input_date);
//		SnsVO vo2 = new SnsVO(id, subject, content, pic1, pic2, pic3, regular_price, discount_price, sale_price, input_date);
//		System.out.print(input_date);

		if(cnt>0) {
//			session.setAttribute("vo2", vo2);
			response.sendRedirect("main.jsp");
		}else {
			response.sendRedirect("page.jsp");
			System.out.println("작성실패");
		}
}
}
