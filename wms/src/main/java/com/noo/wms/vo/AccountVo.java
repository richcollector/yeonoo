package com.noo.wms.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class AccountVo {
	private String account_code;
	private String account_name;
	private String account_registration_number;
	private String account_corporate_registration_number;
	private String account_representative;
	private String account_phone;
	private String account_pax_number;
	private String account_email;
	private String account_email_tax;
	private int account_post_number;
	private String account_address;
	private String account_address_detail;
	private String account_category;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date account_registration;
	private String account_memo;
	private String account_registration_jpg;
	
	public AccountVo() {
		super();
	}

	public AccountVo(String account_code, String account_name, String account_registration_number,
			String account_corporate_registration_number, String account_representative, String account_phone,
			String account_pax_number, String account_email, String account_email_tax, int account_post_number,
			String account_address, String account_address_detail, String account_category, Date account_registration,
			String account_memo, String account_registration_jpg) {
		super();
		this.account_code = account_code;
		this.account_name = account_name;
		this.account_registration_number = account_registration_number;
		this.account_corporate_registration_number = account_corporate_registration_number;
		this.account_representative = account_representative;
		this.account_phone = account_phone;
		this.account_pax_number = account_pax_number;
		this.account_email = account_email;
		this.account_email_tax = account_email_tax;
		this.account_post_number = account_post_number;
		this.account_address = account_address;
		this.account_address_detail = account_address_detail;
		this.account_category = account_category;
		this.account_registration = account_registration;
		this.account_memo = account_memo;
		this.account_registration_jpg = account_registration_jpg;
	}

	public String getAccount_code() {
		return account_code;
	}

	public void setAccount_code(String account_code) {
		this.account_code = account_code;
	}

	public String getAccount_name() {
		return account_name;
	}

	public void setAccount_name(String account_name) {
		this.account_name = account_name;
	}

	public String getAccount_registration_number() {
		return account_registration_number;
	}

	public void setAccount_registration_number(String account_registration_number) {
		this.account_registration_number = account_registration_number;
	}

	public String getAccount_corporate_registration_number() {
		return account_corporate_registration_number;
	}

	public void setAccount_corporate_registration_number(String account_corporate_registration_number) {
		this.account_corporate_registration_number = account_corporate_registration_number;
	}

	public String getAccount_representative() {
		return account_representative;
	}

	public void setAccount_representative(String account_representative) {
		this.account_representative = account_representative;
	}

	public String getAccount_phone() {
		return account_phone;
	}

	public void setAccount_phone(String account_phone) {
		this.account_phone = account_phone;
	}

	public String getAccount_pax_number() {
		return account_pax_number;
	}

	public void setAccount_pax_number(String account_pax_number) {
		this.account_pax_number = account_pax_number;
	}

	public String getAccount_email() {
		return account_email;
	}

	public void setAccount_email(String account_email) {
		this.account_email = account_email;
	}

	public String getAccount_email_tax() {
		return account_email_tax;
	}

	public void setAccount_email_tax(String account_email_tax) {
		this.account_email_tax = account_email_tax;
	}

	public int getAccount_post_number() {
		return account_post_number;
	}

	public void setAccount_post_number(int account_post_number) {
		this.account_post_number = account_post_number;
	}

	public String getAccount_address() {
		return account_address;
	}

	public void setAccount_address(String account_address) {
		this.account_address = account_address;
	}

	public String getAccount_address_detail() {
		return account_address_detail;
	}

	public void setAccount_address_detail(String account_address_detail) {
		this.account_address_detail = account_address_detail;
	}

	public String getAccount_category() {
		return account_category;
	}

	public void setAccount_category(String account_category) {
		this.account_category = account_category;
	}

	public Date getAccount_registration() {
		return account_registration;
	}

	public void setAccount_registration(Date account_registration) {
		this.account_registration = account_registration;
	}

	public String getAccount_memo() {
		return account_memo;
	}

	public void setAccount_memo(String account_memo) {
		this.account_memo = account_memo;
	}

	public String getAccount_registration_jpg() {
		return account_registration_jpg;
	}

	public void setAccount_registration_jpg(String account_registration_jpg) {
		this.account_registration_jpg = account_registration_jpg;
	}
	
	
	
	
	
	
}
