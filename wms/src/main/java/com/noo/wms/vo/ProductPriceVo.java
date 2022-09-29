package com.noo.wms.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class ProductPriceVo {
	private String product_price_code;
	private String product_code;
	private String product_name;
	private int product_price_purchase;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date product_price_purchase_date;
	private int product_price_selling;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date product_price_selling_date;
	private String product_price_memo;
	
	public ProductPriceVo() {
		super();
	}

	public ProductPriceVo(String product_price_code, String product_code, String product_name,
			int product_price_purchase, Date product_price_purchase_date, int product_price_selling,
			Date product_price_selling_date, String product_price_memo) {
		super();
		this.product_price_code = product_price_code;
		this.product_code = product_code;
		this.product_name = product_name;
		this.product_price_purchase = product_price_purchase;
		this.product_price_purchase_date = product_price_purchase_date;
		this.product_price_selling = product_price_selling;
		this.product_price_selling_date = product_price_selling_date;
		this.product_price_memo = product_price_memo;
	}

	public String getProduct_price_code() {
		return product_price_code;
	}

	public void setProduct_price_code(String product_price_code) {
		this.product_price_code = product_price_code;
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

	public int getProduct_price_purchase() {
		return product_price_purchase;
	}

	public void setProduct_price_purchase(int product_price_purchase) {
		this.product_price_purchase = product_price_purchase;
	}

	public Date getProduct_price_purchase_date() {
		return product_price_purchase_date;
	}

	public void setProduct_price_purchase_date(Date product_price_purchase_date) {
		this.product_price_purchase_date = product_price_purchase_date;
	}

	public int getProduct_price_selling() {
		return product_price_selling;
	}

	public void setProduct_price_selling(int product_price_selling) {
		this.product_price_selling = product_price_selling;
	}

	public Date getProduct_price_selling_date() {
		return product_price_selling_date;
	}

	public void setProduct_price_selling_date(Date product_price_selling_date) {
		this.product_price_selling_date = product_price_selling_date;
	}

	public String getProduct_price_memo() {
		return product_price_memo;
	}

	public void setProduct_price_memo(String product_price_memo) {
		this.product_price_memo = product_price_memo;
	}
}
