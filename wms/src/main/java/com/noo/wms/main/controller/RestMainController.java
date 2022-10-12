package com.noo.wms.main.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.noo.wms.main.service.MainServiceImpl;
import com.noo.wms.vo.AdminVo;
import com.noo.wms.vo.EmployeeRankVo;
import com.noo.wms.vo.EmployeeVo;

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

	//회원가입시 이메일 중복 확인
	@RequestMapping("emailCheckProcess")
	public HashMap<String, Object> emailCheckProcess(String employee_email) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		String isDuplicate = "";
		if(mainService.getEmployeeEmailData(employee_email) != null) {
			isDuplicate = "T";
		} else {
			isDuplicate = "F";
		}
		
		map.put("result", "success");
		map.put("data", isDuplicate);
		return map;
	}
	
	//관리자 로그인
	@RequestMapping("adminLoginProcess")
	public HashMap<String, Object> adminLoginProcess(AdminVo adminVo, HttpSession session) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		AdminVo adminInfo = mainService.adminLogin(adminVo);		
		
		if(adminInfo == null) {
			map.put("result", "Fail");
			return map;
		} else {
			session.removeAttribute("employeeInfo");
			session.setAttribute("adminInfo", adminInfo);
			map.put("data", adminInfo);
			map.put("result", "success");
		}
		
		return map;
	}
	
	//사원 로그인
	@RequestMapping("loginProcess")
	public HashMap<String, Object> loginProcess(EmployeeVo employeeVo , HttpSession session) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		EmployeeVo employeeInfo = mainService.employeeLogin(employeeVo);
		
		if(employeeInfo == null) {
			map.put("result", "Fail");
			return map;
		} else {
			session.removeAttribute("adminInfo");
			session.setAttribute("employeeInfo", employeeInfo);
			map.put("data", employeeInfo);
			map.put("result", "success");
		}
		return map;
	}
	
	@RequestMapping("employeeInfo")
	public HashMap<String, Object> employeeInfo(Model model, String searchType, String searchWord, String company_code,
									@RequestParam(value="pageNum", defaultValue = "1") int pageNum) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		ArrayList<HashMap<String, Object>> employeeList = mainService.employeeInfo(searchType, searchWord, pageNum, company_code);
		
		int orderCount = mainService.employeeInfoCount(searchType, searchWord, company_code);
		
		//올림처리
		int totalPageCount = (int)Math.ceil(orderCount/15.0);

		int startPage = ((pageNum-1)/5)*5 + 1;
		int endPage = ((pageNum-1)/5+1)*5;
		
		if(endPage > totalPageCount) {
			endPage = totalPageCount;
		}
		
		map.put("startPage", startPage);
		map.put("endPage", endPage);
		map.put("currentPageNum", pageNum);
		map.put("totalPageCount", totalPageCount);
		
//		model.addAttribute("startPage",startPage);
//		model.addAttribute("endPage",endPage);
//		model.addAttribute("currentPageNum",pageNum);
//		model.addAttribute("totalPageCount",totalPageCount);
		
		//링크유지
		String additionalParamType = "";
		String additionalParamWord = "";
		if(searchType != null && searchWord != null) {
			additionalParamType = searchType;
			additionalParamWord = searchWord;
			
//			additionalParam += "&searchType=" + searchType;
//			additionalParam += "&searchWord=" + searchWord;
		}
		map.put("additionalParamType", additionalParamType);
		map.put("additionalParamWord", additionalParamWord);
//		map.put("additionalParam", additionalParam);
		map.put("employeeList", employeeList);
//		model.addAttribute("additionalParam",additionalParam);
		
//		model.addAttribute("accountList", accountList);
		
		return map;
	}
	
	@RequestMapping("selectEmployeeInfo")
	public HashMap<String, Object> selectEmployeeInfo(EmployeeVo employeeVo) {
		HashMap<String, Object> map = new HashMap<String, Object>();

		EmployeeVo result =  mainService.selectEmployeeInfo(employeeVo);

		map.put("success", "result");
		map.put("data", result);
		
		return map;
	}

	@RequestMapping("employeeRankUpdateProcess")
	public HashMap<String, Object> employeeRankUpdateProcess(EmployeeVo employeeVo) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		String a = employeeVo.getCompany_code();
		String b = employeeVo.getEmployee_code();
		String c = employeeVo.getEmployee_rank_code();
		System.out.println(a);
		System.out.println(b);
		System.out.println(c);
		mainService.updateEmployeeRankInfo(employeeVo);
		
		map.put("success", "result");
		
		return map;
	}
	
	@RequestMapping("updateEmployeeRetireProcess")
	public HashMap<String, Object> updateEmployeeRetireProcess(String [] code , EmployeeVo employeeVo) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		for (String codeNum : code) {
			EmployeeVo EmployeeData = new EmployeeVo();
			EmployeeData.setCompany_code(employeeVo.getCompany_code());
			EmployeeData.setEmployee_code(codeNum);
			
			mainService.updateEmployeeRetire(EmployeeData);
		}
		
		map.put("success", "result");
		
		return map;
	}
	
	@RequestMapping("navShotcut")
	public HashMap<String, Object> navShotcut(String shotcut_name){
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("shotcutList",mainService.findNav(shotcut_name));
		
		return map;
	}
	
}
