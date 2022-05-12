package com.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.memberDAO;

@WebServlet("/SnsSevice")
public class SnsSevice extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	
		request.setCharacterEncoding("euc-kr");
		
		HttpSession session = request.getSession();
		session.setMaxInactiveInterval(60*60*24*365); 
		
		memberDAO dao = new memberDAO();
		
		
		
	
	
	
	}

}
