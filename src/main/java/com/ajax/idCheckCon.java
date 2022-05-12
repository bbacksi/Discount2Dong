package com.ajax;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DAO.memberDAO;

@WebServlet("/idCheckCon")
public class idCheckCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String data = request.getParameter("id");
		memberDAO dao = new memberDAO();
	
		boolean check = dao.idCheck(data);
		
		
		System.out.print(dao+":"+check);
		
		PrintWriter out = response.getWriter();
		out.print(check);
	}

}
