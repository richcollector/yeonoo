package com.noo.wms.account.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.noo.wms.account.service.AccountServiceImpl;
import com.noo.wms.vo.AccountVo;

@RestController
@RequestMapping("/account/*")
public class AccountRestController {
	
	@Autowired
	private AccountServiceImpl accountService;
	
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
