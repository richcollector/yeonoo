package com.noo.wms.warehouse.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.noo.wms.warehouse.service.WarehouseServiceImpl;

@Controller
@RequestMapping("/warehouse/*")
public class WarehouseController {

	@Autowired
	private WarehouseServiceImpl warehouseService;
	
	@RequestMapping("warehouseList")
	public String warehouseList() {
		return "warehouse/warehouseList";
	}
	
}
