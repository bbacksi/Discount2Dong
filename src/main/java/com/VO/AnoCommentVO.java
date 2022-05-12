package com.VO;

import java.sql.Date;

public class AnoCommentVO {

	private int anocom_seq;
	private String anocom_content;
	private int ano_seq;
	private Date date;
	private String member_id;
	
	
	
	public AnoCommentVO(int anocom_seq, String anocom_content, int ano_seq, Date date, String member_id) {
		super();
		this.anocom_seq = anocom_seq;
		this.anocom_content = anocom_content;
		this.ano_seq = ano_seq;
		this.date = date;
		this.member_id = member_id;
	}
	public int getAnocom_seq() {
		return anocom_seq;
	}
	public void setAnocom_seq(int anocom_seq) {
		this.anocom_seq = anocom_seq;
	}
	public String getAnocom_content() {
		return anocom_content;
	}
	public void setAnocom_content(String anocom_content) {
		this.anocom_content = anocom_content;
	}
	public int getAno_seq() {
		return ano_seq;
	}
	public void setAno_seq(int ano_seq) {
		this.ano_seq = ano_seq;
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
	
	
	
	
}
