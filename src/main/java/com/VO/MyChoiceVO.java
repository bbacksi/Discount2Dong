package com.VO;

import java.sql.Date;

public class MyChoiceVO {

	private int choice_seq; 
	private int article_seq; 
	private Date choice_date; 
	private String member_id;
	
	
	
	
	
	
	public MyChoiceVO(int choice_seq, int article_seq, Date choice_date, String member_id) {
		super();
		this.choice_seq = choice_seq;
		this.article_seq = article_seq;
		this.choice_date = choice_date;
		this.member_id = member_id;
	}
	
	
	
	
	
	public MyChoiceVO() {
		// TODO Auto-generated constructor stub
	}

	public MyChoiceVO(int article_seq) {
		this.article_seq = article_seq;
	}



	public MyChoiceVO(String subject) {
		// TODO Auto-generated constructor stub
	}





	public int getChoice_seq() {
		return choice_seq;
	}
	public void setChoice_seq(int choice_seq) {
		this.choice_seq = choice_seq;
	}
	public int getArticle_seq() {
		return article_seq;
	}
	public void setArticle_seq(int article_seq) {
		this.article_seq = article_seq;
	}
	public Date getChoice_date() {
		return choice_date;
	}
	public void setChoice_date(Date choice_date) {
		this.choice_date = choice_date;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}





	public void add(MyChoiceVO myChoiceVO) {
		// TODO Auto-generated method stub
		
	} 
	
	
	
}
