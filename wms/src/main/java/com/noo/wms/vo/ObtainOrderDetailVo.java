package com.noo.wms.vo;

import java.util.Date;

public class ObtainOrderDetailVo {
	private String obtain_order_code;
	private String company_code;
	private String account_code;
	private String obtain_order_state;
	private String obtain_order_manager;
	private Date obtain_order_date;
	private Date obtain_order_due_date;
	private Date obtain_order_register_date;
	private String obtain_order_register_employee;
	private Date obtain_order_update_date;
	private String obtain_order_update_employee;
	private String obtain_order_memo;
	
	public ObtainOrderDetailVo() {
		super();
	}

	public ObtainOrderDetailVo(String obtain_order_code, String company_code, String account_code,
			String obtain_order_state, String obtain_order_manager, Date obtain_order_date, Date obtain_order_due_date,
			Date obtain_order_register_date, String obtain_order_register_employee, Date obtain_order_update_date,
			String obtain_order_update_employee, String obtain_order_memo) {
		super();
		this.obtain_order_code = obtain_order_code;
		this.company_code = company_code;
		this.account_code = account_code;
		this.obtain_order_state = obtain_order_state;
		this.obtain_order_manager = obtain_order_manager;
		this.obtain_order_date = obtain_order_date;
		this.obtain_order_due_date = obtain_order_due_date;
		this.obtain_order_register_date = obtain_order_register_date;
		this.obtain_order_register_employee = obtain_order_register_employee;
		this.obtain_order_update_date = obtain_order_update_date;
		this.obtain_order_update_employee = obtain_order_update_employee;
		this.obtain_order_memo = obtain_order_memo;
	}

	public String getObtain_order_code() {
		return obtain_order_code;
	}

	public void setObtain_order_code(String obtain_order_code) {
		this.obtain_order_code = obtain_order_code;
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

	public String getObtain_order_state() {
		return obtain_order_state;
	}

	public void setObtain_order_state(String obtain_order_state) {
		this.obtain_order_state = obtain_order_state;
	}

	public String getObtain_order_manager() {
		return obtain_order_manager;
	}

	public void setObtain_order_manager(String obtain_order_manager) {
		this.obtain_order_manager = obtain_order_manager;
	}

	public Date getObtain_order_date() {
		return obtain_order_date;
	}

	public void setObtain_order_date(Date obtain_order_date) {
		this.obtain_order_date = obtain_order_date;
	}

	public Date getObtain_order_due_date() {
		return obtain_order_due_date;
	}

	public void setObtain_order_due_date(Date obtain_order_due_date) {
		this.obtain_order_due_date = obtain_order_due_date;
	}

	public Date getObtain_order_register_date() {
		return obtain_order_register_date;
	}

	public void setObtain_order_register_date(Date obtain_order_register_date) {
		this.obtain_order_register_date = obtain_order_register_date;
	}

	public String getObtain_order_register_employee() {
		return obtain_order_register_employee;
	}

	public void setObtain_order_register_employee(String obtain_order_register_employee) {
		this.obtain_order_register_employee = obtain_order_register_employee;
	}

	public Date getObtain_order_update_date() {
		return obtain_order_update_date;
	}

	public void setObtain_order_update_date(Date obtain_order_update_date) {
		this.obtain_order_update_date = obtain_order_update_date;
	}

	public String getObtain_order_update_employee() {
		return obtain_order_update_employee;
	}

	public void setObtain_order_update_employee(String obtain_order_update_employee) {
		this.obtain_order_update_employee = obtain_order_update_employee;
	}

	public String getObtain_order_memo() {
		return obtain_order_memo;
	}

	public void setObtain_order_memo(String obtain_order_memo) {
		this.obtain_order_memo = obtain_order_memo;
	}
	
}
