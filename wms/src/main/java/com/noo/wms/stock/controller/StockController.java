package com.noo.wms.stock.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.noo.wms.stock.service.StockServiceImpl;

@Controller
@RequestMapping("/stock/*")
public class StockController {

	@Autowired
	private StockServiceImpl stockService;
	
	@RequestMapping("stockManage")
	public String stockManage() {
		
		return "stock/stockManage";
	}
	
}
