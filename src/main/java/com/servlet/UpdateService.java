package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.memberDAO;
import com.VO.MemberVO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@WebServlet("/UpdateService")
public class UpdateService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("euc-kr");

		String saveDri = request.getServletContext().getRealPath("uploadedFiles");
		System.out.println(saveDri);
		int maxSize = 5 * 1024 * 1024;
		String encoding = "EUC-KR";

		MultipartRequest multi = new MultipartRequest(request, saveDri, maxSize, encoding,
				new DefaultFileRenamePolicy());

		String nowpw = multi.getParameter("nowpw");
		String member_pw = multi.getParameter("pw");
		String name = multi.getParameter("name");
		String nick = multi.getParameter("nick");
		String email = multi.getParameter("email");
		String phone = multi.getParameter("phone");
		String yy = multi.getParameter("yy");
		yy = yy.substring(2);
		String mm = multi.getParameter("mm");
		String dd = multi.getParameter("dd");
		String date = yy + "/" + mm + "/" + dd;
		String file = URLEncoder.encode(multi.getFilesystemName("file"), "EUC-KR");

		
		HttpSession session = request.getSession();   
		MemberVO vo = (MemberVO)session.getAttribute("vo");
		String id = (String)session.getAttribute("id");
		
		String member_id = id;
		String member_type = vo.getMember_type();
		String company_name = vo.getCompany_name();
		String company_bn = vo.getCompany_bn();
		String b_type = vo.getB_type();
		String company_pic2 = vo.getCompany_pic2();
		String company_pic3 = vo.getCompany_pic3();
		String company_info = vo.getCompany_info();
		
		
		memberDAO dao = new memberDAO();
		int cnt = dao.update(nowpw, member_pw, name, date, nick, email, phone, file, member_id);
		
		if (cnt > 0) {
			MemberVO vo2 = new MemberVO(member_id, member_pw, name, date, nick, email, phone, member_type, company_name,
					company_bn, b_type, file, company_pic2, company_pic3, company_info);
			session.setAttribute("vo", vo2);
			
			response.setCharacterEncoding("euc-kr");
			response.setContentType("text/html; charset=euc-kr");
			PrintWriter out = response.getWriter();
			
			out.print("<script language='javascript' charset='euc-kr'>");
			out.print("alert('회원정보 수정 완료.');");
			out.print("location.href='mypage.jsp'");
			out.print("</script>");
		} else {

			response.setCharacterEncoding("euc-kr");
			response.setContentType("text/html; charset=euc-kr");
			PrintWriter out = response.getWriter();

			out.print("<script language='javascript' charset='euc-kr'>");
			out.print("alert('입력한 정보가 바르지 않습니다.');");
			out.print("location.href='update.html'");
			out.print("</script>");

		}
	}

}
