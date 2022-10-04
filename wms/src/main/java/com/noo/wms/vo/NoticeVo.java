package com.noo.wms.vo;

import java.util.Date;

public class NoticeVo {
	private String notice_code;
	private String company_code;
	private String admin_code;
	private String notice_title;
	private String notice_content;
	private Date notice_write_date;
	public NoticeVo() {
		super();
	}
	public NoticeVo(String notice_code, String company_code, String admin_code, String notice_title,
			String notice_content, Date notice_write_date) {
		super();
		this.notice_code = notice_code;
		this.company_code = company_code;
		this.admin_code = admin_code;
		this.notice_title = notice_title;
		this.notice_content = notice_content;
		this.notice_write_date = notice_write_date;
	}
	public String getNotice_code() {
		return notice_code;
	}
	public void setNotice_code(String notice_code) {
		this.notice_code = notice_code;
	}
	public String getCompany_code() {
		return company_code;
	}
	public void setCompany_code(String company_code) {
		this.company_code = company_code;
	}
	public String getAdmin_code() {
		return admin_code;
	}
	public void setAdmin_code(String admin_code) {
		this.admin_code = admin_code;
	}
	public String getNotice_title() {
		return notice_title;
	}
	public void setNotice_title(String notice_title) {
		this.notice_title = notice_title;
	}
	public String getNotice_content() {
		return notice_content;
	}
	public void setNotice_content(String notice_content) {
		this.notice_content = notice_content;
	}
	public Date getNotice_write_date() {
		return notice_write_date;
	}
	public void setNotice_write_date(Date notice_write_date) {
		this.notice_write_date = notice_write_date;
	}
	
	
}
