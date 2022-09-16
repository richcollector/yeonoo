package com.noo.wms.main.mapper;

import java.util.ArrayList;

import com.noo.wms.vo.AdminVo;
import com.noo.wms.vo.CompanyVo;
import com.noo.wms.vo.DepartmentVo;
import com.noo.wms.vo.EmployeeVo;
import com.noo.wms.vo.NoticeVo;

public interface MainSQLMapper {

	//관리자 로그인
	public AdminVo selectByAdminEmailAndPw(AdminVo adminVo);
	
	//사원 로그인
	public EmployeeVo selectByEmployeeEmailAndPw(EmployeeVo employeeVo);
	
	//사원 회원가입
	public void insertEmployee(EmployeeVo employeeVo);
	
	//회원가입시 회사코드 불러오기
	public ArrayList<CompanyVo> selectCompanyCode();
	
	//회원가입시 회사코드로 부서코드 불러오기
	public ArrayList<DepartmentVo> selectDepCodeByCompanyCode(String company_code);
	
	//공지사항 작성
	public void insertNotice(NoticeVo noticeVo);
	
	//공지사항 불러오기
	public ArrayList<NoticeVo> selectNotice();
}
