package com.VO;

import java.sql.Date;

public class AnonymousVO {

	private int ano_seq;
	private String member_id;
	private String ano_subject;
	private String ano_content;
	private String ano_pic1;
	private String ano_pic2;
	private String ano_pic3;
	private Date date;
	
	public AnonymousVO(int ano_seq, String member_id, String ano_subject, String ano_content, String ano_pic1,
			String ano_pic2, String ano_pic3, Date date) {
		super();
		this.ano_seq = ano_seq;
		this.member_id = member_id;
		this.ano_subject = ano_subject;
		this.ano_content = ano_content;
		this.ano_pic1 = ano_pic1;
		this.ano_pic2 = ano_pic2;
		this.ano_pic3 = ano_pic3;
		this.date = date;
	}
	
	public int getAno_seq() {
		return ano_seq;
	}
	public void setAno_seq(int ano_seq) {
		this.ano_seq = ano_seq;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getAno_subject() {
		return ano_subject;
	}
	public void setAno_subject(String ano_subject) {
		this.ano_subject = ano_subject;
	}
	public String getAno_content() {
		return ano_content;
	}
	public void setAno_content(String ano_content) {
		this.ano_content = ano_content;
	}
	public String getAno_pic1() {
		return ano_pic1;
	}
	public void setAno_pic1(String ano_pic1) {
		this.ano_pic1 = ano_pic1;
	}
	public String getAno_pic2() {
		return ano_pic2;
	}
	public void setAno_pic2(String ano_pic2) {
		this.ano_pic2 = ano_pic2;
	}
	public String getAno_pic3() {
		return ano_pic3;
	}
	public void setAno_pic3(String ano_pic3) {
		this.ano_pic3 = ano_pic3;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	
}
