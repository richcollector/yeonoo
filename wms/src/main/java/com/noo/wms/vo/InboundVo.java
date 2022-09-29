package com.noo.wms.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class InboundVo {

	private String inbound_code;
	private String company_code;
	private String lot_code;
	private String product_code;
	private String warehouse_code;
	private String warehouse_area_code;
	private String warehouse_rack_code;
	private String warehouse_cell_code;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private int inbound_amount;	
	private Date inbound_register_date;
	private String inbound_register_employee;
	private String inbound_memo;
	
	public InboundVo() {
		super();
	}

	public InboundVo(String inbound_code, String company_code, String lot_code, String product_code,
			String warehouse_code, String warehouse_area_code, String warehouse_rack_code, String warehouse_cell_code,
			int inbound_amount, Date inbound_register_date, String inbound_register_employee, String inbound_memo) {
		super();
		this.inbound_code = inbound_code;
		this.company_code = company_code;
		this.lot_code = lot_code;
		this.product_code = product_code;
		this.warehouse_code = warehouse_code;
		this.warehouse_area_code = warehouse_area_code;
		this.warehouse_rack_code = warehouse_rack_code;
		this.warehouse_cell_code = warehouse_cell_code;
		this.inbound_amount = inbound_amount;
		this.inbound_register_date = inbound_register_date;
		this.inbound_register_employee = inbound_register_employee;
		this.inbound_memo = inbound_memo;
	}

	public String getInbound_code() {
		return inbound_code;
	}

	public void setInbound_code(String inbound_code) {
		this.inbound_code = inbound_code;
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

	public int getInbound_amount() {
		return inbound_amount;
	}

	public void setInbound_amount(int inbound_amount) {
		this.inbound_amount = inbound_amount;
	}

	public Date getInbound_register_date() {
		return inbound_register_date;
	}

	public void setInbound_register_date(Date inbound_register_date) {
		this.inbound_register_date = inbound_register_date;
	}

	public String getInbound_register_employee() {
		return inbound_register_employee;
	}

	public void setInbound_register_employee(String inbound_register_employee) {
		this.inbound_register_employee = inbound_register_employee;
	}

	public String getInbound_memo() {
		return inbound_memo;
	}

	public void setInbound_memo(String inbound_memo) {
		this.inbound_memo = inbound_memo;
	}

}
