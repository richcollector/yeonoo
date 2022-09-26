package com.noo.wms.vo;

import java.util.Date;

public class EmployeeRankVo {
    private String employee_rank_code;
    private String company_code;
    private String employee_rank_name;
    private Date employee_rank_register_date;
    private Date employee_rank_update_date;
	public EmployeeRankVo() {
		super();
	}
	public EmployeeRankVo(String employee_rank_code, String company_code, String employee_rank_name,
			Date employee_rank_register_date, Date employee_rank_update_date) {
		super();
		this.employee_rank_code = employee_rank_code;
		this.company_code = company_code;
		this.employee_rank_name = employee_rank_name;
		this.employee_rank_register_date = employee_rank_register_date;
		this.employee_rank_update_date = employee_rank_update_date;
	}
	public String getEmployee_rank_code() {
		return employee_rank_code;
	}
	public void setEmployee_rank_code(String employee_rank_code) {
		this.employee_rank_code = employee_rank_code;
	}
	public String getCompany_code() {
		return company_code;
	}
	public void setCompany_code(String company_code) {
		this.company_code = company_code;
	}
	public String getEmployee_rank_name() {
		return employee_rank_name;
	}
	public void setEmployee_rank_name(String employee_rank_name) {
		this.employee_rank_name = employee_rank_name;
	}
	public Date getEmployee_rank_register_date() {
		return employee_rank_register_date;
	}
	public void setEmployee_rank_register_date(Date employee_rank_register_date) {
		this.employee_rank_register_date = employee_rank_register_date;
	}
	public Date getEmployee_rank_update_date() {
		return employee_rank_update_date;
	}
	public void setEmployee_rank_update_date(Date employee_rank_update_date) {
		this.employee_rank_update_date = employee_rank_update_date;
	}
    
    
}
