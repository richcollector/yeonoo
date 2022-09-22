package com.noo.wms.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class LotVo {
	
	private String lot_code;
	private String product_code;
	private String company_code;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date lot_date;
	
	public LotVo() {
		super();
	}

	public LotVo(String lot_code, String product_code, String company_code, Date lot_date) {
		super();
		this.lot_code = lot_code;
		this.product_code = product_code;
		this.company_code = company_code;
		this.lot_date = lot_date;
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

	public String getCompany_code() {
		return company_code;
	}

	public void setCompany_code(String company_code) {
		this.company_code = company_code;
	}

	public Date getLot_date() {
		return lot_date;
	}

	public void setLot_date(Date lot_date) {
		this.lot_date = lot_date;
	}
	
	
}
