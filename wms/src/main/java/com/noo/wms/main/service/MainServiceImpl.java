<<<<<<< Updated upstream
package com.noo.wms.main.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.UUID;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import com.noo.wms.main.mapper.MainSQLMapper;
import com.noo.wms.vo.AdminVo;
import com.noo.wms.vo.CompanyVo;
import com.noo.wms.vo.DepartmentVo;
import com.noo.wms.vo.EmployeeRankVo;
import com.noo.wms.vo.EmployeeVo;
import com.noo.wms.vo.MailAuthVo;
import com.noo.wms.vo.NoticeVo;
import com.noo.wms.vo.ShotcutVo;

@Service
public class MainServiceImpl {
	
	@Autowired
	private MainSQLMapper mainSQLMapper;
	
	@Autowired
	private JavaMailSender javaMailSender; 
	
	//관리자 로그인
	public AdminVo adminLogin(AdminVo adminVo) {
		AdminVo result = mainSQLMapper.selectByAdminEmailAndPw(adminVo);
		
		return result;
	}
	
	//사원 회원가입
	public void employeeRegister(EmployeeVo employeeVo) {

		System.out.println("test1 : " + employeeVo.getEmployee_code());
		
		mainSQLMapper.insertEmployee(employeeVo);
		
		String companyCode = employeeVo.getCompany_code();
		String RankCode = mainSQLMapper.selectRankCode(companyCode);
		employeeVo.setEmployee_rank_code(RankCode);
		mainSQLMapper.updateRankCode(employeeVo);
		
		System.out.println("test2 : " + employeeVo.getEmployee_code());
		
		//인증 메일 전송.... 
		try {
			MimeMessage mimeMessage = javaMailSender.createMimeMessage();
			MimeMessageHelper mimeMessageHelper = new MimeMessageHelper(mimeMessage,true,"UTF-8");  
			
			mimeMessageHelper.setSubject("[WMS] 회원가입이 완료되었습니다.");
			
			String uuid = UUID.randomUUID().toString();
			
			String text = "";
			text += "<h1>[WMS] 회원가입이 완료되었습니다.</h1>";
			//text += "인증 번호 :" + uuid;
			text += "아래 인증하기 링크를 클릭하셔서 인증 후 사이트 이용이 가능합니다.<br>";
			//text += "<a href='http://localhost:8181/wms/main/mailAuthProcess?auth_key="+uuid+"'>";
			text += "<a href='http://15.164.165.147:8080/wms/main/mailAuthProcess?auth_key="+uuid+"'>";
			text += "인증하기";
			text += "</a>";
			
			mimeMessageHelper.setText(text , true);
			mimeMessageHelper.setFrom("admin", "wms 관리자");
			mimeMessageHelper.setTo(employeeVo.getEmployee_email());			
			
			//javaMailSender.send(mimeMessage); //쓰레드로 처리...
			new MailSenderThread(javaMailSender,mimeMessage).start();
			
			
			MailAuthVo mailAuthVo = new MailAuthVo();
			mailAuthVo.setEmployee_code(employeeVo.getEmployee_code());
			mailAuthVo.setAuth_key(uuid);
			mainSQLMapper.insertMailAuth(mailAuthVo);
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	//인증 메일 확인
	public void mailAuth(String auth_key) {
		mainSQLMapper.updateCompleteY(auth_key);
	}
	
	//쓰레드 처리
	class MailSenderThread extends Thread{
		
		private JavaMailSender javaMailSender;
		private MimeMessage mimeMessage;
		
		public MailSenderThread(JavaMailSender javaMailSender, MimeMessage mimeMessage) {
			this.javaMailSender = javaMailSender;
			this.mimeMessage = mimeMessage;
		}
		
		public void run() {
			javaMailSender.send(mimeMessage);
		}
		
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
	
	//회원가입시 이메일 중복 확인
	public EmployeeVo getEmployeeEmailData(String employee_email) {
		EmployeeVo result = mainSQLMapper.selectEmployeeEmailByEmail(employee_email);
		
		return result;
	}
	
	//공지사항 작성
	public void noticeRegister(NoticeVo noticeVo) {
		mainSQLMapper.insertNotice(noticeVo);
	}
	
	//공지사항 불러오기
	public ArrayList<HashMap<String, Object>> getNoticeDataList(){
		ArrayList<HashMap<String, Object>> noticeDataList = new ArrayList<HashMap<String,Object>>();
		ArrayList<NoticeVo> noticeList = mainSQLMapper.selectNotice();
		
		for(NoticeVo noticeVo : noticeList) {
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("noticeVo", noticeVo);
			
			noticeDataList.add(map);
		}
		
		return noticeDataList;
	}

	//공지사항 상세보기
	public NoticeVo getNoticeDetail(String notice_code) {
		NoticeVo result = mainSQLMapper.selectNoticeByNoticeCode(notice_code);
		
		return result;
	}
	
	//공지사항 삭제
	public void deleteNotice(String notice_code) {
		mainSQLMapper.deleteNoticeByNoticeCode(notice_code);
	}
	
	//비밀번호 변경
	public void updateEmployeePw(EmployeeVo employeeVo) {
		mainSQLMapper.updateEmployeePw(employeeVo);
	}
	
	public ArrayList<HashMap<String, Object>> employeeInfo(String searchType, String searchWord, int pageNum, String company_code){

		int startList = (pageNum-1)*15;
		
		ArrayList<HashMap<String, Object>> employeeList = mainSQLMapper.employeeInfo(searchType, searchWord, startList, company_code);
		
		return employeeList;
	}
	
	public int employeeInfoCount(String searchType, String searchWord, String company_code){
		int employeeList = mainSQLMapper.employeeInfoCount(searchType , searchWord, company_code);
		
		return employeeList;
	}
	
	public EmployeeVo selectEmployeeInfo(EmployeeVo employeeVo) {
		
		return mainSQLMapper.selectEmployeeInfo(employeeVo);
	}
	
	public void updateEmployeeRankInfo(EmployeeVo employeeVo) {
		mainSQLMapper.updateEmployeeRankInfo(employeeVo);
	}
	
	public void updateEmployeeRetire(EmployeeVo employeeVo) {
		mainSQLMapper.updateEmployeeRetire(employeeVo);
	}
	
	public ArrayList<HashMap<String, Object>> selectDepByCompanyCode(String company_code){
		ArrayList<HashMap<String, Object>> depdataList = new ArrayList<HashMap<String, Object>>();
		ArrayList<DepartmentVo> depList = mainSQLMapper.selectDepByCompanyCode(company_code);
		
		for(DepartmentVo departmentVo : depList) {
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("departmentVo", departmentVo);
			
			depdataList.add(map);
		}
		
		return depdataList;
	}

	public ArrayList<ShotcutVo> findNav(String shotcut_name){
		
		return mainSQLMapper.navShotCut(shotcut_name);
		
	}
	
}
=======
>>>>>>> Stashed changes
