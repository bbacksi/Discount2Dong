package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.memberDAO;
import com.VO.MemberVO;

@WebServlet("/LoginCon")
public class LoginCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("euc-kr");
		
		String ID = request.getParameter("ID");
		String PW = request.getParameter("PW");
		
		memberDAO dao = new memberDAO();
		
		MemberVO vo = dao.login(ID, PW);
		
		PrintWriter out = response.getWriter();
		
		if (vo != null) {
			HttpSession session = request.getSession(); //세션 객체 생성
			session.setAttribute("vo", vo);
			session.setAttribute("id", ID);
			
			System.out.println("로그인성공");
			response.sendRedirect("main.jsp");
		} else {
			System.out.println("로그인실패");
			response.sendRedirect("login.jsp");
		}
		
		
	}

}
