package com.noo.wms.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class OutboundVo {
	private String outbound_code;
	private String company_code;
	private String account_code;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date outbound_date;
	private String outbound_manager;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date outbound_register_date;
	private String outbound_register_employee;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date outbound_update_date;
	private String outbound_update_employee;
	private String outbound_memo;
	
	public OutboundVo() {
		super();
	}

	public OutboundVo(String outbound_code, String company_code, String account_code, Date outbound_date,
			String outbound_manager, Date outbound_register_date, String outbound_register_employee,
			Date outbound_update_date, String outbound_update_employee, String outbound_memo) {
		super();
		this.outbound_code = outbound_code;
		this.company_code = company_code;
		this.account_code = account_code;
		this.outbound_date = outbound_date;
		this.outbound_manager = outbound_manager;
		this.outbound_register_date = outbound_register_date;
		this.outbound_register_employee = outbound_register_employee;
		this.outbound_update_date = outbound_update_date;
		this.outbound_update_employee = outbound_update_employee;
		this.outbound_memo = outbound_memo;
	}

	public String getOutbound_code() {
		return outbound_code;
	}

	public void setOutbound_code(String outbound_code) {
		this.outbound_code = outbound_code;
	}

	public String getCompany_code() {
		return company_code;
	}

	public void setCompany_code(String company_code) {
		this.company_code = company_code;
	}

	public String getAccount_code() {
		return account_code;
	}

	public void setAccount_code(String account_code) {
		this.account_code = account_code;
	}

	public Date getOutbound_date() {
		return outbound_date;
	}

	public void setOutbound_date(Date outbound_date) {
		this.outbound_date = outbound_date;
	}

	public String getOutbound_manager() {
		return outbound_manager;
	}

	public void setOutbound_manager(String outbound_manager) {
		this.outbound_manager = outbound_manager;
	}

	public Date getOutbound_register_date() {
		return outbound_register_date;
	}

	public void setOutbound_register_date(Date outbound_register_date) {
		this.outbound_register_date = outbound_register_date;
	}

	public String getOutbound_register_employee() {
		return outbound_register_employee;
	}

	public void setOutbound_register_employee(String outbound_register_employee) {
		this.outbound_register_employee = outbound_register_employee;
	}

	public Date getOutbound_update_date() {
		return outbound_update_date;
	}

	public void setOutbound_update_date(Date outbound_update_date) {
		this.outbound_update_date = outbound_update_date;
	}

	public String getOutbound_update_employee() {
		return outbound_update_employee;
	}

	public void setOutbound_update_employee(String outbound_update_employee) {
		this.outbound_update_employee = outbound_update_employee;
	}

	public String getOutbound_memo() {
		return outbound_memo;
	}

	public void setOutbound_memo(String outbound_memo) {
		this.outbound_memo = outbound_memo;
	}
	
}
