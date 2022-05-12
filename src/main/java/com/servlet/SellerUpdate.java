package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DAO.memberDAO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@WebServlet("/SellerUpdate")
public class SellerUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("euc-kr");

		String saveDri = request.getServletContext().getRealPath("uploadedFiles");
		System.out.println(saveDri);
		int maxSize = 5*1024*1024;
		String encoding = "EUC-KR";
		
		MultipartRequest multi = new MultipartRequest(request, saveDri, maxSize, encoding, new DefaultFileRenamePolicy());
		
		String member_id = multi.getParameter("id");
		String member_pw = multi.getParameter("pw");
		String company_name = multi.getParameter("company_name");
		String company_bn = multi.getParameter("company_bn");
		String b_type = multi.getParameter("b_type");
		String company_pic1 = URLEncoder.encode(multi.getFilesystemName("company_pic1"), "EUC-KR");
		String company_pic2 = URLEncoder.encode(multi.getFilesystemName("company_pic2"), "EUC-KR");
		String company_pic3 = URLEncoder.encode(multi.getFilesystemName("company_pic3"), "EUC-KR");
		String company_info = multi.getParameter("company_info");
		
		
		memberDAO dao = new memberDAO();
		int cnt = dao.sellerupdate(member_id, member_pw, company_name, company_bn, b_type, company_pic1, company_pic2, company_pic3, company_info);
		if(cnt>0) {
			response.setCharacterEncoding("euc-kr");
			response.setContentType("text/html; charset=euc-kr");
			PrintWriter out = response.getWriter();
			
			out.print("<script language='javascript' charset='euc-kr'>");
			out.print("alert('판매자정보 수정 완료.');");
			out.print("location.href='mypage.jsp'");
			out.print("</script>");
		}
		else {
			
			response.setCharacterEncoding("euc-kr");
			response.setContentType("text/html; charset=euc-kr");
			PrintWriter out = response.getWriter();
			
			out.print("<script language='javascript' charset='euc-kr'>");
			out.print("alert('입력한 정보가 바르지 않습니다.');");
			out.print("location.href='sellerupdate.html'");
			out.print("</script>");
			
		}
	}

}
