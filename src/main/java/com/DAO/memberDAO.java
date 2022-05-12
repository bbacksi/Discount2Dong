package com.DAO;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.VO.MemberVO;

public class memberDAO {

	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;
	public void conn() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			String url = "jdbc:oracle:thin:@project-db-stu.ddns.net:1524:xe";
			String dbid = "cgi_6_2";
			String dbpw = "smhrd2";
			conn = DriverManager.getConnection(url, dbid, dbpw);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void close() {
		try {
			if (rs != null) {
				rs.close();
			}
			if (psmt != null) {
				psmt.close();
			}
			if (conn != null) {
				conn.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	public int join(String id, String pw, String name, String date, String nick, String email, String phone, String company_pic1) {
		int cnt = 0;
		System.out.println(date);
		try {
			conn();

			String sql = "insert into members(member_id, member_pw, name, birth_date, nickname, email, phone, company_pic1, member_type) values(?, ?, ?, ?, ?, ?, ?, ?, 0)";

			psmt = conn.prepareStatement(sql);

			
			psmt.setString(1, id);
			psmt.setString(2, pw);
			psmt.setString(3, name);
			psmt.setString(4, date);
			psmt.setString(5, nick);
			psmt.setString(6, email);
			psmt.setString(7, phone);
			psmt.setString(8, company_pic1);

			cnt = psmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	}

	public boolean idCheck(String id) {

		System.out.println(id);

		boolean check = false;
		conn();

		String sql = "select member_id from members where member_id = ?";

		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			rs = psmt.executeQuery();

			System.out.println(sql);

			if (rs.next()) {
				System.out.print("true");
				check = true;
			} else {
				System.out.print("false");
				check = false;
			}//
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return check;
	}
	public boolean bnCheck(String company_bn) {

		System.out.println(company_bn);

		boolean check = false;
		conn();

		String sql = "select company_bn from members where company_bn = ?";

		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, company_bn);
			rs = psmt.executeQuery();

			System.out.println(sql);

			if (rs.next()) {
				System.out.print("true");
				check = true;
			} else {
				System.out.print("false");
				check = false;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return check;
	}

	public String findid(String name, String email) {
		conn();
		String getid = null;
		try {
			String sql = "select member_id from members where name = ? and email = ?";
			PreparedStatement psmt = conn.prepareStatement(sql);
			psmt.setString(1, name);
			psmt.setString(2, email);

			rs = psmt.executeQuery();

			if (rs.next()) {

				getid = rs.getString(1);

			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return getid;
	}

	public String findpw(String id, String name, String email) {

		conn();
		String getpw = null;
		try {
			String sql = "select member_pw from members where member_id = ? and name = ? and email = ?";
			PreparedStatement psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			psmt.setString(2, name);
			psmt.setString(3, email);

			rs = psmt.executeQuery();
			if (rs.next()) {
				getpw = rs.getString(1);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return getpw;
	}
	
	
	public MemberVO login(String member_id, String member_pw) {
		MemberVO vo = null;
		try {

			conn();

			// 2-4. sql문 준비하기
			String sql = "select * from members where member_id = ? and member_pw = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, member_id);
			psmt.setString(2, member_pw);

			// 2-5. sql문 실행하기
			rs = psmt.executeQuery();

			if (rs.next()) {
				
				String id = rs.getString(1);
				String pw = rs.getString(2);
				String name = rs.getString(3);
				String birth_date = rs.getString(4);
				String nickname = rs.getString(5);
				String email = rs.getString(6);
				String phone = rs.getString(7);
				String member_type = rs.getString(8);
				String company_name = rs.getString(9);
				String company_bn = rs.getString(10);
				String b_type = rs.getString(11);
				String company_pic1 = rs.getString(12);
				String company_pic2 = rs.getString(13);
				String company_pic3 = rs.getString(14);
				String company_info = rs.getString(15);
				vo = new MemberVO(id, pw, name, birth_date, nickname, email, phone, member_type, company_name,
						company_bn, b_type, company_pic1, company_pic2, company_pic3, company_info);
			} 
			
		} catch (Exception e) {
			// 실행 후 오류가 발생했을 때 에러 출력
			e.printStackTrace();
		} finally {
			close();
		}
		
		return vo;
	}
	
	public int sellerjoin(String member_id, String member_pw, String company_name, String company_bn, String b_type, 
			String company_pic1, String company_pic2, String company_pic3, String company_info) {
		int cnt = 0;
		try {
			conn();
			
			System.out.println(member_id);
			System.out.println(member_pw);
			
			String sql = "update members set member_type = '1', company_name=?, company_bn=?, b_type=?, company_pic1=?, company_pic2=?, company_pic3=?, company_info=? where member_id = ? and member_pw = ?";

			psmt = conn.prepareStatement(sql);

			psmt.setString(1, company_name);
			psmt.setString(2, company_bn);
			psmt.setString(3, b_type);
			psmt.setString(4, company_pic1);
			psmt.setString(5, company_pic2);
			psmt.setString(6, company_pic3);
			psmt.setString(7, company_info);
			psmt.setString(8, member_id);
			psmt.setString(9, member_pw);
			
			cnt = psmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	}
	public int update(String nowpw, String member_pw, String name, String date, String nick, String email, String phone, String file, String member_id) {
		System.out.println(nowpw+","+member_pw+","+ name+","+ date+","+ nick+","+ email+","+ phone+","+ file+","+ member_id);
		int cnt=0;
		try {
			conn();
			
			String sql = "update members set member_pw = ?, name = ?, birth_date = ?, nickname=?, email=?, phone=?, company_pic1=? where member_id = ? and member_pw = ?";
			
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, member_pw);
			psmt.setString(2, name);
			psmt.setString(3, date);
			psmt.setString(4, nick);
			psmt.setString(5, email);
			psmt.setString(6, phone);
			psmt.setString(7, file);
			psmt.setString(8, member_id);
			psmt.setString(9, nowpw);
			
			cnt = psmt.executeUpdate();
			
		}catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
		return cnt;
	}
	
	public int sellerupdate(String member_id, String member_pw, String company_name, String company_bn, String b_type, 
			String company_pic1, String company_pic2, String company_pic3, String company_info) {
		int cnt = 0;
		try {
			conn();
			System.out.println(member_id);
			System.out.println(member_pw);
			
			String sql = "update members set company_name = ?, company_bn = ?, b_type = ?, company_pic1=?, company_pic2=?, company_pic3=?, company_info=? where member_id = ? and member_pw = ?";
			
			psmt = conn.prepareStatement(sql);
		
			psmt.setString(1, company_name);
			psmt.setString(2, company_bn);
			psmt.setString(3, b_type);
			psmt.setString(4, company_pic1);
			psmt.setString(5, company_pic2);
			psmt.setString(6, company_pic3);
			psmt.setString(7, company_info);
			psmt.setString(8, member_id);
			psmt.setString(9, member_pw);
			
			cnt = psmt.executeUpdate();
			
		}catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
		return cnt;
		
	}
	
	public int delete(String id, String pw) {
		int cnt = 0;
		
		try {
			conn();
			
			String sql = "delete from members where member_id = ? and member_pw =?";  
			psmt = conn.prepareStatement(sql);

			psmt.setString(1, id);
			psmt.setString(2, pw);

			cnt = psmt.executeUpdate();  

		}catch(Exception e){
			e.printStackTrace();
		}finally {
			close();
		}
		return cnt;
	}
	
	public int sellerdelete(String id, String pw) {
		int cnt = 0;
		
		try {
			conn();
			
			String sql = "update members set member_type = 0, company_name = null, company_bn = null, b_type = null, company_pic1=null, company_pic2=null, company_pic3=null, company_info=null where member_id = ? and member_pw = ?";
			psmt = conn.prepareStatement(sql);

			psmt.setString(1, id);
			psmt.setString(2, pw);

			cnt = psmt.executeUpdate();  

		}catch(Exception e){
			e.printStackTrace();
		}finally {
			close();
		}
		return cnt;
	}
	
	
	public String find_company_name(String member_id) {
		conn();
		String getCompany_name = null;
		try {
			String sql = "select company_name from members where member_id = ?";
			PreparedStatement psmt = conn.prepareStatement(sql);
			psmt.setString(1, member_id);

			rs = psmt.executeQuery();

			if (rs.next()) {

				getCompany_name = rs.getString(1);

			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return getCompany_name;
	}
	
	public int company_info(String member_id, String company_info) {
		
		int cnt = 0;
		
		try {
			
			conn();	               				
			String sql = "update members set company_info=? where member_id = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, company_info);               
			psmt.setString(2,member_id);               

			rs = psmt.executeQuery();
			
			cnt = psmt.executeUpdate();  

			
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			close();
		}
		
		return cnt;		
		
	}	
}