package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.dbrDAO;
import com.VO.MemberVO;

/**
 * Servlet implementation class dbrdel
 */
@WebServlet("/dbrdel")
public class dbrdel extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("euc-kr");

	

		HttpSession session = request.getSession();
		MemberVO vo = (MemberVO) session.getAttribute("vo");
		int ano_seq = (int) session.getAttribute("ano_seq");

		
		dbrDAO dbr = new dbrDAO();  

		int cnt = dbr.delete(ano_seq);
		
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
		

		

		
		
		
		
		
		
		
		
		
	
		
		
		
		
		
		
		
		
	
		// TODO Auto-generated method stub
	}

}
