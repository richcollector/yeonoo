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
		AdminVo adminInfo = (AdminVo)session.getAttribute("adminInfo");
		EmployeeVo employeeInfo = (EmployeeVo)session.getAttribute("employeeInfo");
		
		model.addAttribute("employeeInfo" , employeeInfo);
		model.addAttribute("adminInfo" , adminInfo);
		model.addAttribute("noticeDataList" , mainService.getNoticeDataList());
		
		return "/main/mainPage";
	}
	
	//로그인페이지
	@RequestMapping("loginPage")
	public String loginPage() {
		
		return "/main/loginPage";
	}
	
	@RequestMapping("adminLoginPage")
	public String adminLoginPage() {
		
		return "/main/adminLoginPage";
	}
	
	//로그아웃
	@RequestMapping("logOutProcess")
	public String logOutProcess(HttpSession session) {
		session.invalidate();
		
		return "redirect:/main/loginPage";
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
		
		return "redirect:/main/loginPage";
	}
	
	@RequestMapping("mailAuthProcess")
	public String mailAuthProcess(String auth_key) {
		
		mainService.mailAuth(auth_key);
		
		return "/main/mailAuthComplete";
	}
	
	@RequestMapping("mailAuthComplete")
	public String mailAuthComplete() {
		return "/main/mailAuthComplete";
	}
	
	//공지사항 작성
	@RequestMapping("noticeRegister")
	public String noticeRegister(NoticeVo noticeVo) {
		mainService.noticeRegister(noticeVo);
		
		return "redirect:/main/mainPage";
	}
	
	@RequestMapping("noticedetailPage")
	public String noticedetailPage(Model model, String notice_code){
		model.addAttribute("data",  mainService.getNoticeDetail(notice_code));
		
		return "/main/noticedetailPage";
	}
	
	//공지사항 삭제
	@RequestMapping("noticeDeleteProcess")
	public String noticeDeleteProcess(String notice_code) {
		mainService.deleteNotice(notice_code);
		return "redirect:/main/mainPage";
	}
	
	//개인 정보 수정 페이지
	@RequestMapping("userInfoUpdatePage")
	public String userInfoUpdatePage() {
		
		return "/main/userInfoUpdatePage";
	}
}
