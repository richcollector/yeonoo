package com.noo.wms.vo;

public class OutboundDetailVo {
	private String outbound_detail_code;
	private String outbound_code;
	private String product_code;
	private int product_amount;
	private String product_name;
	private int product_price;
	
	public OutboundDetailVo() {
		super();
	}

	public OutboundDetailVo(String outbound_detail_code, String outbound_code, String product_code, int product_amount,
			String product_name, int product_price) {
		super();
		this.outbound_detail_code = outbound_detail_code;
		this.outbound_code = outbound_code;
		this.product_code = product_code;
		this.product_amount = product_amount;
		this.product_name = product_name;
		this.product_price = product_price;
	}

	public String getOutbound_detail_code() {
		return outbound_detail_code;
	}

	public void setOutbound_detail_code(String outbound_detail_code) {
		this.outbound_detail_code = outbound_detail_code;
	}

	public String getOutbound_code() {
		return outbound_code;
	}

	public void setOutbound_code(String outbound_code) {
		this.outbound_code = outbound_code;
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
