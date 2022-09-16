package com.noo.wms.main.controller;

import java.util.HashMap;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.noo.wms.main.service.MainServiceImpl;

@RestController
@RequestMapping("/main/*")
public class RestMainController {

	@Autowired
	private MainServiceImpl mainService;
	
	//부서코드 불러오기
	@RequestMapping("getDepCodeProcess")
	public HashMap<String, Object> getDepCodeProcess(String company_code){
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		
		map.put("result", "success");
		map.put("data", mainService.getDepCode(company_code));
		
		return map;
	}

}
