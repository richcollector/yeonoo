package com.noo.wms.company.service;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.noo.wms.company.mapper.CompanySQLMapper;
import com.noo.wms.vo.AccountVo;
import com.noo.wms.vo.AdminVo;
import com.noo.wms.vo.CompanyVo;
import com.noo.wms.vo.DepartmentVo;
import com.noo.wms.vo.EmployeeRankVo;

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
	
	public ArrayList<DepartmentVo> departmentInfo(String searchType, String searchWord, int pageNum){

		int startList = (pageNum-1)*15;
		
		ArrayList<DepartmentVo> accountList = companyMapper.departmentInfo(searchType, searchWord, startList);
		
		return accountList;
	}
	
	public int departmentInfoCount(String searchType, String searchWord){
		int departmentList = companyMapper.departmentInfoCount(searchType , searchWord);
		
		return departmentList;
	}
	
	//부서 정보 등록
	public void departmentRegister(DepartmentVo departmentVo) {

		companyMapper.insertDepartment(departmentVo);
	}
	
	public DepartmentVo selectDepartmentInfo(DepartmentVo departmentVo) {
		
		return companyMapper.selectDepartmentInfo(departmentVo);
	}
	
	public void updateDepartmentInfo(DepartmentVo departmentVo) {
		companyMapper.updateDepartmentInfo(departmentVo);
	}
	
	public void deleteDepartmentInfo (DepartmentVo departmentVo) {
		companyMapper.deleteDepartmentInfo(departmentVo);
	}
	
	public ArrayList<EmployeeRankVo> employeeRankInfo(String searchType, String searchWord, int pageNum){

		int startList = (pageNum-1)*15;
		
		ArrayList<EmployeeRankVo> employeeList = companyMapper.employeeRankInfo(searchType, searchWord, startList);
		
		return employeeList;
	}
	
	public int employeeRankInfoCount(String searchType, String searchWord){
		int employeeRankList = companyMapper.employeeRankInfoCount(searchType , searchWord);
		
		return employeeRankList;
	}
	
	
	public void insertEmployeeRank(EmployeeRankVo employeeRankVo) {
		companyMapper.insertEmployeeRank(employeeRankVo);
	}
	
	public EmployeeRankVo selectEmployeeRankInfo(EmployeeRankVo employeeRankVo) {
		
		return companyMapper.selectEmployeeRankInfo(employeeRankVo);
	}
	
	public void updateEmployeeRankInfo(EmployeeRankVo employeeRankVo) {
		companyMapper.updateEmployeeRankInfo(employeeRankVo);
	}
	
	public void deleteEmployeeRankInfo (EmployeeRankVo employeeRankVo) {
		companyMapper.deleteEmployeeRankInfo(employeeRankVo);
	}
	
	
}
