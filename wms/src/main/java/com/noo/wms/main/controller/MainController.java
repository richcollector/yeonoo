package com.noo.wms.main.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.noo.wms.main.service.MainServiceImpl;
import com.noo.wms.vo.AdminVo;
import com.noo.wms.vo.EmployeeVo;
import com.noo.wms.vo.NoticeVo;

@Controller
@RequestMapping("/main/*")
public class MainController {
	
	@Autowired
	private MainServiceImpl mainService;
	
	//메인페이지
	@RequestMapping("mainPage")
	public String mainPage(Model model, HttpSession session) {
		String admin_code = "";
		AdminVo adminInfo = (AdminVo)session.getAttribute("adminInfo");
		if(adminInfo != null) {
			admin_code = adminInfo.getAdmin_code();
		}
		
		model.addAttribute("noticeDataList" , mainService.getNoticeData());
		model.addAttribute("adminInfo" , adminInfo);
		model.addAttribute("admin_code" , admin_code);
		return "/main/mainPage";
	}
	
	//로그인페이지
	@RequestMapping("loginPage")
	public String loginPage() {
		
		return "/main/loginPage";
	}
	
	//일반 로그인
	@RequestMapping("loginProcess")
	public String loginProcess(EmployeeVo employeeVo , HttpSession session) {
		EmployeeVo employeeInfo = mainService.employeeLogin(employeeVo);
		session.setAttribute("employeeInfo", employeeInfo);
		
		return "redirect:/main/mainPage";
	}
	
	@RequestMapping("adminLoginPage")
	public String adminLoginPage() {
		
		return "/main/adminLoginPage";
	}
	
	//관리자 로그인
	@RequestMapping("adminLoginProcess")
	public String adminLoginProcess(AdminVo adminVo, HttpSession session) {
		AdminVo adminInfo = mainService.adminLogin(adminVo);
		session.setAttribute("adminInfo", adminInfo);
		
		return "redirect:/main/mainPage";
	}
	
	//사원 회원가입페이지
	@RequestMapping("registerPage")
	public String registerPage(Model model) {
	 	ArrayList<HashMap<String, Object>> companyCodeDataList = mainService.getCompanyCode();
	 	
	 	model.addAttribute("companyCodeDataList" , companyCodeDataList);
	 	
		return "/main/registerPage";
	}
	
	//사원 회원가입
	@RequestMapping("employeeRegisterProcess")
	public String employeeRegisterProcess(EmployeeVo employeeVo) {
		
		mainService.employeeRegister(employeeVo);
		
		return "redirect:/main/mainPage";
	}
	
	//공지사항 작성
	@RequestMapping("noticeRegister")
	public String noticeRegister(NoticeVo noticeVo) {
		mainService.noticeRegister(noticeVo);
		
		return "redirect:/main/mainPage";
	}
}
