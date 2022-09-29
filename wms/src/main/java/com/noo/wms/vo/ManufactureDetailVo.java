package com.noo.wms.vo;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

public class ManufactureDetailVo {
	private String manufacture_detail_code;
	private String manufacture_code;
	private String product_code;
	private String product_name;
	private int product_amount;
	private String product_price;
	
	public ManufactureDetailVo() {
		super();
	}

	public ManufactureDetailVo(String manufacture_detail_code, String manufacture_code, String product_code,
			String product_name, int product_amount, String product_price) {
		super();
		this.manufacture_detail_code = manufacture_detail_code;
		this.manufacture_code = manufacture_code;
		this.product_code = product_code;
		this.product_name = product_name;
		this.product_amount = product_amount;
		this.product_price = product_price;
	}

	public String getManufacture_detail_code() {
		return manufacture_detail_code;
	}

	public void setManufacture_detail_code(String manufacture_detail_code) {
		this.manufacture_detail_code = manufacture_detail_code;
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








