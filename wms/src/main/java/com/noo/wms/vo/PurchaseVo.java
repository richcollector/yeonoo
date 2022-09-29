package com.noo.wms.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class PurchaseVo {
	private String purchase_code;
	private String company_code;
	private String account_code;
	private String purchase_state;
	private String purchase_manager;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date purchase_date;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date purchase_due_date;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date purchase_register_date;
	private String purchase_register_employee;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date purchase_update_date;
	private String purchase_update_employee;
	private String purchase_memo;
	
	public PurchaseVo() {
		super();
	}

	public PurchaseVo(String purchase_code, String company_code, String account_code, String purchase_state,
			String purchase_manager, Date purchase_date, Date purchase_due_date, Date purchase_register_date,
			String purchase_register_employee, Date purchase_update_date, String purchase_update_employee,
			String purchase_memo) {
		super();
		this.purchase_code = purchase_code;
		this.company_code = company_code;
		this.account_code = account_code;
		this.purchase_state = purchase_state;
		this.purchase_manager = purchase_manager;
		this.purchase_date = purchase_date;
		this.purchase_due_date = purchase_due_date;
		this.purchase_register_date = purchase_register_date;
		this.purchase_register_employee = purchase_register_employee;
		this.purchase_update_date = purchase_update_date;
		this.purchase_update_employee = purchase_update_employee;
		this.purchase_memo = purchase_memo;
	}

	public String getPurchase_code() {
		return purchase_code;
	}

	public void setPurchase_code(String purchase_code) {
		this.purchase_code = purchase_code;
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

	public String getPurchase_state() {
		return purchase_state;
	}

	public void setPurchase_state(String purchase_state) {
		this.purchase_state = purchase_state;
	}

	public String getPurchase_manager() {
		return purchase_manager;
	}

	public void setPurchase_manager(String purchase_manager) {
		this.purchase_manager = purchase_manager;
	}

	public Date getPurchase_date() {
		return purchase_date;
	}

	public void setPurchase_date(Date purchase_date) {
		this.purchase_date = purchase_date;
	}

	public Date getPurchase_due_date() {
		return purchase_due_date;
	}

	public void setPurchase_due_date(Date purchase_due_date) {
		this.purchase_due_date = purchase_due_date;
	}

	public Date getPurchase_register_date() {
		return purchase_register_date;
	}

	public void setPurchase_register_date(Date purchase_register_date) {
		this.purchase_register_date = purchase_register_date;
	}

	public String getPurchase_register_employee() {
		return purchase_register_employee;
	}

	public void setPurchase_register_employee(String purchase_register_employee) {
		this.purchase_register_employee = purchase_register_employee;
	}

	public Date getPurchase_update_date() {
		return purchase_update_date;
	}

	public void setPurchase_update_date(Date purchase_update_date) {
		this.purchase_update_date = purchase_update_date;
	}

	public String getPurchase_update_employee() {
		return purchase_update_employee;
	}

	public void setPurchase_update_employee(String purchase_update_employee) {
		this.purchase_update_employee = purchase_update_employee;
	}

	public String getPurchase_memo() {
		return purchase_memo;
	}

	public void setPurchase_memo(String purchase_memo) {
		this.purchase_memo = purchase_memo;
	}
	
}
