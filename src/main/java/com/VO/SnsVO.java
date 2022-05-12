package com.VO;

import java.sql.Date;

public class SnsVO {

	private int article_seq;
	private String member_id;
	private String subject;
	private String content;
	private String pic1;
	private String pic2;
	private String pic3;
	private int regular_price;
	private int discount_price;
	private int sale_price;
	private Date input_date;
	

	
	public SnsVO(int article_seq, String member_id, String subject, String content, String pic1, String pic2,
			String pic3, int regular_price, int discount_price, int sale_price, Date input_date) {
		super();
		this.article_seq = article_seq;
		this.member_id = member_id;
		this.subject = subject;
		this.content = content;
		this.pic1 = pic1;
		this.pic2 = pic2;
		this.pic3 = pic3;
		this.regular_price = regular_price;
		this.discount_price = discount_price;
		this.sale_price = sale_price;
		this.input_date = input_date;
	}
	
	public SnsVO(String member_id, String subject, String content, String pic1, String pic2, String pic3,
			int regular_price, int discount_price, int sale_price, Date input_date) {
		super();
		this.member_id = member_id;
		this.subject = subject;
		this.content = content;
		this.pic1 = pic1;
		this.pic2 = pic2;
		this.pic3 = pic3;
		this.regular_price = regular_price;
		this.discount_price = discount_price;
		this.sale_price = sale_price;
		this.input_date = input_date;
	}









	public SnsVO(String subject) {
		this.subject = subject;
	}

	public SnsVO(String subject, String pic1) {
		this.subject = subject;
		this.pic1 = pic1;
	}

	public int getArticle_seq() {
		return article_seq;
	}
	public void setArticle_seq(int article_seq) {
		this.article_seq = article_seq;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getPic1() {
		return pic1;
	}
	public void setPic1(String pic1) {
		this.pic1 = pic1;
	}
	public String getPic2() {
		return pic2;
	}
	public void setPic2(String pic2) {
		this.pic2 = pic2;
	}
	public String getPic3() {
		return pic3;
	}
	public void setPic3(String pic3) {
		this.pic3 = pic3;
	}
	public int getRegular_price() {
		return regular_price;
	}
	public void setRegular_price(int regular_price) {
		this.regular_price = regular_price;
	}
	public int getDiscount_price() {
		return discount_price;
	}
	public void setDiscount_price(int discount_price) {
		this.discount_price = discount_price;
	}
	public int getSale_price() {
		return sale_price;
	}
	public void setSale_price(int sale_price) {
		this.sale_price = sale_price;
	}
	public Date getInput_date() {
		return input_date;
	}
	public void setInput_date(Date input_date) {
		this.input_date = input_date;
	}
	
	
	
	
	
	
}
