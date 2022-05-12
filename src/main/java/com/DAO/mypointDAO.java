package com.DAO;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.VO.AnoCommentVO;
import com.VO.MemberVO;
import com.VO.MyChoiceVO;
import com.VO.MyPointVO;
import com.VO.SnsVO;

public class mypointDAO {

	// 공통
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
	
	
	// 찜 성공 데이터 입력
	public int insert_point(int article_seq, String member_id) {
	
		int cnt = 0;
		try {
			conn();

			String sql = "insert into mypoints(article_seq, success_date, member_id) values(?, SYSDATE, ?)";

			PreparedStatement psmt = conn.prepareStatement(sql);

			psmt.setInt(1, article_seq);
			psmt.setString(2, member_id);

			cnt = psmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
		
	}				
		
	// 찜 성공 인증 사진 데이터 입력
	public int insert_point(int article_seq, String success_pic1, String success_pic2, String success_pic3) {
	
		int cnt = 0;
		try {
			conn();

			String sql = "update mypoints set success_pic1=?, success_pic2=?, success_pic3=? where article_seq = ?";

			PreparedStatement psmt = conn.prepareStatement(sql);

			psmt.setString(1, success_pic1);
			psmt.setString(2, success_pic2);
			psmt.setString(3, success_pic3);
			psmt.setInt(4, article_seq);

			cnt = psmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
		
	}
	
	
	// 찜 성공 횟수 인한 포인트 계산	
	public ArrayList<MyPointVO> select_count_point(String member_id) {
		
		ArrayList<MyPointVO> num = new ArrayList<MyPointVO>(); // 찜 성공 횟수
		
		try {
			conn();
			
			String sql = "select article_seq from mypoints where member_id = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, member_id);

			rs = psmt.executeQuery();


			
			while(rs.next()) {
				int article_seq	= rs.getInt(1);	
            	
 		            		            	
				num.add(new MyPointVO(article_seq));
            }
			
		} catch (Exception e) {
			// 실행 후 오류가 발생했을 때 에러 출력
			e.printStackTrace();
		} finally {
			close();
		}
		
		
		return num;
	}
	
	
	// 찜 성공 사진 갯수로 인한 포인트 계산
	public int select_picture_point(String member_id) {		
		
		int b = 0; // 찜 성공 사진 갯수
		
		try {
			conn();

			for(int i = 1; i<4 ; i++) {
				String sql = String.format("select success_pic%s from mypoints where member_id = ? and success_pic%s is not null", i);
				psmt = conn.prepareStatement(sql);
				psmt.setString(1, member_id);

				rs = psmt.executeQuery();

				if (rs.next()) {
					b += 1;			
				}
			}
			
		} catch (Exception e) {
			// 실행 후 오류가 발생했을 때 에러 출력
			e.printStackTrace();
		} finally {
			close();
		}
		
		b *= 2;
				
		return b;
		
	}

	
	// 사진 데이터 가져오기
	public ArrayList<MyPointVO> select_picture(String member_id) {		
		
		ArrayList<MyPointVO> picture_list = new ArrayList<MyPointVO>();
		
		try {
			conn();

			for(int i = 1; i<4 ; i++) {
				String sql = String.format("select success_pic%s from mypoints where member_id = ? and success_pic%s is not null", i);
				psmt = conn.prepareStatement(sql);
				psmt.setString(1, member_id);

				while(rs.next()) {
	            	String success_pic1 = rs.getString(1);
	            	String success_pic2 = rs.getString(2);
	            	String success_pic3 = rs.getString(3);
	            		            		            	
	            	picture_list.add(new MyPointVO(success_pic1, success_pic2, success_pic3));
				}}
	            
				}catch(Exception e){
	            	e.printStackTrace();
	            }finally {
	            	close();
	            }
			
			return picture_list;		
			
		}	
	
	// 찜 성공 데이터 모두 불러오기
	public ArrayList<MyPointVO> select_all(String member_id) {
		
		ArrayList<MyPointVO> successList = new ArrayList<MyPointVO>();
		try {
			conn();

			for(int i = 1; i<4 ; i++) {
				String sql = String.format("select * from mypoints where member_id = ?");
				psmt = conn.prepareStatement(sql);
				int success_seq = rs.getInt(1);
				int article_seq = rs.getInt(2);
				Date success_date = rs.getDate(3);
				member_id = rs.getString(4);
				String success_pic1 = rs.getString(5);
				String success_pic2 = rs.getString(6);
				String success_pic3 = rs.getString(7);
				
				successList.add(new MyPointVO(success_seq, article_seq, success_date, member_id, success_pic1, success_pic2, success_pic3));
            }
            
            }catch(Exception e){
            	e.printStackTrace();
            }finally {
            	close();
            }
		
		return successList;
		
	}
	
	
	// 찜 성공한 물건 이름 모두 불러오기
	public ArrayList<SnsVO> select_my_choice(String member_id) {		
		
		ArrayList<SnsVO> success_company_name_list = new ArrayList<SnsVO>();

		try {
			conn();

			String sql = "select subject, pic1 from sns where article_seq in (select article_seq from mypoints where member_id = ?)";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, member_id);
			
			rs = psmt.executeQuery();

            while(rs.next()) {
            	String subject = rs.getString(1);
            	String pic1 = rs.getString(2);
            		            		            	
            	success_company_name_list.add(new SnsVO(subject, pic1));
            			}
            
            }catch(Exception e){
            	e.printStackTrace();
            }finally {
            	close();
            }
		
		return success_company_name_list;		
		
	}
	
	
}
