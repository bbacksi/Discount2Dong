package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.commetDAO;
import com.DAO.snsDAO;
import com.VO.MemberVO;
import com.VO.SnsVO;


@WebServlet("/SoldOut")
public class SoldOut extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("euc-kr");
		response.setCharacterEncoding("euc-kr");
		
		
		HttpSession session = request.getSession();
		
		MemberVO vo = (MemberVO) session.getAttribute("vo");
		snsDAO dao = new snsDAO();
		int idx = (int) session.getAttribute("sns_seq");
		ArrayList<SnsVO> vo2 = dao.sns_real(idx);
	
		String new_subject = String.format("%s [판매 완료]", vo2.get(0).getSubject());
		
		int cnt = dao.sold_sns(new_subject, idx);
		PrintWriter out = response.getWriter();
		System.out.println(new_subject);
		System.out.println(idx);
		String sns_member_id = vo2.get(0).getMember_id();
		
		String address = String.format("sns.jsp?sns_seq=%s&sns_memeber_id=%s", idx, sns_member_id);


		
		
		if(cnt>0) {
		response.setCharacterEncoding("euc-kr");	
		out.print("<script language='javascript' charset='euc-kr'>");	
		out.println("alert('등록완료');");
		out.println("history.back();");
		out.println("</script>"); 
		
		} else {
		
		out.println("<script>");
		out.println("alert('등록실패');");
		out.println("history.back();");
		out.println("</script>"); 
	}
	
	}

}
