package com.noo.wms.vo;

public class RackVo {

	private String warehouse_rack_code;
	private String warehouse_area_code;
	private String warehouse_rack_name;
	
	public RackVo() {
		super();
	}

	public RackVo(String warehouse_rack_code, String warehouse_area_code, String warehouse_rack_name) {
		super();
		this.warehouse_rack_code = warehouse_rack_code;
		this.warehouse_area_code = warehouse_area_code;
		this.warehouse_rack_name = warehouse_rack_name;
	}

	public String getWarehouse_rack_code() {
		return warehouse_rack_code;
	}

	public void setWarehouse_rack_code(String warehouse_rack_code) {
		this.warehouse_rack_code = warehouse_rack_code;
	}

	public String getWarehouse_area_code() {
		return warehouse_area_code;
	}

	public void setWarehouse_area_code(String warehouse_area_code) {
		this.warehouse_area_code = warehouse_area_code;
	}

	public String getWarehouse_rack_name() {
		return warehouse_rack_name;
	}

	public void setWarehouse_rack_name(String warehouse_rack_name) {
		this.warehouse_rack_name = warehouse_rack_name;
	}
	
	
	
}
