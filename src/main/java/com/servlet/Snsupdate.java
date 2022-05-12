package com.servlet;

import java.io.IOException;
import java.net.URLEncoder;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.snsDAO;
import com.VO.SnsVO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@WebServlet("/Snsupdate")
public class Snsupdate extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("euc-kr");
		
		HttpSession session = request.getSession();
		int sns_seq = (int) session.getAttribute("sns_seq");
		snsDAO sns_dao = new snsDAO();
		ArrayList<SnsVO> vo2 = sns_dao.sns_real(sns_seq);
		
		String sns_member_id = vo2.get(0).getMember_id();
		
		
		
		String subject = request.getParameter("subject");
		int regular_price = Integer.parseInt(request.getParameter("regular_price"));
		int discount_price = Integer.parseInt(request.getParameter("discount_price"));
		int sale_price = Integer.parseInt(request.getParameter("sale_price"));
		String content = request.getParameter("content");
		
		System.out.println(subject);
		System.out.println(regular_price);
		System.out.println(discount_price);
		System.out.println(sale_price);
		System.out.println(content);
		System.out.println(sns_seq);
		
		snsDAO dao = new snsDAO();
		int cnt = dao.update_sns(sns_seq, subject, content, regular_price, discount_price, sale_price);
	    
		String address = String.format("sns.jsp?sns_seq=%s&sns_memeber_id=%s", sns_seq, sns_member_id);
		if(cnt>0) {
			response.sendRedirect(address);
		}else {
			System.out.println("업데이트 실패");
		}
	}

}
