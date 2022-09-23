package com.noo.wms.account.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletResponse;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.noo.wms.account.service.AccountServiceImpl;
import com.noo.wms.vo.AccountVo;

@RestController
@RequestMapping("/account/*")
public class AccountRestController {
	
	@Autowired
	private AccountServiceImpl accountService;
	
	@RequestMapping("accountInfo")
	public HashMap<String, Object> accountInfo(Model model, String searchType, String searchWord,
									@RequestParam(value="pageNum", defaultValue = "1") int pageNum) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		System.out.println("래컨");
//		System.out.println(searchType);
//		System.out.println(searchWord);
		
		ArrayList<AccountVo> accountList = accountService.accountInfo(searchType , searchWord, pageNum);
		
		System.out.println(accountList);
		
		int orderCount = accountService.accountInfoCount(searchType, searchWord);
		
		//올림처리
		int totalPageCount = (int)Math.ceil(orderCount/10.0);

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
		map.put("accountList", accountList);
//		model.addAttribute("additionalParam",additionalParam);
		
//		model.addAttribute("accountList", accountList);
		
		return map;
	}

	
	@RequestMapping("insertAccountInfo")
	public void insertAccountInfo(AccountVo accountVo) {
		accountService.insertAccountInfo(accountVo);
		
	}
	
	@RequestMapping("selectAccountInfo")
	public AccountVo selectAccountInfo(AccountVo account_code) {
		AccountVo accountVo =  accountService.selectAccountInfo(account_code);
		
		return accountVo;
	}

	@RequestMapping("updateAccountInfo")
	public void updateAccountInfo(AccountVo accountVo) {
		accountService.updateAccountInfo(accountVo);
	}
	
	@RequestMapping("deleteAccountInfo")
	public void deleteAccountInfo(String [] code) {
		
		for (String codeNum : code) {
			AccountVo account_code = new AccountVo();
			account_code.setAccount_code(codeNum);
			accountService.deleteAccountInfo(account_code);
		}
		
		System.out.println("들어옴??");
		System.out.println(code);
	}
}
