package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DAO.memberDAO;

@WebServlet("/DeleteSellerinfo")
public class DeleteSellerinfo extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		memberDAO dao = new memberDAO();
		int cnt = dao.sellerdelete(id, pw);
		
		if(cnt>0) {
			response.setCharacterEncoding("euc-kr");
			response.setContentType("text/html; charset=euc-kr");
			
			PrintWriter out = response.getWriter();
		
			out.print("<script language='javascript' charset='euc-kr'>");
			out.print("alert('�Ǹ��� ���� ������ �Ϸ�Ǿ����ϴ�.');");
			out.print("location.href='main.jsp'");
			out.print("</script>");
		}
			
		else{
			
			response.setCharacterEncoding("euc-kr");
			response.setContentType("text/html; charset=euc-kr");
			
			PrintWriter out = response.getWriter();
		
			out.print("<script language='javascript' charset='euc-kr'>");
			out.print("alert('���̵� ��й�ȣ�� �ùٸ��� �ʽ��ϴ�.');");
			out.print("location.href='delete.html'");
			out.print("</script>");
		}
	}

}
