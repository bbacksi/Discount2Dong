package com.DAO;

import java.sql.Connection;

import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.VO.AnoCommentVO;
import com.VO.AnonymousVO;
import com.VO.CommentVO;
import com.VO.MemberVO;
import com.VO.SnsVO;

public class dbrDAO {

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

	public int write(String member_id,String ano_subject, String ano_content, String ano_pic1, String ano_pic2, String ano_pic3) {
		int cnt = 0;
		try {
			conn();
			//글제목 사진 1 2 3 이름 시간 글내용 댓글~~~ 이코드는 담벼락 글 작성하는 녀석입니다
			String sql = "insert into anonymous(member_id,ano_subject,ano_content,ano_pic1,ano_pic2,ano_pic3,ano_date) values(?, ?, ?, ?,?,?, SYSDATE)";

			PreparedStatement psmt = conn.prepareStatement(sql);

			
			psmt.setString(1, member_id);
			psmt.setString(2, ano_subject); //글제목
			psmt.setString(3, ano_content); //글내용
			psmt.setString(4, ano_pic1); //글사진
			psmt.setString(5, ano_pic2); //글사진
			psmt.setString(6, ano_pic3); //글사진
			
 //
			cnt = psmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	}
	
		
	
	public int edit(String ano_subject, String ano_content, int ano_seq) {
		
		int cnt = 0;
		
		try {
            conn();
             
            String sql = "update anonymous set ano_subject=?, ano_content=?,ano_date=SYSDATE where ano_seq = ?";
             		
			PreparedStatement psmt = conn.prepareStatement(sql);

			psmt.setString(1, ano_subject); //글제목
			psmt.setString(2, ano_content); //글내용
			psmt.setInt(3, ano_seq);
      
			
            cnt = psmt.executeUpdate();      	      
	         
	      } catch (Exception e) {
	         e.printStackTrace();
	      } finally {
	    	  close();
	      }
	      
		  return cnt;
		
	}
	
	
	
	
	public int delete(int ano_seq) {
		
		int cnt = 0;
		
		try {
            conn();

            String sql = "delete from anonymous where ano_seq = ?";
             		
            PreparedStatement psmt = conn.prepareStatement(sql);	          
			psmt.setInt(1, ano_seq);
                          
            cnt = psmt.executeUpdate();      	      
	         
	      } catch (Exception e) {
	         e.printStackTrace();
	      } finally {
	    	  close();
	      }
	      
		  return cnt;
		
	}
	
	
	public ArrayList<AnonymousVO> select_all_dbr(int ano_seq) {
		
		ArrayList<AnonymousVO> dbrList = new ArrayList<AnonymousVO>();

		try {
			
			conn();	               				
			String sql = "select * from anonymous where ano_seq=?";
			psmt = conn.prepareStatement(sql);
            psmt.setInt(1, ano_seq);               
            
            rs = psmt.executeQuery();
            
            while(rs.next()) {
            	           	
            	ano_seq = rs.getInt(1);
            	String member_id = rs.getString(2);
    			String ano_subject = rs.getString(3); 
    			String ano_content = rs.getString(4); 
    			String ano_pic1 = rs.getString(5); 
    			String ano_pic2 = rs.getString(6); 
    			String ano_pic3 = rs.getString(7); 
    			Date ano_date = rs.getDate(8);
            		            		            	
    		    dbrList.add(new AnonymousVO(ano_seq, member_id, ano_subject, ano_content, ano_pic1, ano_pic2, ano_pic3, ano_date));
            }
            
            }catch(Exception e){
            	e.printStackTrace();
            }finally {
            	close();
            }
		
		return dbrList;		
		
	}

	public ArrayList<AnonymousVO> match(String member_id) {
	
	ArrayList<AnonymousVO> dbr = new ArrayList<AnonymousVO>();

	try {
		
		conn();	               				
		String sql = "select * from anonymous where member_id=?";
		psmt = conn.prepareStatement(sql);
        psmt.setString(1, member_id);               
        
        rs = psmt.executeQuery();
        
        while(rs.next()) {
        	           	
        	int ano_seq = rs.getInt(1);
        	member_id = rs.getString(2);
			String ano_subject = rs.getString(3); 
			String ano_content = rs.getString(4); 
			String ano_pic1 = rs.getString(5); 
			String ano_pic2 = rs.getString(6); 
			String ano_pic3 = rs.getString(7); 
			Date ano_date = rs.getDate(8);
        		            		            	
			dbr.add(new AnonymousVO(ano_seq, member_id, ano_subject, ano_content, ano_pic1, ano_pic2, ano_pic3, ano_date));
        }
        
        }catch(Exception e){
        	e.printStackTrace();
        }finally {
        	close();
        }
	
	return dbr;		
	
}
	
	
		}
	


	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

