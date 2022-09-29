package com.noo.wms.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class OutstockVo {

	private String outstock_code;
	private String stock_code;
	private String company_code;
	private String lot_code;
	private String product_code;
	private String warehouse_code;
	private String warehouse_area_code;
	private String warehouse_rack_code;
	private String warehouse_cell_code;
	private int outstock_amount;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date outstock_register_date;
	private String outstock_register_employee;
	private String outstock_memo;
	
	
	public OutstockVo() {
		super();
	}


	public OutstockVo(String outstock_code, String stock_code, String company_code, String lot_code,
			String product_code, String warehouse_code, String warehouse_area_code, String warehouse_rack_code,
			String warehouse_cell_code, int outstock_amount, Date outstock_register_date,
			String outstock_register_employee, String outstock_memo) {
		super();
		this.outstock_code = outstock_code;
		this.stock_code = stock_code;
		this.company_code = company_code;
		this.lot_code = lot_code;
		this.product_code = product_code;
		this.warehouse_code = warehouse_code;
		this.warehouse_area_code = warehouse_area_code;
		this.warehouse_rack_code = warehouse_rack_code;
		this.warehouse_cell_code = warehouse_cell_code;
		this.outstock_amount = outstock_amount;
		this.outstock_register_date = outstock_register_date;
		this.outstock_register_employee = outstock_register_employee;
		this.outstock_memo = outstock_memo;
	}


	public String getOutstock_code() {
		return outstock_code;
	}


	public void setOutstock_code(String outstock_code) {
		this.outstock_code = outstock_code;
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


	public int getOutstock_amount() {
		return outstock_amount;
	}


	public void setOutstock_amount(int outstock_amount) {
		this.outstock_amount = outstock_amount;
	}


	public Date getOutstock_register_date() {
		return outstock_register_date;
	}


	public void setOutstock_register_date(Date outstock_register_date) {
		this.outstock_register_date = outstock_register_date;
	}


	public String getOutstock_register_employee() {
		return outstock_register_employee;
	}


	public void setOutstock_register_employee(String outstock_register_employee) {
		this.outstock_register_employee = outstock_register_employee;
	}


	public String getOutstock_memo() {
		return outstock_memo;
	}


	public void setOutstock_memo(String outstock_memo) {
		this.outstock_memo = outstock_memo;
	}

}
