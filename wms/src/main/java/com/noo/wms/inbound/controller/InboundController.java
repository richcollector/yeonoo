package com.noo.wms.inbound.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.noo.wms.inbound.service.InboundServiceImpl;

@Controller
@RequestMapping("/inbound/*")
public class InboundController {

	@Autowired
	private InboundServiceImpl inboundService;
	
	@RequestMapping("inboundManage")
	public String inboundManage() {
		
		return "/inbound/inboundManage";
	}
	
}
