package com.noo.wms.company.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.noo.wms.vo.AdminVo;
import com.noo.wms.vo.CompanyVo;

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
	
}
