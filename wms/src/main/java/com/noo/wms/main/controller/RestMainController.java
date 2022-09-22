package com.noo.wms.main.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.noo.wms.main.service.MainServiceImpl;
import com.noo.wms.vo.AdminVo;
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
}
