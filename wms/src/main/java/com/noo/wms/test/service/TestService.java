package com.noo.wms.test.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.noo.wms.test.mapper.TestSQLMapper;
import com.noo.wms.vo.TestVo;

@Service
public class TestService {
	
	@Autowired
	private TestSQLMapper testSQLMapper;
	
	public ArrayList<TestVo> selectMember(){
		
		ArrayList<TestVo> memberList  = testSQLMapper.selectMember();
		
		return memberList;
	}
	
	
}
