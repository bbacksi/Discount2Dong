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

import com.DAO.mypointDAO;
import com.DAO.snsDAO;
import com.VO.MemberVO;
import com.VO.SnsVO;

@WebServlet("/Sold")
public class Sold extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		request.setCharacterEncoding("euc-kr");
		response.setCharacterEncoding("euc-kr");
	
		String user_id =request.getParameter("user_id");
		System.out.println(user_id);
		
		HttpSession session = request.getSession();	
		int idx = (int) session.getAttribute("sns_seq");
		
		snsDAO sns_dao = new snsDAO();
		ArrayList<SnsVO> vo2 = sns_dao.sns_real(idx);		
		String sns_member_id = vo2.get(0).getMember_id();
		
		mypointDAO dao = new mypointDAO();
		int cnt = dao.insert_point(idx, user_id);
		String address = String.format("sns.jsp?sns_seq=%s&sns_memeber_id=%s", idx, sns_member_id);
		
		PrintWriter out = response.getWriter();
		
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
