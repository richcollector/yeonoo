package com.noo.wms.vo;

import java.util.Date;

public class DepartmentVo {
	private String department_code;
	private String company_code;
	private String department_name;
	private Date department_register_date;
	private Date department_update_date;
	public DepartmentVo() {
		super();
	}
	public DepartmentVo(String department_code, String company_code, String department_name,
			Date department_register_date, Date department_update_date) {
		super();
		this.department_code = department_code;
		this.company_code = company_code;
		this.department_name = department_name;
		this.department_register_date = department_register_date;
		this.department_update_date = department_update_date;
	}
	public String getDepartment_code() {
		return department_code;
	}
	public void setDepartment_code(String department_code) {
		this.department_code = department_code;
	}
	public String getCompany_code() {
		return company_code;
	}
	public void setCompany_code(String company_code) {
		this.company_code = company_code;
	}
	public String getDepartment_name() {
		return department_name;
	}
	public void setDepartment_name(String department_name) {
		this.department_name = department_name;
	}
	public Date getDepartment_register_date() {
		return department_register_date;
	}
	public void setDepartment_register_date(Date department_register_date) {
		this.department_register_date = department_register_date;
	}
	public Date getDepartment_update_date() {
		return department_update_date;
	}
	public void setDepartment_update_date(Date department_update_date) {
		this.department_update_date = department_update_date;
	}

	
}
