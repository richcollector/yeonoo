package com.noo.wms.vo;

import java.util.Date;

public class MailAuthVo {
	private String auth_code;
	private String employee_code;
	private String auth_key;
	private String auth_complete;
	private Date auth_date;
	public MailAuthVo() {
		super();
	}
	public MailAuthVo(String auth_code, String employee_code, String auth_key, String auth_complete, Date auth_date) {
		super();
		this.auth_code = auth_code;
		this.employee_code = employee_code;
		this.auth_key = auth_key;
		this.auth_complete = auth_complete;
		this.auth_date = auth_date;
	}
	public String getAuth_code() {
		return auth_code;
	}
	public void setAuth_code(String auth_code) {
		this.auth_code = auth_code;
	}
	public String getEmployee_code() {
		return employee_code;
	}
	public void setEmployee_code(String employee_code) {
		this.employee_code = employee_code;
	}
	public String getAuth_key() {
		return auth_key;
	}
	public void setAuth_key(String auth_key) {
		this.auth_key = auth_key;
	}
	public String getAuth_complete() {
		return auth_complete;
	}
	public void setAuth_complete(String auth_complete) {
		this.auth_complete = auth_complete;
	}
	public Date getAuth_date() {
		return auth_date;
	}
	public void setAuth_date(Date auth_date) {
		this.auth_date = auth_date;
	}
	
	
}
