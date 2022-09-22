package com.noo.wms.vo;

public class ManufactureDetailVo {
	private String pmanufacture_detail_code;
	private String manufacture_code;
	private String product_code;
	private String product_name;
	private int product_amount;
	private String product_price;
	
	public ManufactureDetailVo() {
		super();
	}

	public ManufactureDetailVo(String pmanufacture_detail_code, String manufacture_code, String product_code,
			String product_name, int product_amount, String product_price) {
		super();
		this.pmanufacture_detail_code = pmanufacture_detail_code;
		this.manufacture_code = manufacture_code;
		this.product_code = product_code;
		this.product_name = product_name;
		this.product_amount = product_amount;
		this.product_price = product_price;
	}

	public String getPmanufacture_detail_code() {
		return pmanufacture_detail_code;
	}

	public void setPmanufacture_detail_code(String pmanufacture_detail_code) {
		this.pmanufacture_detail_code = pmanufacture_detail_code;
	}

	public String getManufacture_code() {
		return manufacture_code;
	}

	public void setManufacture_code(String manufacture_code) {
		this.manufacture_code = manufacture_code;
	}

	public String getProduct_code() {
		return product_code;
	}

	public void setProduct_code(String product_code) {
		this.product_code = product_code;
	}

	public String getProduct_name() {
		return product_name;
	}

	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}

	public int getProduct_amount() {
		return product_amount;
	}

	public void setProduct_amount(int product_amount) {
		this.product_amount = product_amount;
	}

	public String getProduct_price() {
		return product_price;
	}

	public void setProduct_price(String product_price) {
		this.product_price = product_price;
	}
	
	
}
