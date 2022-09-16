package com.noo.wms.vo;

public class DepartmentVo {
	private String department_code;
	private String company_code;
	private String department_name;
	public DepartmentVo() {
		super();
	}
	public DepartmentVo(String department_code, String company_code, String department_name) {
		super();
		this.department_code = department_code;
		this.company_code = company_code;
		this.department_name = department_name;
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
	
	
}
