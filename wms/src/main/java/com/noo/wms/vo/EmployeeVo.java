package com.noo.wms.vo;

import java.util.Date;

public class EmployeeVo {
	private String employee_code;
	private String company_code;
	private String department_code;
	private String employee_rank_code;
	private String authority_code;
	private String employee_email;
	private String employee_password;
	private String employee_name;
	private String employee_state;
	private Date employee_join_date;
	private Date employee_leave_date;
	public EmployeeVo() {
		super();
	}
	public EmployeeVo(String employee_code, String company_code, String department_code, String employee_rank_code,
			String authority_code, String employee_email, String employee_password, String employee_name,
			String employee_state, Date employee_join_date, Date employee_leave_date) {
		super();
		this.employee_code = employee_code;
		this.company_code = company_code;
		this.department_code = department_code;
		this.employee_rank_code = employee_rank_code;
		this.authority_code = authority_code;
		this.employee_email = employee_email;
		this.employee_password = employee_password;
		this.employee_name = employee_name;
		this.employee_state = employee_state;
		this.employee_join_date = employee_join_date;
		this.employee_leave_date = employee_leave_date;
	}
	public String getEmployee_code() {
		return employee_code;
	}
	public void setEmployee_code(String employee_code) {
		this.employee_code = employee_code;
	}
	public String getCompany_code() {
		return company_code;
	}
	public void setCompany_code(String company_code) {
		this.company_code = company_code;
	}
	public String getDepartment_code() {
		return department_code;
	}
	public void setDepartment_code(String department_code) {
		this.department_code = department_code;
	}
	public String getEmployee_rank_code() {
		return employee_rank_code;
	}
	public void setEmployee_rank_code(String employee_rank_code) {
		this.employee_rank_code = employee_rank_code;
	}
	public String getAuthority_code() {
		return authority_code;
	}
	public void setAuthority_code(String authority_code) {
		this.authority_code = authority_code;
	}
	public String getEmployee_email() {
		return employee_email;
	}
	public void setEmployee_email(String employee_email) {
		this.employee_email = employee_email;
	}
	public String getEmployee_password() {
		return employee_password;
	}
	public void setEmployee_password(String employee_password) {
		this.employee_password = employee_password;
	}
	public String getEmployee_name() {
		return employee_name;
	}
	public void setEmployee_name(String employee_name) {
		this.employee_name = employee_name;
	}
	public String getEmployee_state() {
		return employee_state;
	}
	public void setEmployee_state(String employee_state) {
		this.employee_state = employee_state;
	}
	public Date getEmployee_join_date() {
		return employee_join_date;
	}
	public void setEmployee_join_date(Date employee_join_date) {
		this.employee_join_date = employee_join_date;
	}
	public Date getEmployee_leave_date() {
		return employee_leave_date;
	}
	public void setEmployee_leave_date(Date employee_leave_date) {
		this.employee_leave_date = employee_leave_date;
	}
	
	
	 
}
