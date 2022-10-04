package com.noo.wms.vo;

public class AdminVo {
	private String admin_code;
	private String company_code;
	private String authority_code;
	private String admin_email;
	private String admin_password;
	public AdminVo() {
		super();
	}
	public AdminVo(String admin_code, String company_code, String authority_code, String admin_email,
			String admin_password) {
		super();
		this.admin_code = admin_code;
		this.company_code = company_code;
		this.authority_code = authority_code;
		this.admin_email = admin_email;
		this.admin_password = admin_password;
	}
	public String getAdmin_code() {
		return admin_code;
	}
	public void setAdmin_code(String admin_code) {
		this.admin_code = admin_code;
	}
	public String getCompany_code() {
		return company_code;
	}
	public void setCompany_code(String company_code) {
		this.company_code = company_code;
	}
	public String getAuthority_code() {
		return authority_code;
	}
	public void setAuthority_code(String authority_code) {
		this.authority_code = authority_code;
	}
	public String getAdmin_email() {
		return admin_email;
	}
	public void setAdmin_email(String admin_email) {
		this.admin_email = admin_email;
	}
	public String getAdmin_password() {
		return admin_password;
	}
	public void setAdmin_password(String admin_password) {
		this.admin_password = admin_password;
	}
	
	
}
