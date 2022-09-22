package com.noo.wms.vo;

public class PurchaseDetailVo {
	private String purchase_detail_code;
	private String purchase_code;
	private String product_code;
	private int product_amount;
	private String product_name;
	private int product_price;
	
	public PurchaseDetailVo() {
		super();
	}

	public PurchaseDetailVo(String purchase_detail_code, String purchase_code, String product_code, int product_amount,
			String product_name, int product_price) {
		super();
		this.purchase_detail_code = purchase_detail_code;
		this.purchase_code = purchase_code;
		this.product_code = product_code;
		this.product_amount = product_amount;
		this.product_name = product_name;
		this.product_price = product_price;
	}

	public String getPurchase_detail_code() {
		return purchase_detail_code;
	}

	public void setPurchase_detail_code(String purchase_detail_code) {
		this.purchase_detail_code = purchase_detail_code;
	}

	public String getPurchase_code() {
		return purchase_code;
	}

	public void setPurchase_code(String purchase_code) {
		this.purchase_code = purchase_code;
	}

	public String getProduct_code() {
		return product_code;
	}

	public void setProduct_code(String product_code) {
		this.product_code = product_code;
	}

	public int getProduct_amount() {
		return product_amount;
	}

	public void setProduct_amount(int product_amount) {
		this.product_amount = product_amount;
	}

	public String getProduct_name() {
		return product_name;
	}

	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}

	public int getProduct_price() {
		return product_price;
	}

	public void setProduct_price(int product_price) {
		this.product_price = product_price;
	}
	
}
