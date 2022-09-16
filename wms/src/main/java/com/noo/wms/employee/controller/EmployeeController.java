package com.noo.wms.employee.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/employee/*")
public class EmployeeController {
	
	@RequestMapping("findInfoPage")
	public String findInfoPage() {
		
		return "/employee/findInfoPage";
	}

}
