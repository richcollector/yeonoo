package com.noo.wms.account.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.UUID;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
import org.springframework.web.multipart.MultipartFile;

import com.noo.wms.account.service.AccountServiceImpl;
import com.noo.wms.vo.AccountVo;
import com.noo.wms.vo.AdminVo;
import com.noo.wms.vo.EmployeeVo;

@RestController
@RequestMapping("/account/*")
public class AccountRestController {
	
	@Autowired
	private AccountServiceImpl accountService;
	
	@RequestMapping("accountInfo")
	public HashMap<String, Object> accountInfo(HttpSession session, Model model, String searchType, String searchWord,
									@RequestParam(value="pageNum", defaultValue = "1") int pageNum) {

		String company_code = null;
		
		AdminVo adminInfo = (AdminVo)session.getAttribute("adminInfo");
		EmployeeVo employeeInfo = (EmployeeVo)session.getAttribute("employeeInfo");
		
		if(adminInfo != null) {
			company_code = adminInfo.getCompany_code();
		}
		
		if(employeeInfo != null) {
			company_code = employeeInfo.getCompany_code();
		}
		
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		ArrayList<AccountVo> accountList = accountService.accountInfo(searchType , searchWord, pageNum, company_code);
		
		int orderCount = accountService.accountInfoCount(searchType, searchWord, company_code);
		
		//????????????
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
		
		//????????????
		String additionalParamType = "";
		String additionalParamWord = "";
		if(searchType != null && searchWord != null) {
			additionalParamType = searchType;
			additionalParamWord = searchWord;
		}
		map.put("additionalParamType", additionalParamType);
		map.put("additionalParamWord", additionalParamWord);
		map.put("accountList", accountList);
		map.put("result", "success");
		
		

		
		
		return map;
	}

	//????????? ????????? ?????? 
	@RequestMapping("insertAccountInfo")
	public HashMap<String, Object> insertAccountInfo(AccountVo accountVo, @RequestParam("file") MultipartFile file) {

				//?????????????????? ?????? ??????
				String folderName = "/uploadFilesWms/";
				File licenseFolder = new File(folderName);
				if(!licenseFolder.exists()) {
					licenseFolder.mkdirs();
				}
				
				//?????????????????? ?????? ??????
				String originalFileName = file.getOriginalFilename();
				
				String randomName = UUID.randomUUID().toString();
				randomName += "_" + System.currentTimeMillis();
				String ext = originalFileName.substring(originalFileName.lastIndexOf("."));
				randomName += ext;
				accountVo.setAccount_registration_jpg(randomName);
				
				try {
					file.transferTo(new File(folderName + randomName));
				}catch(Exception e) {
					e.printStackTrace();
				}
			

		accountService.insertAccountInfo(accountVo);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("result", "success");
		
		return map;
	}
	
	@RequestMapping("selectAccountInfo")
	public AccountVo selectAccountInfo(AccountVo account_code) {
		AccountVo accountVo =  accountService.selectAccountInfo(account_code);
		
		return accountVo;
	}

	@RequestMapping("updateAccountInfo")
	public HashMap<String, Object> updateAccountInfo(AccountVo accountVo) {
		accountService.updateAccountInfo(accountVo);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("result", "success");
		
		return map;
	}
	
	@RequestMapping("deleteAccountInfo")
	public HashMap<String, Object> deleteAccountInfo(String [] code) {
		
		for (String codeNum : code) {
			AccountVo account_code = new AccountVo();
			account_code.setAccount_code(codeNum);
			accountService.deleteAccountInfo(account_code);
		}
		
		System.out.println("???????????");
		System.out.println(code);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("result", "success");
		
		return map;
	}
}
