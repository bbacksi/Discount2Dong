package com.VO;

import java.sql.Date;

public class MemberVO {
      private String member_id;
      private String member_pw;
      private String name;
      private String birth_date;
      private String nickname;
      private String email;
      private String phone;
      private String member_type;
      private String company_name;
      private String company_bn;
      private String b_type;
      private String company_pic1;
      private String company_pic2;
      
      private String company_pic3;//
      private String company_info;
    
      
      public MemberVO(String member_id, String member_pw, String name, String birth_date, String nickname, String email,
         String phone, String member_type, String company_name, String company_bn, String b_type,
         String company_pic1, String company_pic2, String company_pic3, String company_info) {
      super();
      this.member_id = member_id;
      this.member_pw = member_pw;
      this.name = name;
      this.birth_date = birth_date;
      this.nickname = nickname;
      this.email = email;
      this.phone = phone;
      this.member_type = member_type;
      this.company_name = company_name;
      this.company_bn = company_bn;
      this.b_type = b_type;
      this.company_pic1 = company_pic1;
      this.company_pic2 = company_pic2;
      this.company_pic3 = company_pic3;
      this.company_info = company_info;
   }
      
      
   public MemberVO(String company_info) {
		// TODO Auto-generated constructor stub
	   this.company_info = company_info;
	}


public String getMember_id() {
      return member_id;
   }
   public void setMember_id(String member_id) {
      this.member_id = member_id;
   }
   public String getMember_pw() {
      return member_pw;
   }
   public void setMember_pw1(String member_pw) {
      this.member_pw = member_pw;
   }
   public String getName() {
      return name;
   }
   public void setName(String name) {
      this.name = name;
   }
   public String getBirth_date() {
      return birth_date;
   }
   public void setBirth_date(String birth_date) {
      this.birth_date = birth_date;
   }
   public String getNickname() {
      return nickname;
   }
   public void setNickname(String nickname) {
      this.nickname = nickname;
   }
   public String getEmail() {
      return email;
   }
   public void setEmail(String email) {
      this.email = email;
   }
   public String getPhone() {
      return phone;
   }
   public void setPhone(String phone) {
      this.phone = phone;
   }
   public String getMember_type() {
      return member_type;
   }
   public void setMember_type(String member_type) {
      this.member_type = member_type;
   }
   public String getCompany_name() {
      return company_name;
   }
   public void setCompany_name(String company_name) {
      this.company_name = company_name;
   }
   public String getCompany_bn() {
      return company_bn;
   }
   public void setCompany_bn(String company_bn) {
      this.company_bn = company_bn;
   }
   public String getB_type() {
      return b_type;
   }
   public void setB_type(String b_type) {
      this.b_type = b_type;
   }
   public String getCompany_pic1() {
      return company_pic1;
   }
   public void setCompany_pic1(String company_pic1) {
      this.company_pic1 = company_pic1;
   }
   public String getCompany_pic2() {
      return company_pic2;
   }
   public void setCompany_pic2(String company_pic2) {
      this.company_pic2 = company_pic2;
   }
   public String getCompany_pic3() {
      return company_pic3;
   }
   public void setCompany_pic3(String company_pic3) {
      this.company_pic3 = company_pic3;
   }
   public String getCompany_info() {
      return company_info;
   }
   public void setCompany_info(String company_info) {
      this.company_info = company_info;
   }

}