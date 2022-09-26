package com.noo.wms.company.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.noo.wms.account.service.AccountServiceImpl;
import com.noo.wms.company.service.CompanyServiceImpl;
import com.noo.wms.vo.AccountVo;
import com.noo.wms.vo.AdminVo;
import com.noo.wms.vo.CompanyVo;
import com.noo.wms.vo.DepartmentVo;
import com.noo.wms.vo.EmployeeRankVo;

@RestController
@RequestMapping("/company/*")
public class CompanyRestController {

	@Autowired
	private CompanyServiceImpl companyService;
	
	@Autowired
	private AccountServiceImpl accountService;

	@RequestMapping("insertCompanyInfo")
	public HashMap<String, Object> insertCompanyInfo(CompanyVo companyVo, HttpSession session) {

		HashMap<String, Object> map = new HashMap<String, Object>();

		companyService.insertMyCompany(companyVo, session);

		map.put("result", "sucess");

		return map;
	}

	@RequestMapping("myCompanyInfo")
	public HashMap<String, Object> showCompanyInfo(CompanyVo companyVo, HttpSession session) {

		HashMap<String, Object> info = new HashMap<String, Object>();

		info.put("result", "sucess");
		info.put("company", companyService.companyInfo("companyCode", session));

		return info;

	}

	@RequestMapping("refreshSession")
	public HashMap<String, Object> refreshSession(AdminVo param, HttpSession session) {

		HashMap<String, Object> map = new HashMap<String, Object>();

		AdminVo adminInfo = companyService.refreshSession(param, session);
		session.setAttribute("adminInfo", adminInfo);

		map.put("result", "sucess");

		return map;

	}

	@RequestMapping("updateMyCompany")
	public HashMap<String, Object> updateMyCompany(CompanyVo companyVo, HttpSession session) {

		HashMap<String, Object> map = new HashMap<String, Object>();

		String companyCode = ((AdminVo) session.getAttribute("adminInfo")).getCompany_code();

		companyVo.setCompany_code(companyCode);

		companyService.updateMyCompany(companyVo);

		map.put("result", "sucess");

		return map;

	}

	
	@RequestMapping("departmentInfo")
	public HashMap<String, Object> departmentInfo(Model model, String searchType, String searchWord,
									@RequestParam(value="pageNum", defaultValue = "1") int pageNum) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		ArrayList<DepartmentVo> departmentList = companyService.departmentInfo(searchType, searchWord, pageNum);
		
		int orderCount = companyService.departmentInfoCount(searchType, searchWord);
		
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
		map.put("departmentList", departmentList);
//		model.addAttribute("additionalParam",additionalParam);
		
//		model.addAttribute("accountList", accountList);
		
		return map;
	}
	
	//부서 등록
	@RequestMapping("departmentRegisterProcess")
	public HashMap<String, Object> departmentRegisterProcess(DepartmentVo departmentVo) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		companyService.departmentRegister(departmentVo);
		
		map.put("success", "result");
		
		return map;
	}
	
	@RequestMapping("selectDepartmentInfo")
	public HashMap<String, Object> selectDepartmentInfo(DepartmentVo departmentVo) {
		HashMap<String, Object> map = new HashMap<String, Object>();

		DepartmentVo result =  companyService.selectDepartmentInfo(departmentVo);

		map.put("success", "result");
		map.put("data", result);
		
		return map;
	}

	@RequestMapping("departmentUpdateProcess")
	public HashMap<String, Object> departmentUpdateProcess(DepartmentVo departmentVo) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		String a = departmentVo.getCompany_code();
		String b = departmentVo.getDepartment_code();
		String c = departmentVo.getDepartment_name();
		System.out.println(a);
		System.out.println(b);
		System.out.println(c);
		companyService.updateDepartmentInfo(departmentVo);
		
		map.put("success", "result");
		
		return map;
	}
	
	@RequestMapping("deleteDepartmentInfo")
	public HashMap<String, Object> deleteDepartmentInfo(String [] code , DepartmentVo departmentVo) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		for (String codeNum : code) {
			DepartmentVo departmentData = new DepartmentVo();
			
			departmentData.setCompany_code(departmentVo.getCompany_code());
			departmentData.setDepartment_code(codeNum);
			
			companyService.deleteDepartmentInfo(departmentData);
		}
		
		map.put("success", "result");
		
		return map;
	}
	
	@RequestMapping("employeeRankInfo")
	public HashMap<String, Object> employeeRankInfo(Model model, String searchType, String searchWord,
									@RequestParam(value="pageNum", defaultValue = "1") int pageNum) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		ArrayList<EmployeeRankVo> employeeRankList = companyService.employeeRankInfo(searchType, searchWord, pageNum);
		
		int orderCount = companyService.employeeRankInfoCount(searchType, searchWord);
		
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
		map.put("employeeRankList", employeeRankList);
//		model.addAttribute("additionalParam",additionalParam);
		
//		model.addAttribute("accountList", accountList);
		
		return map;
	}
	
	//직급 등록
	@RequestMapping("EmployeeRankRegisterProcess")
	public HashMap<String, Object> EmployeeRankRegisterProcess(EmployeeRankVo employeeRankVo) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		companyService.insertEmployeeRank(employeeRankVo);
		
		map.put("success", "result");
		
		return map;
	}
	
	@RequestMapping("selectEmployeeRankInfo")
	public HashMap<String, Object> selectEmployeeRankInfo(EmployeeRankVo employeeRankVo) {
		HashMap<String, Object> map = new HashMap<String, Object>();

		EmployeeRankVo result =  companyService.selectEmployeeRankInfo(employeeRankVo);

		map.put("success", "result");
		map.put("data", result);
		
		return map;
	}

	@RequestMapping("employeeRankUpdateProcess")
	public HashMap<String, Object> employeeRankUpdateProcess(EmployeeRankVo employeeRankVo) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		companyService.updateEmployeeRankInfo(employeeRankVo);
		
		map.put("success", "result");
		
		return map;
	}
	
	@RequestMapping("deleteEmployeeRankInfo")
	public HashMap<String, Object> deleteEmployeeRankInfo(String [] code , EmployeeRankVo employeeRankVo) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		for (String codeNum : code) {
			EmployeeRankVo EmployeeRankData = new EmployeeRankVo();
			
			EmployeeRankData.setCompany_code(employeeRankVo.getCompany_code());
			EmployeeRankData.setEmployee_rank_code(codeNum);
			
			companyService.deleteEmployeeRankInfo(EmployeeRankData);
		}
		
		map.put("success", "result");
		
		return map;
	}
}
