package com.noo.wms.account.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.noo.wms.account.service.AccountServiceImpl;
import com.noo.wms.vo.AccountVo;
import com.noo.wms.vo.AdminVo;
import com.noo.wms.vo.EmployeeVo;

@Controller
@RequestMapping("/account/*")
public class AccountController {
	
	@Autowired
	private AccountServiceImpl accountService;

	@RequestMapping("accountInfoPage")
	public String accountInfoPage(HttpSession session, Model model, String searchType, String searchWord,
									@RequestParam(value="pageNum", defaultValue = "1") int pageNum) {
		
		String company_code = null;
		
		AdminVo adminInfo = (AdminVo)session.getAttribute("adminInfo");
		EmployeeVo employeeInfo = (EmployeeVo)session.getAttribute("employeeInfo");
		
		if(adminInfo != null && employeeInfo != null) {
			return "/main/loginPage";
		}
		
		return "/account/accountInfoPage";
	}
	
	
  @RequestMapping("/excel/download")
  public void excelDownload(HttpServletResponse response, String [] code) throws IOException {
//      Workbook wb = new HSSFWorkbook();
  	
  	for(String xx : code) {
  		System.out.println("ttt : " + xx);
  	}
  	
  	System.out.println("엑셀들어오니");
  	System.out.println(code);
      Workbook wb = new XSSFWorkbook();
      Sheet sheet = wb.createSheet("첫번째 시트");
      Row row = null;
      Cell cell = null;
      int rowNum = 0;

      // Header
      row = sheet.createRow(rowNum++);
      cell = row.createCell(0);
      cell.setCellValue("거래처번호");
      
      cell = row.createCell(1);
      cell.setCellValue("회사이름");
      
      cell = row.createCell(2);
      cell.setCellValue("사업자등록번호");
      
      cell = row.createCell(3);
      cell.setCellValue("법인등록번호");
      
      cell = row.createCell(4);
      cell.setCellValue("대표명");
      
      cell = row.createCell(5);
      cell.setCellValue("전화번호");
      
      cell = row.createCell(6);
      cell.setCellValue("팩스번호");
      
      cell = row.createCell(7);
      cell.setCellValue("이메일번호");
      
      cell = row.createCell(8);
      cell.setCellValue("이메일번호(세금)");
      
      cell = row.createCell(9);
      cell.setCellValue("우편번호");
      
      cell = row.createCell(10);
      cell.setCellValue("주소");
      
      cell = row.createCell(11);
      cell.setCellValue("상세주소");
      
      cell = row.createCell(12);
      cell.setCellValue("거래처분류");
      
      cell = row.createCell(13);
      cell.setCellValue("거래처등록일");
      
      cell = row.createCell(14);
      cell.setCellValue("메모");
      
      cell = row.createCell(15);
      cell.setCellValue("사업자등록증");
      
      
      // Body
      
      for (String codeNum : code) {
    	  
    	  
    	  if(!codeNum.isEmpty()) {
    	  
      	
	      	AccountVo accountVo = accountService.excelSelect(codeNum);
	      	System.out.println("for문안");
	      	System.out.println("이거시" + codeNum);
	      	
	          row = sheet.createRow(rowNum++);
	          
	          cell = row.createCell(0);
	          cell.setCellValue(accountVo.getAccount_code());
	          
	          cell = row.createCell(1);
	          cell.setCellValue(accountVo.getAccount_name());
	          
	          cell = row.createCell(2);
	          cell.setCellValue(accountVo.getAccount_registration_number());
	          
	          cell = row.createCell(3);
	          cell.setCellValue(accountVo.getAccount_corporate_registration_number());
	          
	          cell = row.createCell(4);
	          cell.setCellValue(accountVo.getAccount_representative());
	          
	          cell = row.createCell(5);
	          cell.setCellValue(accountVo.getAccount_phone());
	          
	          cell = row.createCell(6);
	          cell.setCellValue(accountVo.getAccount_pax_number());
	          
	          cell = row.createCell(7);
	          cell.setCellValue(accountVo.getAccount_email());
	          
	          cell = row.createCell(8);
	          cell.setCellValue(accountVo.getAccount_email_tax());
	          
	          cell = row.createCell(9);
	          cell.setCellValue(accountVo.getAccount_post_number());
	          
	          cell = row.createCell(10);
	          cell.setCellValue(accountVo.getAccount_address());
	          
	          cell = row.createCell(11);
	          cell.setCellValue(accountVo.getAccount_address_detail());
	          
	          cell = row.createCell(12);
	          cell.setCellValue(accountVo.getAccount_category());
	          
	          cell = row.createCell(13);
	          cell.setCellValue(accountVo.getAccount_registration());
	          
	          cell = row.createCell(14);
	          cell.setCellValue(accountVo.getAccount_memo());
	          
	          cell = row.createCell(15);
	          cell.setCellValue(accountVo.getAccount_registration_jpg());
	          
	          System.out.println("메모" + accountVo.getAccount_memo());
    	  }
      }

      // 컨텐츠 타입과 파일명 지정
      response.setContentType("ms-vnd/excel");
//      response.setHeader("Content-Disposition", "attachment;filename=example.xls");
      response.setHeader("Content-Disposition", "attachment;filename=accountInfo.xlsx");

      // Excel File Output
      wb.write(response.getOutputStream());
      wb.close();
      System.out.println("여기까진오니");
  }

	
}
