package com.DAO;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.VO.MemberVO;
import com.VO.SnsVO;

public class snsDAO {

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
		
		
		// SNS 작성 데이터 입력
		public int insert_sns(String member_id, String subject, String content, String pic1, String pic2, String pic3, int regular_price, int discount_price, int sale_price, Date input_date) {
		
			int cnt = 0;
			try {
				conn();

				String sql = "insert into sns(member_id, subject, content, pic1, pic2, pic3, regular_price, discount_price, sale_price, input_date) values(?, ?, ?, ?, ?, ?, ?, ?, ?, SYSDATE)";

				PreparedStatement psmt = conn.prepareStatement(sql);

				psmt.setString(1, member_id);
				psmt.setString(2, subject);
				psmt.setString(3, content);
				psmt.setString(4, pic1);
				psmt.setString(5, pic2);
				psmt.setString(6, pic3);
				psmt.setInt(7, regular_price);
				psmt.setInt(8, discount_price);
				psmt.setInt(9, sale_price);

				cnt = psmt.executeUpdate();
				System.out.println(cnt);
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				close();
			}
			return cnt;	
			
		}
		
		
		// SNS 수정
		public int update_sns(int article_seq, String subject, String content, int regular_price, int discount_price, int sale_price) {
			
			int cnt = 0;
			
			try {
	            conn();
	             
	            String sql = "update sns set subject=?, content=?, regular_price=?, discount_price=?, sale_price=?, input_date=SYSDATE where article_seq = ?";
	             		
	            psmt = conn.prepareStatement(sql);
	            psmt.setString(1, subject);
				psmt.setString(2, content);
				psmt.setInt(3, regular_price);
				psmt.setInt(4, discount_price);
				psmt.setInt(5, sale_price);
				psmt.setInt(6, article_seq);
	                          
	            cnt = psmt.executeUpdate();      	      
		         
		      } catch (Exception e) {
		         e.printStackTrace();
		      } finally {
		    	  close();
		      }
		      
			  return cnt;
			
		}


		// SNS 삭제
		public int delete_sns(int article_seq) {
			
			int cnt = 0;
			
			try {
	            conn();
	             
	            String sql = "delete from sns where article_seq = ?";
	             		
	            psmt = conn.prepareStatement(sql);	          
				psmt.setInt(1, article_seq);
	                          
	            cnt = psmt.executeUpdate();      	      
		         
		      } catch (Exception e) {
		         e.printStackTrace();
		      } finally {
		    	  close();
		      }
		      
			  return cnt;
			
		}

		
		// 동네 이름 기준으로 모든 SNS 불러오기
		public ArrayList<SnsVO> select_all_sns(String town) {
			
			ArrayList<SnsVO> snsList = new ArrayList<SnsVO>();

			try {
				
				conn();	               				
				String sql = "select * from sns A where member_id in (select member_id from members B where company_info = '%?%' and A.member_id = B.member_id group by member_id)";
				psmt = conn.prepareStatement(sql);
	            psmt.setString(1, town);               
	            
	            rs = psmt.executeQuery();
	            
	            while(rs.next()) {
	            	int article_seq = rs.getInt(1);
	            	String member_id = rs.getString(2);
	            	String subject = rs.getString(3);
	            	String content = rs.getString(4);
	            	String pic1 = rs.getString(5);
	            	String pic2 = rs.getString(6);
	            	String pic3 = rs.getString(7);
	            	int regular_price = rs.getInt(8);
	            	int discount_price = rs.getInt(9);
	            	int sale_price = rs.getInt(10);
	            	Date input_date = rs.getDate(11);
	            		            		            	
	            	snsList.add(new SnsVO(article_seq, member_id, subject, content, pic1, pic2, pic3, regular_price, discount_price, sale_price, input_date));
	            }
	            
	            }catch(Exception e){
	            	e.printStackTrace();
	            }finally {
	            	close();
	            }
			
			return snsList;		
			
		}
		
		
		// 한 가게의 SNS만 불러오기
		public ArrayList<SnsVO> select_market_sns(String member_id) {
			
			ArrayList<SnsVO> oneSnsList = new ArrayList<SnsVO>();

			try {
				
				conn();	               				
				String sql = "select * from sns where member_id = ?";
				psmt = conn.prepareStatement(sql);
	            psmt.setString(1, member_id);               
	            
	            rs = psmt.executeQuery();
	            
	            while(rs.next()) {
	            	int article_seq = rs.getInt(1);
	            	member_id = rs.getString(2);
	            	String subject = rs.getString(3);
	            	String content = rs.getString(4);
	            	String pic1 = rs.getString(5);
	            	String pic2 = rs.getString(6);
	            	String pic3 = rs.getString(7);
	            	int regular_price = rs.getInt(8);
	            	int discount_price = rs.getInt(9);
	            	int sale_price = rs.getInt(10);
	            	Date input_date = rs.getDate(11);
	            		            		            	
	            	oneSnsList.add(new SnsVO(article_seq, member_id, subject, content, pic1, pic2, pic3, regular_price, discount_price, sale_price, input_date));
	            }
	            
	            }catch(Exception e){
	            	e.printStackTrace();
	            }finally {
	            	close();
	            }
			
			return oneSnsList;		
			
		}
		
		
		// 랜덤 가게의 최신 SNS만 불러오기
		public ArrayList<SnsVO> select_random_sns() {
			
			ArrayList<SnsVO> randomSnsList = new ArrayList<SnsVO>();

			try {
				
				conn();	               				
				String sql = "select * from sns where article_seq is not null order by article_seq desc";
				psmt = conn.prepareStatement(sql);
	            
	            rs = psmt.executeQuery();
	            
	            while(rs.next()) {
	            	int article_seq = rs.getInt(1);
	            	String member_id = rs.getString(2);
	            	String subject = rs.getString(3);
	            	String content = rs.getString(4);
	            	String pic1 = rs.getString(5);
	            	String pic2 = rs.getString(6);
	            	String pic3 = rs.getString(7);
	            	int regular_price = rs.getInt(8);
	            	int discount_price = rs.getInt(9);
	            	int sale_price = rs.getInt(10);
	            	Date input_date = rs.getDate(11);
	            		            		            	
	            	randomSnsList.add(new SnsVO(article_seq, member_id, subject, content, pic1, pic2, pic3, regular_price, discount_price, sale_price, input_date));
	            }
	            
	            }catch(Exception e){
	            	e.printStackTrace();
	            }finally {
	            	close();
	            }
			
			return randomSnsList;		
			
		}		
        
		
		//검색기능
		public ArrayList<SnsVO> search(String want) {
			
			ArrayList<SnsVO> searchList = new ArrayList<SnsVO>();
			
			try {
				
				conn();	               				
				String sql = "select * from sns A where member_id in (select member_id from members B where company_info like ? and A.member_id = B.member_id group by member_id) or A.subject like ?";
				psmt = conn.prepareStatement(sql);
				psmt.setString(1, "%"+want+"%");               
				psmt.setString(2, "%"+want+"%");               
				
				rs = psmt.executeQuery();
				
				while(rs.next()) {
					/* System.out.println("가져와짐:"+rs.getInt(1)); */
					int article_seq = rs.getInt(1);
					String member_id = rs.getString(2);
					want = rs.getString(3);
					String content = rs.getString(4);
					String pic1 = rs.getString(5);
					String pic2 = rs.getString(6);
					String pic3 = rs.getString(7);
					int regular_price = rs.getInt(8);
					int discount_price = rs.getInt(9);
					int sale_price = rs.getInt(10);
					Date input_date = rs.getDate(11);	
					
					searchList.add(new SnsVO(article_seq, member_id, want, content, pic1, pic2, pic3, regular_price, discount_price, sale_price, input_date));
				}
				
			}catch(Exception e){
				e.printStackTrace();
			}finally {
				close();
			}
			
			
			return searchList;
			
		}
		
