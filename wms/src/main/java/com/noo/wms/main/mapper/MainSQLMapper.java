package com.noo.wms.main.mapper;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Param;

import com.noo.wms.vo.AdminVo;
import com.noo.wms.vo.CompanyVo;
import com.noo.wms.vo.DepartmentVo;
import com.noo.wms.vo.EmployeeRankVo;
import com.noo.wms.vo.EmployeeVo;
import com.noo.wms.vo.MailAuthVo;
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
	
	//회원가입시 이메일 중복 확인
	public EmployeeVo selectEmployeeEmailByEmail(String employee_email);
	
	//메일 인증 T
	public void insertMailAuth(MailAuthVo mailAuthVo);
	public void updateCompleteY(String auth_key);
	
	//공지사항 작성
	public void insertNotice(NoticeVo noticeVo);
	
	//공지사항 불러오기
	public ArrayList<NoticeVo> selectNotice();
	
	//공지사항 상세보기
	public NoticeVo selectNoticeByNoticeCode(String notice_code);
	
	//공지사항 삭제
	public void deleteNoticeByNoticeCode(String notice_code);
	
	//비밀번호 변경
	public void updateEmployeePw(EmployeeVo employeeVo);
	
	//사원 목록 불러오기
	public ArrayList<HashMap<String, Object>> employeeInfo(@Param("searchType") String searchType, 
											@Param("searchWord") String searchWord,
											@Param("startList") int startList,
											@Param("company_code") String company_code
											);
	
	public int employeeInfoCount(@Param("searchType") String searchType, 
								@Param("searchWord") String searchWord,
								@Param("company_code") String company_code
								);
	
	//사원 권한 수정
	public EmployeeVo selectEmployeeInfo(EmployeeVo employeeVo);
	public void updateEmployeeRankInfo(EmployeeVo employeeVo);

	public void updateEmployeeRetire(EmployeeVo employeeVo);
	
	public ArrayList<DepartmentVo> selectDepByCompanyCode(String company_code);
}
