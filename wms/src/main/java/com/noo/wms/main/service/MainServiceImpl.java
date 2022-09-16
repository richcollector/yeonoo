package com.noo.wms.main.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.noo.wms.main.mapper.MainSQLMapper;
import com.noo.wms.vo.AdminVo;
import com.noo.wms.vo.CompanyVo;
import com.noo.wms.vo.DepartmentVo;
import com.noo.wms.vo.EmployeeVo;
import com.noo.wms.vo.NoticeVo;

@Service
public class MainServiceImpl {
	
	@Autowired
	private MainSQLMapper mainSQLMapper;
	
	//관리자 로그인
	public AdminVo adminLogin(AdminVo adminVo) {
		AdminVo result = mainSQLMapper.selectByAdminEmailAndPw(adminVo);
		
		return result;
	}
	
	//사원 회원가입
	public void employeeRegister(EmployeeVo employeeVo) {
		mainSQLMapper.insertEmployee(employeeVo);
	}
	
	//사원 로그인
	public EmployeeVo employeeLogin(EmployeeVo employeeVo) {
		EmployeeVo result = mainSQLMapper.selectByEmployeeEmailAndPw(employeeVo);
		
		return result;
	}
	
	//회원가입시 회사 코드 불러오기
	public ArrayList<HashMap<String, Object>> getCompanyCode() {
		ArrayList<HashMap<String, Object>> companyCodeDataList = new ArrayList<HashMap<String, Object>>();
		ArrayList<CompanyVo> companyCodeList = mainSQLMapper.selectCompanyCode();
				
		for(CompanyVo companyVo : companyCodeList) {
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("companyVo", companyVo);
			
			companyCodeDataList.add(map);
		}
				return companyCodeDataList;
	}
	
	//회원가입시 회사코드로 부서코드 불러오기
	public ArrayList<HashMap<String, Object>> getDepCode(String company_code){
		ArrayList<HashMap<String, Object>> DepCodeDataList = new ArrayList<HashMap<String,Object>>();
		ArrayList<DepartmentVo> DepCodeList = mainSQLMapper.selectDepCodeByCompanyCode(company_code);
		
		for(DepartmentVo departmentVo : DepCodeList) {
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("departmentVo", departmentVo);
			
			DepCodeDataList.add(map);
		}
			return DepCodeDataList;
	}
	
	//공지사항 작성
	public void noticeRegister(NoticeVo noticeVo) {
		mainSQLMapper.insertNotice(noticeVo);
	}
	
	//공지사항 불러오기
	public ArrayList<HashMap<String, Object>> getNoticeData(){
		ArrayList<HashMap<String, Object>> noticeDataList = new ArrayList<HashMap<String,Object>>();
		ArrayList<NoticeVo> noticeList = mainSQLMapper.selectNotice();
		
		for(NoticeVo noticeVo : noticeList) {
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("noticeVo", noticeVo);
			
			noticeDataList.add(map);
		}
		
		return noticeDataList;
	}
	
}
