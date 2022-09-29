package com.noo.wms.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class StockVo {

	private String stock_code;
	private String company_code;
	private String lot_code;
	private String product_code;
	private String warehouse_code;
	private String warehouse_area_code;
	private String warehouse_rack_code;
	private String warehouse_cell_code;
	private int stock_amount;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date stock_register_date;
	private String stock_register_employee;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date stock_update_date;
	private String stock_update_employee;
	private String stock_memo;
	
	public StockVo() {
		super();
	}

	public StockVo(String stock_code, String company_code, String lot_code, String product_code, String warehouse_code,
			String warehouse_area_code, String warehouse_rack_code, String warehouse_cell_code, int stock_amount,
			Date stock_register_date, String stock_register_employee, Date stock_update_date,
			String stock_update_employee, String stock_memo) {
		super();
		this.stock_code = stock_code;
		this.company_code = company_code;
		this.lot_code = lot_code;
		this.product_code = product_code;
		this.warehouse_code = warehouse_code;
		this.warehouse_area_code = warehouse_area_code;
		this.warehouse_rack_code = warehouse_rack_code;
		this.warehouse_cell_code = warehouse_cell_code;
		this.stock_amount = stock_amount;
		this.stock_register_date = stock_register_date;
		this.stock_register_employee = stock_register_employee;
		this.stock_update_date = stock_update_date;
		this.stock_update_employee = stock_update_employee;
		this.stock_memo = stock_memo;
	}

	public String getStock_code() {
		return stock_code;
	}

	public void setStock_code(String stock_code) {
		this.stock_code = stock_code;
	}

	public String getCompany_code() {
		return company_code;
	}

	public void setCompany_code(String company_code) {
		this.company_code = company_code;
	}

	public String getLot_code() {
		return lot_code;
	}

	public void setLot_code(String lot_code) {
		this.lot_code = lot_code;
	}

	public String getProduct_code() {
		return product_code;
	}

	public void setProduct_code(String product_code) {
		this.product_code = product_code;
	}

	public String getWarehouse_code() {
		return warehouse_code;
	}

	public void setWarehouse_code(String warehouse_code) {
		this.warehouse_code = warehouse_code;
	}

	public String getWarehouse_area_code() {
		return warehouse_area_code;
	}

	public void setWarehouse_area_code(String warehouse_area_code) {
		this.warehouse_area_code = warehouse_area_code;
	}

	public String getWarehouse_rack_code() {
		return warehouse_rack_code;
	}

	public void setWarehouse_rack_code(String warehouse_rack_code) {
		this.warehouse_rack_code = warehouse_rack_code;
	}

	public String getWarehouse_cell_code() {
		return warehouse_cell_code;
	}

	public void setWarehouse_cell_code(String warehouse_cell_code) {
		this.warehouse_cell_code = warehouse_cell_code;
	}

	public int getStock_amount() {
		return stock_amount;
	}

	public void setStock_amount(int stock_amount) {
		this.stock_amount = stock_amount;
	}

	public Date getStock_register_date() {
		return stock_register_date;
	}

	public void setStock_register_date(Date stock_register_date) {
		this.stock_register_date = stock_register_date;
	}

	public String getStock_register_employee() {
		return stock_register_employee;
	}

	public void setStock_register_employee(String stock_register_employee) {
		this.stock_register_employee = stock_register_employee;
	}

	public Date getStock_update_date() {
		return stock_update_date;
	}

	public void setStock_update_date(Date stock_update_date) {
		this.stock_update_date = stock_update_date;
	}

	public String getStock_update_employee() {
		return stock_update_employee;
	}

	public void setStock_update_employee(String stock_update_employee) {
		this.stock_update_employee = stock_update_employee;
	}

	public String getStock_memo() {
		return stock_memo;
	}

	public void setStock_memo(String stock_memo) {
		this.stock_memo = stock_memo;
	}
	
}
