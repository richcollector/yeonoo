package com.noo.wms.vo;

public class WarehouseVo {

	private String warehouse_code;
	private String company_code;
	private String warehouse_classification;
	private String warehouse_name;
	
	public WarehouseVo() {
		super();
	}

	public WarehouseVo(String warehouse_code, String company_code, String warehouse_classification,
			String warehouse_name) {
		super();
		this.warehouse_code = warehouse_code;
		this.company_code = company_code;
		this.warehouse_classification = warehouse_classification;
		this.warehouse_name = warehouse_name;
	}

	public String getWarehouse_code() {
		return warehouse_code;
	}

	public void setWarehouse_code(String warehouse_code) {
		this.warehouse_code = warehouse_code;
	}

	public String getCompany_code() {
		return company_code;
	}

	public void setCompany_code(String company_code) {
		this.company_code = company_code;
	}

	public String getWarehouse_classification() {
		return warehouse_classification;
	}

	public void setWarehouse_classification(String warehouse_classification) {
		this.warehouse_classification = warehouse_classification;
	}

	public String getWarehouse_name() {
		return warehouse_name;
	}

	public void setWarehouse_name(String warehouse_name) {
		this.warehouse_name = warehouse_name;
	}
	
}
