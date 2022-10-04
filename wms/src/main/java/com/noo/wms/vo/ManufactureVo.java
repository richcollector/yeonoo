package com.noo.wms.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class ManufactureVo {
	private String manufacture_code;
	private String company_code;
	private String manufacture_state;
	private String manufacture_manager;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date manufacture_date;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date manufacture_due_date;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date manufacture_register_date;
	private String manufacture_register_employee;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date manufacture_update_date;
	private String manufacture_update_employee;
	private String manufacture_memo;
	
	public ManufactureVo() {
		super();
	}

	public ManufactureVo(String manufacture_code, String company_code, String manufacture_state,
			String manufacture_manager, Date manufacture_date, Date manufacture_due_date,
			Date manufacture_register_date, String manufacture_register_employee, Date manufacture_update_date,
			String manufacture_update_employee, String manufacture_memo) {
		super();
		this.manufacture_code = manufacture_code;
		this.company_code = company_code;
		this.manufacture_state = manufacture_state;
		this.manufacture_manager = manufacture_manager;
		this.manufacture_date = manufacture_date;
		this.manufacture_due_date = manufacture_due_date;
		this.manufacture_register_date = manufacture_register_date;
		this.manufacture_register_employee = manufacture_register_employee;
		this.manufacture_update_date = manufacture_update_date;
		this.manufacture_update_employee = manufacture_update_employee;
		this.manufacture_memo = manufacture_memo;
	}

	public String getManufacture_code() {
		return manufacture_code;
	}

	public void setManufacture_code(String manufacture_code) {
		this.manufacture_code = manufacture_code;
	}

	public String getCompany_code() {
		return company_code;
	}

	public void setCompany_code(String company_code) {
		this.company_code = company_code;
	}

	public String getManufacture_state() {
		return manufacture_state;
	}

	public void setManufacture_state(String manufacture_state) {
		this.manufacture_state = manufacture_state;
	}

	public String getManufacture_manager() {
		return manufacture_manager;
	}

	public void setManufacture_manager(String manufacture_manager) {
		this.manufacture_manager = manufacture_manager;
	}

	public Date getManufacture_date() {
		return manufacture_date;
	}

	public void setManufacture_date(Date manufacture_date) {
		this.manufacture_date = manufacture_date;
	}

	public Date getManufacture_due_date() {
		return manufacture_due_date;
	}

	public void setManufacture_due_date(Date manufacture_due_date) {
		this.manufacture_due_date = manufacture_due_date;
	}

	public Date getManufacture_register_date() {
		return manufacture_register_date;
	}

	public void setManufacture_register_date(Date manufacture_register_date) {
		this.manufacture_register_date = manufacture_register_date;
	}

	public String getManufacture_register_employee() {
		return manufacture_register_employee;
	}

	public void setManufacture_register_employee(String manufacture_register_employee) {
		this.manufacture_register_employee = manufacture_register_employee;
	}

	public Date getManufacture_update_date() {
		return manufacture_update_date;
	}

	public void setManufacture_update_date(Date manufacture_update_date) {
		this.manufacture_update_date = manufacture_update_date;
	}

	public String getManufacture_update_employee() {
		return manufacture_update_employee;
	}

	public void setManufacture_update_employee(String manufacture_update_employee) {
		this.manufacture_update_employee = manufacture_update_employee;
	}

	public String getManufacture_memo() {
		return manufacture_memo;
	}

	public void setManufacture_memo(String manufacture_memo) {
		this.manufacture_memo = manufacture_memo;
	}
	
}
