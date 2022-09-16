package com.noo.wms.test.controller;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.noo.wms.test.service.TestService;
import com.noo.wms.vo.TestVo;

@Controller
@RequestMapping("/test/*")
public class TestController {
	
	@Autowired
	TestService testService;

	@RequestMapping("TestPage")
	public String TestPage(Model model) {
		ArrayList<TestVo> testList = testService.selectMember();
		
		model.addAttribute("member", testList);
		
		return "/test/TestPage";
	}
	
	
	
}
