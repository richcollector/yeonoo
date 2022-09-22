package com.noo.wms.lot.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.noo.wms.lot.service.LotServiceImpl;

@Controller
@RequestMapping("/lot/*")
public class LotController {
	
	@Autowired
	private LotServiceImpl lotService;
	
	@RequestMapping("lotManage")
	public String lotManage() {
		
		return "/lot/lotManage";
	}
	
}
