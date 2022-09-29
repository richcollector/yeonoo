package com.noo.wms.company.service;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.noo.wms.company.mapper.CompanySQLMapper;
import com.noo.wms.vo.AdminVo;
import com.noo.wms.vo.CompanyVo;

@Service
public class CompanyServiceImpl {

	@Autowired
	private CompanySQLMapper companyMapper;
	
	//기업 등록
	public void insertMyCompany(CompanyVo companyVo, HttpSession session) {
		companyMapper.insertCompany(companyVo);
		String code = companyMapper.findLatestRegist().getCompany_code();
		String adCode = ((AdminVo)session.getAttribute("adminInfo")).getAdmin_code();
		companyMapper.whenRegistCompany(code,adCode);
	}
	
	//기업 정보
	public HashMap<String,Object> companyInfo(String companyCode, HttpSession session) {
		
		HashMap<String, Object> map = new HashMap<String,Object>();
		String code = ((AdminVo) session.getAttribute("adminInfo")).getCompany_code();
			
		map.put("company",companyMapper.companyInfo(code)); 
		
		return map;
		
	}
	
	//세션 다시 집어넣기
	public AdminVo refreshSession(AdminVo param, HttpSession session) {
			
		String id = ((AdminVo) session.getAttribute("adminInfo")).getAdmin_email();
		String pw = ((AdminVo) session.getAttribute("adminInfo")).getAdmin_password();
		
		AdminVo adminInfo = companyMapper.refreshSession(id, pw);
				
		return adminInfo;
		
	}
	
	//회사 정보 업데이트
	
	public void updateMyCompany(CompanyVo companyVo) {
	
		companyMapper.updateCompany(companyVo);
		
	}
	
	
}