		//SNS페이지 표시를 위한 기능	
				public ArrayList<SnsVO> sns_real(int idx) {
					
					ArrayList<SnsVO> oneSnsList = new ArrayList<SnsVO>();

					try {
						
						conn();	               				
						String sql = "select * from sns where article_seq = ?";
						psmt = conn.prepareStatement(sql);
			            psmt.setInt(1, idx);               
			            
			            rs = psmt.executeQuery();
			            
			            while(rs.next()) {
			            	idx  = rs.getInt(1);
			            	String member_id = rs.getString(2);
			            	String subject = rs.getString(3);
			            	String content = rs.getString(4);
			            	String pic1 = rs.getString(5);
			            	String pic2 = rs.getString(6);
			            	String pic3 = rs.getString(7);
			            	int regular_price = rs.getInt(8);
			            	int discount_price = rs.getInt(9);
			            	int sale_price = rs.getInt(10);
			            	Date input_date = rs.getDate(11);
			            		            		            	
			            	oneSnsList.add(new SnsVO(idx, member_id, subject, content, pic1, pic2, pic3, regular_price, discount_price, sale_price, input_date));
			            }
			            
			            }catch(Exception e){
			            	e.printStackTrace();
			            }finally {
			            	close();
			            }
					
					return oneSnsList;		
					
				}
				
				public ArrayList<MemberVO> sns_member(String sns_member_id) {
					
					ArrayList<MemberVO> memList = new ArrayList<MemberVO>();
					
					try {
						
						conn();	               				
						String sql = "select * from members where member_id = ?";
						psmt = conn.prepareStatement(sql);
						psmt.setString(1, sns_member_id);               
						
						rs = psmt.executeQuery();
						
						while(rs.next()) {
							sns_member_id = rs.getString(1);
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

						
							memList.add(new MemberVO(sns_member_id, pw, name, birth_date, nickname, email, phone, member_type, company_name,
									company_bn, b_type, company_pic1, company_pic2, company_pic3, company_info));
						}
						
					}catch(Exception e){
						e.printStackTrace();
					}finally {
						close();
					}
					
					return memList;		
					
				}
				
				
				
				public int sold_sns(String subject, int article_seq) {
					int cnt = 0;
					
					try {
			            conn();
			             
			            String sql = "update sns set subject = ? where article_seq = ?";
			             	
			            psmt = conn.prepareStatement(sql);
						psmt.setString(1, subject);
						psmt.setInt(2, article_seq);
						
			            cnt = psmt.executeUpdate();      	      

			            
				      } catch (Exception e) {
				         e.printStackTrace();
				      } finally {
				    	  close();
				      }
				      
					  return cnt;
					
				}
				
				
				
}
