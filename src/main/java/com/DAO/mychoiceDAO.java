package com.DAO;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.VO.MyChoiceVO;
import com.VO.SnsVO;

public class mychoiceDAO {

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
	
	
	// 찜했을 때 - insert
	public int insert_choice(int article_seq, String member_id) {
	
		int cnt = 0;
		try {
			conn();

			String sql = "insert into mychoices(article_seq, choice_date, member_id) values(?, SYSDATE, ?)";

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
	
	
	// 찜 삭제 (판매완료 또는 찜 취소) - delete
	public int delete_choice(int choice_seq) {
		
		int cnt = 0;
		
		try {
            conn();
             
            String sql = "delete * from mychoices where choice_seq = ?";
             		
            psmt = conn.prepareStatement(sql);	          
			psmt.setInt(1, choice_seq);
                          
            cnt = psmt.executeUpdate();      	      
	         
	      } catch (Exception e) {
	         e.printStackTrace();
	      } finally {
	    	  close();
	      }
	      
		  return cnt;
		
	}	
	
	
	// 찜한 사람 수 - update
	public int select_choice_number(int choice_seq) {		
		
		int a = 0; // 찜 성공 사진 갯수
		
		try {
			conn();

			String sql = String.format("select member_id from mychoices where article_seq = ?");
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, choice_seq);

				rs = psmt.executeQuery();

				while(rs.next()) {
					a += 1;
				}
				/*
				 * if (rs.next()) { a += 1; }
				 */
			
		} catch (Exception e) {
			// 실행 후 오류가 발생했을 때 에러 출력
			e.printStackTrace();
		} finally {
			close();
		}

				
		return a;
		
	}	
	
	
	// 내 찜
	public ArrayList<SnsVO> select_my_choice(String member_id) {		
		
		ArrayList<SnsVO> company_name_list = new ArrayList<SnsVO>();

		try {
			conn();

			String sql = "select subject from sns where article_seq in (select article_seq from mychoices where member_id = ?)";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, member_id);
            
			rs = psmt.executeQuery();

            while(rs.next()) {
            	String subject = rs.getString(1);
            		            		            	
            	company_name_list.add(new SnsVO(subject));
            			}
            
            }catch(Exception e){
            	e.printStackTrace();
            }finally {
            	close();
            }
		
		return company_name_list;		
		
	}
	
	
	
}
