package com.noo.wms.account.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestParam;

import com.noo.wms.vo.AccountVo;

public interface AccountSQLMapper {
	
	//불러오기
	public ArrayList<AccountVo> accountInfo(@Param("searchType") String searchType, 
											@Param("searchWord") String searchWord,
											@Param("startList") int startList,
											@Param("listSize") int listSize
											);
	
	public int accountInfoCount(@Param("searchType") String searchType, 
								@Param("searchWord") String searchWord
								);
	
	//등록하기
	public void insertAccountInfo(AccountVo accountVo);
	
	//수정하기
	public AccountVo selectAccountInfo(AccountVo account_code);
	public void updateAccountInfo(AccountVo accountVo);
	
	//삭제하기
	public void deleteAccountInfo(AccountVo account_code);
}
