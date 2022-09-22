package com.noo.wms.employee.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.noo.wms.employee.service.EmployeeServiceImpl;
import com.noo.wms.vo.PurchaseVo;

@Controller
@RequestMapping("/employee/*")
public class EmployeeController {
	
	@Autowired
	private EmployeeServiceImpl employeeService;
	
	@RequestMapping("findInfoPage")
	public String findInfoPage(Model model, String searchType, String searchWord,
			@RequestParam(value="pageNum", defaultValue = "1") int pageNum) {
		
		return "/employee/findInfoPage";
	}
	
	@RequestMapping("purchaseInfoPage")
	public String purchaseInfoPage(Model model, String searchType, String searchWord,
			@RequestParam(value="pageNum", defaultValue = "1") int pageNum) {
//	System.out.println("발주걍컨");
//	System.out.println(searchType);
//	System.out.println(searchWord);
//	System.out.println(pageNum);
//	
//	ArrayList<PurchaseVo> purchaseList = employeeService.purchaseInfo(searchType , searchWord, pageNum);
//	
//	int orderCount = employeeService.purchaseInfoCount(searchType, searchWord);
//	
//	//올림처리
//	int totalPageCount = (int)Math.ceil(orderCount/10.0);
//	
//	int startPage = ((pageNum-1)/5)*5 + 1;
//	int endPage = ((pageNum-1)/5+1)*5;
//	
//	if(endPage > totalPageCount) {
//	endPage = totalPageCount;
//	}
//	
//	model.addAttribute("startPage",startPage);
//	model.addAttribute("endPage",endPage);
//	model.addAttribute("currentPageNum",pageNum);
//	model.addAttribute("totalPageCount",totalPageCount);
//	
//	//링크유지
//	String additionalParam = "";
//	if(searchType != null && searchWord != null) {
//	additionalParam += "&searchType=" +searchType;
//	additionalParam += "&searchWord=" +searchWord;
//	}
//	
//	model.addAttribute("additionalParam",additionalParam);
//	
//	
//	
//	model.addAttribute("purchaseList", purchaseList);
		
		return "/employee/purchaseInfoPage";
	}
	
	@RequestMapping("outboundInfoPage")
	public String outboundInfoPage(Model model, String searchType, String searchWord,
			@RequestParam(value="pageNum", defaultValue = "1") int pageNum) {
		
		return "/employee/outboundInfoPage";
	}
	
	@RequestMapping("obtainOrderInfoPage")
	public String obtainOrderInfoPage(Model model, String searchType, String searchWord,
			@RequestParam(value="pageNum", defaultValue = "1") int pageNum) {
		
		return "/employee/obtainOrderInfoPage";
	}
	
	@RequestMapping("manufactureInfoPage")
	public String manufactureInfoPage(Model model, String searchType, String searchWord,
			@RequestParam(value="pageNum", defaultValue = "1") int pageNum) {
		
		return "/employee/manufactureInfoPage";
	}
	
	@RequestMapping("productInfoPage")
	public String productInfoPage(Model model, String searchType, String searchWord,
			@RequestParam(value="pageNum", defaultValue = "1") int pageNum) {
		
		return "/employee/productInfoPage";
	}
	
	@RequestMapping("productPriceInfoPage")
	public String productPriceInfoPage(Model model, String searchType, String searchWord,
			@RequestParam(value="pageNum", defaultValue = "1") int pageNum) {
		
		return "/employee/productPriceInfoPage";
	}

}
