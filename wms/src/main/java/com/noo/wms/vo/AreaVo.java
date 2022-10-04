package com.noo.wms.vo;

public class AreaVo {

	private String warehouse_area_code;
	private String warehouse_code;
	private String warehouse_area_name;
	
	public AreaVo() {
		super();
	}

	public AreaVo(String warehouse_area_code, String warehouse_code, String warehouse_area_name) {
		super();
		this.warehouse_area_code = warehouse_area_code;
		this.warehouse_code = warehouse_code;
		this.warehouse_area_name = warehouse_area_name;
	}

	public String getWarehouse_area_code() {
		return warehouse_area_code;
	}

	public void setWarehouse_area_code(String warehouse_area_code) {
		this.warehouse_area_code = warehouse_area_code;
	}

	public String getWarehouse_code() {
		return warehouse_code;
	}

	public void setWarehouse_code(String warehouse_code) {
		this.warehouse_code = warehouse_code;
	}

	public String getWarehouse_area_name() {
		return warehouse_area_name;
	}

	public void setWarehouse_area_name(String warehouse_area_name) {
		this.warehouse_area_name = warehouse_area_name;
	}
	
	
}
