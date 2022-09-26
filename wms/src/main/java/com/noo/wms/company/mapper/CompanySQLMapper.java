package com.noo.wms.company.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.noo.wms.vo.AccountVo;
import com.noo.wms.vo.AdminVo;
import com.noo.wms.vo.CompanyVo;
import com.noo.wms.vo.DepartmentVo;
import com.noo.wms.vo.EmployeeRankVo;

public interface CompanySQLMapper {

	public void insertCompany(CompanyVo companyVo);
	public CompanyVo findLatestRegist();
	public void whenRegistCompany(
		@Param ("companyCode") String companyCode,
		@Param ("adminCode") String adminCode);
	public CompanyVo companyInfo(String companyCode);	
	public AdminVo refreshSession(
		@Param("adminEmail") String adminEmail,
		@Param("adminPassword") String adminPassword);
	public void updateCompany(CompanyVo companyVo);
	
	//부서 등록
	public void insertDepartment(DepartmentVo departmentVo);
	public ArrayList<DepartmentVo> selectDepartmentByCompanyCode(String company_code);
	
	//부서 불러오기
	public ArrayList<DepartmentVo> departmentInfo(@Param("searchType") String searchType, 
											@Param("searchWord") String searchWord,
											@Param("startList") int startList
											);
	
	public int departmentInfoCount(@Param("searchType") String searchType, 
								@Param("searchWord") String searchWord
								);
	
	//부서 수정
	public DepartmentVo selectDepartmentInfo(DepartmentVo departmentVo);
	public void updateDepartmentInfo(DepartmentVo departmentVo);
	
	//부서 삭제
	public void deleteDepartmentInfo(DepartmentVo departmentVo);
	
	//직급 등록
	public void insertEmployeeRank(EmployeeRankVo employeeRankVo);
	public ArrayList<EmployeeRankVo> selectEmployeeRankByCompanyCode(String company_code);
	
	//직급 불러오기
	public ArrayList<EmployeeRankVo> employeeRankInfo(@Param("searchType") String searchType, 
											@Param("searchWord") String searchWord,
											@Param("startList") int startList
											);
	
	public int employeeRankInfoCount(@Param("searchType") String searchType, 
								@Param("searchWord") String searchWord
								);
	
	//직급 수정
	public EmployeeRankVo selectEmployeeRankInfo(EmployeeRankVo employeeRankVo);
	public void updateEmployeeRankInfo(EmployeeRankVo employeeRankVo);
	
	//직급 삭제
	public void deleteEmployeeRankInfo(EmployeeRankVo employeeRankVo);
}
