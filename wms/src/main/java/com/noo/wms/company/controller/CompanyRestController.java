package com.noo.wms.company.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.noo.wms.company.service.CompanyServiceImpl;
import com.noo.wms.vo.AdminVo;
import com.noo.wms.vo.CompanyVo;

@RestController
@RequestMapping("/company/*")
public class CompanyRestController {

	@Autowired
	private CompanyServiceImpl companyService; 
	
	@RequestMapping("insertCompanyInfo")
	public HashMap<String, Object> insertCompanyInfo(CompanyVo companyVo, HttpSession session) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		companyService.insertMyCompany(companyVo, session);
		
		map.put("result","sucess");
		
		return map;
	}
	
	@RequestMapping("myCompanyInfo")
	public HashMap<String, Object> showCompanyInfo(CompanyVo companyVo, HttpSession session){
		
		HashMap<String, Object> info = new HashMap<String, Object>();
				
		info.put("result", "sucess");
		info.put("company", companyService.companyInfo("companyCode", session));		
		
		return info;
		
	}
	
	@RequestMapping("refreshSession")
	public HashMap<String,Object> refreshSession(AdminVo param, HttpSession session){
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		AdminVo adminInfo = companyService.refreshSession(param, session);
		session.setAttribute("adminInfo", adminInfo);
	
		map.put("result","sucess");
		
		return map;
		
	}
	
	@RequestMapping("updateMyCompany")
	public HashMap<String,Object> updateMyCompany(CompanyVo companyVo, HttpSession session){
		
		HashMap<String,Object> map = new HashMap<String, Object>();
		
		String companyCode = ((AdminVo) session.getAttribute("adminInfo")).getCompany_code();
		
		companyVo.setCompany_code(companyCode);
		
		companyService.updateMyCompany(companyVo);	
		
		map.put("result", "sucess");
		
		return map;
		
	}
	
}
