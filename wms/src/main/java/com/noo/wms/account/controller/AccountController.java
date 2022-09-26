package com.noo.wms.account.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.noo.wms.account.service.AccountServiceImpl;
import com.noo.wms.vo.AccountVo;

@Controller
@RequestMapping("/account/*")
public class AccountController {
	
	@Autowired
	private AccountServiceImpl accountService;

	@RequestMapping("accountInfoPage")
	public String accountInfoPage(Model model, String searchType, String searchWord,
									@RequestParam(value="pageNum", defaultValue = "1") int pageNum) {
		System.out.println("걍컨");
		System.out.println(searchType);
		System.out.println(searchWord);
//		System.out.println(pageNum);
//		
//		ArrayList<AccountVo> accountList = accountService.accountInfo(searchType , searchWord, pageNum);
//		
//		int orderCount = accountService.accountInfoCount(searchType, searchWord);
//		
//		//올림처리
//		int totalPageCount = (int)Math.ceil(orderCount/10.0);
//
//		int startPage = ((pageNum-1)/5)*5 + 1;
//		int endPage = ((pageNum-1)/5+1)*5;
//		
//		if(endPage > totalPageCount) {
//			endPage = totalPageCount;
//		}
//		
//		model.addAttribute("startPage",startPage);
//		model.addAttribute("endPage",endPage);
//		model.addAttribute("currentPageNum",pageNum);
//		model.addAttribute("totalPageCount",totalPageCount);
//		
//		//링크유지
//		String additionalParam = "";
//		if(searchType != null && searchWord != null) {
//			additionalParam += "&searchType=" +searchType;
//			additionalParam += "&searchWord=" +searchWord;
//		}
//		
//		model.addAttribute("additionalParam",additionalParam);
//		
//		
//		
//		model.addAttribute("accountList", accountList);
		
		return "/account/accountInfoPage";
	}
	
}
