package com.servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.mychoiceDAO;
import com.DAO.snsDAO;
import com.VO.MemberVO;
import com.VO.SnsVO;


@WebServlet("/Zzim")
public class Zzim extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("euc-kr");
		
		HttpSession session = request.getSession();
		MemberVO vo = (MemberVO) session.getAttribute("vo");
		String member_id = vo.getMember_id();
	
		int idx = (int) session.getAttribute("sns_seq");
		
		snsDAO sns_dao = new snsDAO();
		ArrayList<SnsVO> vo2 = sns_dao.sns_real(idx);
		
		String sns_member_id = vo2.get(0).getMember_id();
		
		System.out.println(idx);
		System.out.println(member_id);
		
		mychoiceDAO dao = new mychoiceDAO();
		String address = String.format("sns.jsp?sns_seq=%s&sns_memeber_id=%s", idx, sns_member_id);
		
		int cho = dao.insert_choice(idx, member_id);
		if (cho >0) {
			
			response.sendRedirect(address);

		}
		
	}

}
