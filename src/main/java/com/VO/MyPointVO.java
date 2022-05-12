package com.VO;

import java.sql.Date;

public class MyPointVO {

	private int success_seq;
	private int article_seq;
	private Date date;
	private String member_id;
	private String success_pic1;
	private String success_pic2;
	private String success_pic3;
	
	
	
	
	
	
	public MyPointVO(int success_seq, int article_seq, Date date, String member_id, String success_pic1,
			String success_pic2, String success_pic3) {
		super();
		this.success_seq = success_seq;
		this.article_seq = article_seq;
		this.date = date;
		this.member_id = member_id;
		this.success_pic1 = success_pic1;
		this.success_pic2 = success_pic2;
		this.success_pic3 = success_pic3;
	}
	
	
	
	
	






	public MyPointVO(String success_pic12, String success_pic22, String success_pic32) {
		// TODO Auto-generated constructor stub
	}





	public MyPointVO(String subject) {
		// TODO Auto-generated constructor stub
	}






	public MyPointVO(int article_seq) {
		this.article_seq = article_seq;
	}











	public int getSuccess_seq() {
		return success_seq;
	}
	public void setSuccess_seq(int success_seq) {
		this.success_seq = success_seq;
	}
	public int getArticle_seq() {
		return article_seq;
	}
	public void setArticle_seq(int article_seq) {
		this.article_seq = article_seq;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getSuccess_pic1() {
		return success_pic1;
	}
	public void setSuccess_pic1(String success_pic1) {
		this.success_pic1 = success_pic1;
	}
	public String getSuccess_pic2() {
		return success_pic2;
	}
	public void setSuccess_pic2(String success_pic2) {
		this.success_pic2 = success_pic2;
	}
	public String getSuccess_pic3() {
		return success_pic3;
	}
	public void setSuccess_pic3(String success_pic3) {
		this.success_pic3 = success_pic3;
	}
	
	
}
