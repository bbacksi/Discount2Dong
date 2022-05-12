package com.DAO;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.VO.CommentVO;
import com.VO.SnsVO;

public class commetDAO {

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
	
		
		// SNS 댓글 작성 데이터 입력
		public int insert_comment(String comment_content, int article_seq, String member_id) {
				
			int cnt = 0;
			try {
				conn();

				String sql = "insert into comments(comment_content, article_seq, comment_date, member_id) values(?, ?, SYSDATE, ?)";

				PreparedStatement psmt = conn.prepareStatement(sql);

				psmt.setString(1, comment_content);
				psmt.setInt(2, article_seq);
				psmt.setString(3, member_id);

				cnt = psmt.executeUpdate();

				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					close();
				}
				return cnt;	
					
			}		
		
		
		// SNS 댓글 수정
		public int update_comment(String comment_content, int comment_seq) {
					
			int cnt = 0;
					
			try {
				conn();
		            
		        String sql = "update comments set comment_content=?, comment_date=SYSDATE where comment_seq = ?";
			             		
			    psmt = conn.prepareStatement(sql);
			    psmt.setString(1, comment_content);
				psmt.setInt(2, comment_seq);						
			                          
			    cnt = psmt.executeUpdate();      	      
				         
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
				    close();
				}
				      
				return cnt;
					
			}		
		
		
		// SNS 댓글 삭제
		public int delete_comment(int comment_seq) {
			
			int cnt = 0;
			
			try {
	            conn();
	             
	            String sql = "delete * from sns where comment_seq = ?";
	             		
	            psmt = conn.prepareStatement(sql);	          
				psmt.setInt(1, comment_seq);
	                          
	            cnt = psmt.executeUpdate();      	      
		         
		      } catch (Exception e) {
		         e.printStackTrace();
		      } finally {
		    	  close();
		      }
		      
			  return cnt;
			
		}		
		
		
		// SNS 게시글에 달린 댓글만 선택
		public ArrayList<CommentVO> select_article_comment(int article_seq) {
			
			ArrayList<CommentVO> commentListArticle = new ArrayList<CommentVO>();

			try {
				
				conn();	               				
				String sql = "select * from comments A where article_seq = ?";
				psmt = conn.prepareStatement(sql);
	            psmt.setInt(1, article_seq);               
	            
	            rs = psmt.executeQuery();
	            
	            while(rs.next()) {
	            	int comment_seq = rs.getInt(1);
	            	String comment_content = rs.getString(2);
	            	article_seq= rs.getInt(3);
	            	Date comment_date = rs.getDate(4);
	            	String member_id = rs.getString(5);	            	
	            		            		            	
	            	commentListArticle.add(new CommentVO(comment_seq, comment_content, article_seq, comment_date, member_id));
	            }
	            
	            }catch(Exception e){
	            	e.printStackTrace();
	            }finally {
	            	close();
	            }
			
			return commentListArticle;		
			
		}
		
		
		// SNS 댓글 모아보기
		public ArrayList<CommentVO> select_market_comment(String member_id) {
			
			ArrayList<CommentVO> commentListMarket = new ArrayList<CommentVO>();

			try {
				
				conn();	               				
				String sql = "select * from comments A where A.article_seq in (select B.article_seq from sns B where B.member_id like ?)";

				psmt = conn.prepareStatement(sql);
	            psmt.setString(1, member_id);               
	            
	            rs = psmt.executeQuery();
	            
	            while(rs.next()) {
	            	int comment_seq = rs.getInt(1);
	            	String comment_content = rs.getString(2);
	            	int article_seq= rs.getInt(3);
	            	Date comment_date = rs.getDate(4);
	            	member_id = rs.getString(5);	            	
	            		            		            	
	            	commentListMarket.add(new CommentVO(comment_seq, comment_content, article_seq, comment_date, member_id));
	            }
	            
	            }catch(Exception e){
	            	e.printStackTrace();
	            }finally {
	            	close();
	            }
			
			return commentListMarket;		
			
		}		
		
		
}
