package com.noo.wms.vo;

public class PasswordAuthVo {

	private String password_auth_code;
	private String password_auth_key;
	public PasswordAuthVo() {
		super();
	}
	public PasswordAuthVo(String password_auth_code, String password_auth_key) {
		super();
		this.password_auth_code = password_auth_code;
		this.password_auth_key = password_auth_key;
	}
	public String getPassword_auth_code() {
		return password_auth_code;
	}
	public void setPassword_auth_code(String password_auth_code) {
		this.password_auth_code = password_auth_code;
	}
	public String getPassword_auth_key() {
		return password_auth_key;
	}
	public void setPassword_auth_key(String password_auth_key) {
		this.password_auth_key = password_auth_key;
	}
	
	
}
