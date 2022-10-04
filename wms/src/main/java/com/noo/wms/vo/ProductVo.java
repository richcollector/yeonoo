package com.noo.wms.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class ProductVo {
	private String product_code;
	private String company_code;
	private String product_name;
	private int product_size;
	private int product_version;
	private String product_type;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date product_register_date;
	private String product_register_employee;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date product_update_date;
	private String product_update_employee;
	private String product_memo;
	
	public ProductVo() {
		super();
	}

	public ProductVo(String product_code, String company_code, String product_name, int product_size,
			int product_version, String product_type, Date product_register_date, String product_register_employee,
			Date product_update_date, String product_update_employee, String product_memo) {
		super();
		this.product_code = product_code;
		this.company_code = company_code;
		this.product_name = product_name;
		this.product_size = product_size;
		this.product_version = product_version;
		this.product_type = product_type;
		this.product_register_date = product_register_date;
		this.product_register_employee = product_register_employee;
		this.product_update_date = product_update_date;
		this.product_update_employee = product_update_employee;
		this.product_memo = product_memo;
	}

	public String getProduct_code() {
		return product_code;
	}

	public void setProduct_code(String product_code) {
		this.product_code = product_code;
	}

	public String getCompany_code() {
		return company_code;
	}

	public void setCompany_code(String company_code) {
		this.company_code = company_code;
	}

	public String getProduct_name() {
		return product_name;
	}

	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}

	public int getProduct_size() {
		return product_size;
	}

	public void setProduct_size(int product_size) {
		this.product_size = product_size;
	}

	public int getProduct_version() {
		return product_version;
	}

	public void setProduct_version(int product_version) {
		this.product_version = product_version;
	}

	public String getProduct_type() {
		return product_type;
	}

	public void setProduct_type(String product_type) {
		this.product_type = product_type;
	}

	public Date getProduct_register_date() {
		return product_register_date;
	}

	public void setProduct_register_date(Date product_register_date) {
		this.product_register_date = product_register_date;
	}

	public String getProduct_register_employee() {
		return product_register_employee;
	}

	public void setProduct_register_employee(String product_register_employee) {
		this.product_register_employee = product_register_employee;
	}

	public Date getProduct_update_date() {
		return product_update_date;
	}

	public void setProduct_update_date(Date product_update_date) {
		this.product_update_date = product_update_date;
	}

	public String getProduct_update_employee() {
		return product_update_employee;
	}

	public void setProduct_update_employee(String product_update_employee) {
		this.product_update_employee = product_update_employee;
	}

	public String getProduct_memo() {
		return product_memo;
	}

	public void setProduct_memo(String product_memo) {
		this.product_memo = product_memo;
	}
	
	
	
}
