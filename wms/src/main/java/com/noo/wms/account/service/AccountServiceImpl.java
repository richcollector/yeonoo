package com.noo.wms.account.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.noo.wms.account.mapper.AccountSQLMapper;
import com.noo.wms.vo.AccountVo;

@Service
public class AccountServiceImpl {
	
	@Autowired
	private AccountSQLMapper accountSQLMapper;
	
	public ArrayList<AccountVo> accountInfo(String searchType, String searchWord, int pageNum){
//		System.out.println(searchType);
//		System.out.println(searchWord);
		
		int startList = (pageNum-1)*15;
		
//		System.out.println("스타투"+startList);
		
		ArrayList<AccountVo> accountList = accountSQLMapper.accountInfo(searchType , searchWord, startList);
		
		return accountList;
	}
	
	public int accountInfoCount(String searchType, String searchWord){
//		System.out.println(searchType);
//		System.out.println(searchWord);
		int accountList = accountSQLMapper.accountInfoCount(searchType , searchWord);
		
		return accountList;
	}
	
	public AccountVo excelSelect (String account_code) {
		AccountVo accountVo = accountSQLMapper.excelSelect(account_code);
		
		return accountVo;
	}
	
	
	
	public void insertAccountInfo(AccountVo accountVo) {
		accountSQLMapper.insertAccountInfo(accountVo);
	}
	
	public AccountVo selectAccountInfo (AccountVo account_code) {
		
		return accountSQLMapper.selectAccountInfo(account_code);
	}
	
	public void updateAccountInfo(AccountVo accountVo) {
		accountSQLMapper.updateAccountInfo(accountVo);
	}
	
	public void deleteAccountInfo (AccountVo account_code) {
		System.out.println("서비스탐?");
		System.out.println(account_code.getAccount_code());
		accountSQLMapper.deleteAccountInfo(account_code);
	}
}
