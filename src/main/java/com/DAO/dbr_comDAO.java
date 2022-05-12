package com.DAO;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.VO.AnoCommentVO;
import com.VO.AnonymousVO;
import com.VO.MemberVO;

public class dbr_comDAO {

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

		
	public int write_com(String anocom_content,int ano_seq,String member_id) {
		int cnt = 0;
		try {
			conn(); 
			//글제목 사진 1 2 3 이름 시간 글내용 댓글~~~ 이코드는 담벼락 글 작성하는 녀석입니다
			String sql = "insert into anocomments(anocom_content,ano_seq,anocom_date,member_id) values(?,?,SYSDATE,?)";

			PreparedStatement psmt = conn.prepareStatement(sql);

			
			
			psmt.setString(1, anocom_content); //글내용
			psmt.setInt(2, ano_seq);
			psmt.setString(3, member_id); //글내용
			
			

			cnt = psmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	}
	
	
		
	public int edit_com(String anocom_content) {
		int cnt = 0;
		try {
			conn();
			//글제목 사진 1 2 3 이름 시간 글내용 댓글~~~ 이코드는 담벼락 글 작성하는 녀석입니다
			String sql = "update anocomments set(anocom_content,anocome_date) values(?, SYSDATE)";

			PreparedStatement psmt = conn.prepareStatement(sql);

			
			
			psmt.setString(1, anocom_content); //글내용
			
			

			cnt = psmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	}

	
	
		
	public int delete_com(int anocom_seq) {
		
		int cnt = 0;
		
		try {
            conn();
             
            String sql = "delete from anocom_content where anocom_seq = ?";
             		
            psmt = conn.prepareStatement(sql);	          
			psmt.setInt(1, anocom_seq);
                          
            cnt = psmt.executeUpdate();      	      
	         
	      } catch (Exception e) {
	         e.printStackTrace();
	      } finally {
	    	  close();
	      }
	      
		  return cnt;
		
	}
	
	public ArrayList<AnoCommentVO> select_all_comdbr(int ano_seq) {
		
		ArrayList<AnoCommentVO> anoList = new ArrayList<AnoCommentVO>();

		try {
			
			conn();	               				
			String sql = "select * from anocomments where ano_seq=?";
			psmt = conn.prepareStatement(sql);
            psmt.setInt(1, ano_seq);               
            
            rs = psmt.executeQuery();
            
            while(rs.next()) {
            	
            	
            	int anocom_seq = rs.getInt(1);
            	String anocom_content = rs.getString(2); //글내용
            	ano_seq = rs.getInt(3);
            	Date anocom_date = rs.getDate(4);
            	String member_id = rs.getString(5);
    		    
            		            		            	
            	anoList.add(new AnoCommentVO(anocom_seq, anocom_content, ano_seq, anocom_date, member_id));
            }
            
            }catch(Exception e){
            	e.printStackTrace();
            }finally {
            	close();
            }
		
		return anoList;		
		
	}



	
	
	
	
	
	
	
	
}
	
	
	
	
	
	
	
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

