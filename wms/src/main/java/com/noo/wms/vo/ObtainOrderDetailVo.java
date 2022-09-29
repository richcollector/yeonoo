package com.noo.wms.vo;

import java.util.Date;

public class ObtainOrderDetailVo {
	private String obtain_order_detail_code;
	private String obtain_order_code;
	private String product_code;
	private String product_name;
	private int product_price;
	private int product_amount;
	
	public ObtainOrderDetailVo() {
		super();
	}

	public ObtainOrderDetailVo(String obtain_order_detail_code, String obtain_order_code, String product_code,
			String product_name, int product_price, int product_amount) {
		super();
		this.obtain_order_detail_code = obtain_order_detail_code;
		this.obtain_order_code = obtain_order_code;
		this.product_code = product_code;
		this.product_name = product_name;
		this.product_price = product_price;
		this.product_amount = product_amount;
	}

	public String getObtain_order_detail_code() {
		return obtain_order_detail_code;
	}

	public void setObtain_order_detail_code(String obtain_order_detail_code) {
		this.obtain_order_detail_code = obtain_order_detail_code;
	}

	public String getObtain_order_code() {
		return obtain_order_code;
	}

	public void setObtain_order_code(String obtain_order_code) {
		this.obtain_order_code = obtain_order_code;
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

	public int getProduct_price() {
		return product_price;
	}

	public void setProduct_price(int product_price) {
		this.product_price = product_price;
	}

	public int getProduct_amount() {
		return product_amount;
	}

	public void setProduct_amount(int product_amount) {
		this.product_amount = product_amount;
	}
	
	
}
