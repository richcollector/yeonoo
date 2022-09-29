package com.noo.wms.company.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.noo.wms.company.service.CompanyServiceImpl;
import com.noo.wms.vo.CompanyVo;

@Controller
@RequestMapping("/company/*")
public class CompanyController {
	
	@Autowired
	private CompanyServiceImpl companyService; 
	
	//회사 정보 보기
	
	@RequestMapping("companyInfoPage")
	public String CompanyInfoPage() {
		
		return "/company/companyInfoPage";
	}
	
	

}

