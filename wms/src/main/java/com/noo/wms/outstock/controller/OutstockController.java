package com.noo.wms.outstock.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/outstock/*")
public class OutstockController {
	
	@RequestMapping("outstockManage")
	public String outstockManage() {
		
		return "outstock/outstockManage";
	}
	
}
