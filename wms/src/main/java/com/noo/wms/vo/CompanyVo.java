package com.noo.wms.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class CompanyVo {

	private String company_code;
	private String company_name;
	private int company_registration_number;
	private int company_corporate_registration_number;
	private String company_representative;
	private int company_phone;
	private int company_pax_number;
	private String company_email;
	private String company_email_tax;
	private int company_post_number;
	private String company_address;
	private String company_address_detail;
	private String company_rogo;
	private String company_wallpaper;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date company_registration;
	private String company_memo;
	

	public CompanyVo() {
		super();
	}


	public CompanyVo(String company_code, String company_name, int company_registration_number,
			int company_corporate_registration_number, String company_representative, int company_phone,
			int company_pax_number, String company_email, String company_email_tax, int company_post_number,
			String company_address, String company_address_detail, String company_rogo, String company_wallpaper,
			Date company_registration, String company_memo) {
		super();
		this.company_code = company_code;
		this.company_name = company_name;
		this.company_registration_number = company_registration_number;
		this.company_corporate_registration_number = company_corporate_registration_number;
		this.company_representative = company_representative;
		this.company_phone = company_phone;
		this.company_pax_number = company_pax_number;
		this.company_email = company_email;
		this.company_email_tax = company_email_tax;
		this.company_post_number = company_post_number;
		this.company_address = company_address;
		this.company_address_detail = company_address_detail;
		this.company_rogo = company_rogo;
		this.company_wallpaper = company_wallpaper;
		this.company_registration = company_registration;
		this.company_memo = company_memo;
	}


	public String getCompany_code() {
		return company_code;
	}


	public void setCompany_code(String company_code) {
		this.company_code = company_code;
	}


	public String getCompany_name() {
		return company_name;
	}


	public void setCompany_name(String company_name) {
		this.company_name = company_name;
	}


	public int getCompany_registration_number() {
		return company_registration_number;
	}


	public void setCompany_registration_number(int company_registration_number) {
		this.company_registration_number = company_registration_number;
	}


	public int getCompany_corporate_registration_number() {
		return company_corporate_registration_number;
	}


	public void setCompany_corporate_registration_number(int company_corporate_registration_number) {
		this.company_corporate_registration_number = company_corporate_registration_number;
	}


	public String getCompany_representative() {
		return company_representative;
	}


	public void setCompany_representative(String company_representative) {
		this.company_representative = company_representative;
	}


	public int getCompany_phone() {
		return company_phone;
	}


	public void setCompany_phone(int company_phone) {
		this.company_phone = company_phone;
	}


	public int getCompany_pax_number() {
		return company_pax_number;
	}


	public void setCompany_pax_number(int company_pax_number) {
		this.company_pax_number = company_pax_number;
	}


	public String getCompany_email() {
		return company_email;
	}


	public void setCompany_email(String company_email) {
		this.company_email = company_email;
	}


	public String getCompany_email_tax() {
		return company_email_tax;
	}


	public void setCompany_email_tax(String company_email_tax) {
		this.company_email_tax = company_email_tax;
	}


	public int getCompany_post_number() {
		return company_post_number;
	}


	public void setCompany_post_number(int company_post_number) {
		this.company_post_number = company_post_number;
	}


	public String getCompany_address() {
		return company_address;
	}


	public void setCompany_address(String company_address) {
		this.company_address = company_address;
	}


	public String getCompany_address_detail() {
		return company_address_detail;
	}


	public void setCompany_address_detail(String company_address_detail) {
		this.company_address_detail = company_address_detail;
	}


	public String getCompany_rogo() {
		return company_rogo;
	}


	public void setCompany_rogo(String company_rogo) {
		this.company_rogo = company_rogo;
	}


	public String getCompany_wallpaper() {
		return company_wallpaper;
	}


	public void setCompany_wallpaper(String company_wallpaper) {
		this.company_wallpaper = company_wallpaper;
	}


	public Date getCompany_registration() {
		return company_registration;
	}


	public void setCompany_registration(Date company_registration) {
		this.company_registration = company_registration;
	}


	public String getCompany_memo() {
		return company_memo;
	}


	public void setCompany_memo(String company_memo) {
		this.company_memo = company_memo;
	}

	
}
