package com.noo.wms.company.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.noo.wms.company.service.CompanyServiceImpl;
import com.noo.wms.vo.AdminVo;
import com.noo.wms.vo.CompanyVo;
import com.noo.wms.vo.DepartmentVo;

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
	
	//부서 정보 페이지
	@RequestMapping("departmentInfoPage")
	public String departmentInfoPage(Model model , HttpSession session) {
		AdminVo adminInfo = (AdminVo)session.getAttribute("adminInfo");
		
		model.addAttribute("adminInfo" , adminInfo);
		return "/company/departmentInfoPage";
	}
	
	//직급 정보 페이지
	@RequestMapping("employeeRankInfoPage")
	public String employeeRankInfoPage(Model model , HttpSession session) {
		AdminVo adminInfo = (AdminVo)session.getAttribute("adminInfo");
		
		model.addAttribute("adminInfo" , adminInfo);
		return "/company/employeeRankInfoPage";
	}

	
}

