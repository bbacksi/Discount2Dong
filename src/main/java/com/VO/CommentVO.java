package com.VO;

import java.sql.Date;

public class CommentVO {

	private int comment_seq;
	private String comment_content;
	private int article_seq;
	private Date comment_date;
	private String member_id;
	
	
	
	
	public CommentVO(int comment_seq, String comment_content, int article_seq, Date comment_date, String member_id) {
		super();
		this.comment_seq = comment_seq;
		this.comment_content = comment_content;
		this.article_seq = article_seq;
		this.comment_date = comment_date;
		this.member_id = member_id;
	}
	
	
	
	public int getComment_seq() {
		return comment_seq;
	}
	public void setComment_seq(int comment_seq) {
		this.comment_seq = comment_seq;
	}
	public String getComment_content() {
		return comment_content;
	}
	public void setComment_content(String comment_content) {
		this.comment_content = comment_content;
	}
	public int getArticle_seq() {
		return article_seq;
	}
	public void setArticle_seq(int article_seq) {
		this.article_seq = article_seq;
	}
	public Date getComment_date() {
		return comment_date;
	}
	public void setComment_date(Date comment_date) {
		this.comment_date = comment_date;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	
	
	
	
}
