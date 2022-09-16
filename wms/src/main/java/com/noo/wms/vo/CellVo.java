package com.noo.wms.vo;

public class CellVo {

	private String warehouse_cell_code;
	private String warehouse_rack_code;
	private String warehouse_cell_name;
	
	public CellVo() {
		super();
	}

	public CellVo(String warehouse_cell_code, String warehouse_rack_code, String warehouse_cell_name) {
		super();
		this.warehouse_cell_code = warehouse_cell_code;
		this.warehouse_rack_code = warehouse_rack_code;
		this.warehouse_cell_name = warehouse_cell_name;
	}

	public String getWarehouse_cell_code() {
		return warehouse_cell_code;
	}

	public void setWarehouse_cell_code(String warehouse_cell_code) {
		this.warehouse_cell_code = warehouse_cell_code;
	}

	public String getWarehouse_rack_code() {
		return warehouse_rack_code;
	}

	public void setWarehouse_rack_code(String warehouse_rack_code) {
		this.warehouse_rack_code = warehouse_rack_code;
	}

	public String getWarehouse_cell_name() {
		return warehouse_cell_name;
	}

	public void setWarehouse_cell_name(String warehouse_cell_name) {
		this.warehouse_cell_name = warehouse_cell_name;
	}
	
}
