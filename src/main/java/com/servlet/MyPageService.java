package com.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;


@WebServlet("/MyPageService")
public class MyPageService extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	
	request.setCharacterEncoding("euc-kr");	
		
	// ���� ���� (1�� ���� �� ����)
	HttpSession session = request.getSession();
	session.setMaxInactiveInterval(60*60*24*365); 

		
	// mypage.jsp�κ��� '�� ���� ����(town)' ���� ���� �޾ƿ´�
	String town = (String)session.getAttribute("town");
	String newtown = request.getParameter("town");
	
	// town ���� ���� ���� ��쿡�� ���� ����, �̹� ���� ��쿡�� ��ü
	if(town != null) {
		if(newtown != null) {
			session.removeAttribute("town");
			session.setAttribute("town", newtown);				
		}
	} else {
		session.setAttribute("town", newtown);	
	}
	
	
	// mypage.jsp�κ��� '�� ���� ��ǰ(favitem)' ���� ���� �޾ƿ´�
	String favitem = (String)session.getAttribute("favitem");
	String newfavitem = request.getParameter("favitem");

	// favitem ���� ���� ���� ��쿡�� ���� ����, �̹� ���� ��쿡�� ��ü
		if(favitem != null) {
			if(newfavitem != null) {
				session.removeAttribute("favitem");
				session.setAttribute("favitem", newfavitem);					
			}
		} else {
			session.setAttribute("favitem", newfavitem);
		}
	
		
	// mypage.jsp�κ��� '�� ���� �����(favshop)' ���� ���� �޾ƿ´�
	String favshop = (String)session.getAttribute("favshop");
	String newfavshop = request.getParameter("favshop");

	// favshop ���� ���� ���� ��쿡�� ���� ����, �̹� ���� ��쿡�� ��ü
		if(favshop != null) {
			if(newfavshop != null) {
				session.removeAttribute("favshop");
				session.setAttribute("favshop", newfavshop);					
			}
		} else {
			session.setAttribute("favshop", newfavshop);
		}	
		
	response.sendRedirect("mypage.jsp");

	}

}
