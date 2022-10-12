package com.noo.wms.account.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FilenameUtils;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellType;
import org.apache.poi.ss.usermodel.DateUtil;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
      cell.setCellValue("거래처코드");
      
      cell = row.createCell(1);
      cell.setCellValue("회사코드");
      
      cell = row.createCell(2);
      cell.setCellValue("회사명");
      
      cell = row.createCell(3);
      cell.setCellValue("사업자등록번호");
      
      cell = row.createCell(4);
      cell.setCellValue("법인등록번호");
      
      cell = row.createCell(5);
      cell.setCellValue("대표명");
      
      cell = row.createCell(6);
      cell.setCellValue("전화번호");
      
      cell = row.createCell(7);
      cell.setCellValue("팩스번호");
      
      cell = row.createCell(8);
      cell.setCellValue("이메일번호");
      
      cell = row.createCell(9);
      cell.setCellValue("이메일번호(세금)");
      
      cell = row.createCell(10);
      cell.setCellValue("우편번호");
      
      cell = row.createCell(11);
      cell.setCellValue("주소");
      
      cell = row.createCell(12);
      cell.setCellValue("상세주소");
      
      cell = row.createCell(13);
      cell.setCellValue("거래처분류");
      
      cell = row.createCell(14);
      cell.setCellValue("거래처등록일");
      
      cell = row.createCell(15);
      cell.setCellValue("메모");
      
      cell = row.createCell(16);
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
	          cell.setCellValue(accountVo.getCompany_code());
	          
	          cell = row.createCell(2);
	          cell.setCellValue(accountVo.getAccount_name());
	          
	          cell = row.createCell(3);
	          cell.setCellValue(accountVo.getAccount_registration_number());
	          
	          cell = row.createCell(4);
	          cell.setCellValue(accountVo.getAccount_corporate_registration_number());
	          
	          cell = row.createCell(5);
	          cell.setCellValue(accountVo.getAccount_representative());
	          
	          cell = row.createCell(6);
	          cell.setCellValue(accountVo.getAccount_phone());
	          
	          cell = row.createCell(7);
	          cell.setCellValue(accountVo.getAccount_pax_number());
	          
	          cell = row.createCell(8);
	          cell.setCellValue(accountVo.getAccount_email());
	          
	          cell = row.createCell(9);
	          cell.setCellValue(accountVo.getAccount_email_tax());
	          
	          cell = row.createCell(10);
	          cell.setCellValue(accountVo.getAccount_post_number());
	          
	          cell = row.createCell(11);
	          cell.setCellValue(accountVo.getAccount_address());
	          
	          cell = row.createCell(12);
	          cell.setCellValue(accountVo.getAccount_address_detail());
	          
	          cell = row.createCell(13);
	          cell.setCellValue(accountVo.getAccount_category());
	          
	          cell = row.createCell(14);
//			  SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
//			  Date date = formatter.parse(accountVo.getAccount_registration());
	          cell.setCellValue(accountVo.getAccount_registration());
	          
	          cell = row.createCell(15);
	          cell.setCellValue(accountVo.getAccount_memo());
	          
	          cell = row.createCell(16);
	          cell.setCellValue(accountVo.getAccount_registration_jpg());
    	  }
      }

      // 컨텐츠 타입과 파일명 지정
      response.setContentType("ms-vnd/excel");
//      response.setHeader("Content-Disposition", "attachment;filename=example.xls");
      response.setHeader("Content-Disposition", "attachment;filename=accountInfo.xlsx");

      // Excel File Output
      wb.write(response.getOutputStream());
      wb.close();
  }
  
//  @RequestMapping(value = "/execl/read_excel", method = RequestMethod.POST)
  @RequestMapping("/excel/read_excel")
  public String excelUpload( @RequestParam("excelFile") MultipartFile excelFile )
			throws Exception {
	  
	  	System.out.println("업로드되니");
		if (excelFile == null || excelFile.isEmpty()) {
			throw new RuntimeException("엑셀파일을 선택 해 주세요.");
		}

		String extension = FilenameUtils.getExtension(excelFile.getOriginalFilename());
		if (!extension.equals("xlsx")) {
			throw new IOException("등록된 양식에 엑셀파일만 업로드 해주세요.");
		}

		// 해당경로를 실제 경로로...
		String finalFilePath = "/uploadFilesWms/" + excelFile.getOriginalFilename();
		File destFile = new File(finalFilePath);
		try {
			excelFile.transferTo(destFile);
		} catch (IllegalStateException | IOException e) {
			throw new RuntimeException(e.getMessage(), e);
		}

		Workbook workbook = null;
		if ( extension.equals("xlsx") ) {

			InputStream is = new FileInputStream(finalFilePath);
			workbook = new XSSFWorkbook(is);
		}

		Sheet worksheet = workbook.getSheetAt(0);

		List<AccountVo> list = new ArrayList<AccountVo>();
		System.out.println(worksheet.getPhysicalNumberOfRows());

		// 0~3까지는 사용자 인풋값이 아님
		for (int i = 1; i < worksheet.getPhysicalNumberOfRows(); i++) { // 4

			Row row = worksheet.getRow(i);

			AccountVo dto = new AccountVo();
			
			if (row.getCell(0) != null) {
				System.out.println(row.getCell(0).getStringCellValue());
				dto.setAccount_code(row.getCell(0).getStringCellValue());
			}else {
				
			}
			
			// 번호는 필수입력사항입니다. 필수입력사항이 입력되었을 때만 list에 add
			if (row.getCell(1) != null) {
				dto.setCompany_code(row.getCell(1).getStringCellValue());
			}

			// 번호는 필수입력사항입니다. 필수입력사항이 입력되었을 때만 list에 add
			if (row.getCell(2) != null) {
				dto.setAccount_name(row.getCell(2).getStringCellValue());
			}
			
			if (row.getCell(3) != null) {
				dto.setAccount_registration_number(row.getCell(3).getStringCellValue());
			}
			
			if (row.getCell(4) != null) {
				dto.setAccount_corporate_registration_number(row.getCell(4).getStringCellValue());
			}
			
			if (row.getCell(5) != null) {
				dto.setAccount_representative(row.getCell(5).getStringCellValue());
			}
			
			if (row.getCell(6) != null) {
				dto.setAccount_phone(row.getCell(6).getStringCellValue());
			}
			
			if (row.getCell(7) != null) {
				dto.setAccount_pax_number(row.getCell(7).getStringCellValue());
			}
			
			if (row.getCell(8) != null) {
				dto.setAccount_email(row.getCell(8).getStringCellValue());
			}
			
			if (row.getCell(9) != null) {
//				System.out.println(row.getCell(8).getStringCellValue());
//				System.out.println(row.getCell(8).getStringCellValue().getClass().getName());
				dto.setAccount_email_tax(row.getCell(9).getStringCellValue());
			}
			if (row.getCell(10) != null) {
				if (row.getCell(10).getCellType() == CellType.NUMERIC) {
//					System.out.println("여길것같네1");
//					System.out.println(Integer.toString((int)row.getCell(9).getNumericCellValue()));
//					System.out.println(Integer.toString((int)row.getCell(9).getNumericCellValue()).getClass().getName());
					dto.setAccount_post_number(14434);
				}
			}
			
			if (row.getCell(11) != null) {
				dto.setAccount_address(row.getCell(11).getStringCellValue());
			}
			
			if (row.getCell(12) != null) {
				dto.setAccount_address_detail(row.getCell(12).getStringCellValue());
			}
			
			if (row.getCell(13) != null) {
				dto.setAccount_category(row.getCell(13).getStringCellValue());
			}
			
			if (row.getCell(14) != null) {
//				System.out.println("데이트오니?");
//				 SimpleDateFormat formatter = new SimpleDateFormat("yyyy년 MM월 dd일 HH시 mm분 ss초");
//				 Date date = formatter.parse(row.getCell(13).getStringCellValue());
//				 System.out.println(date);
				 Date dateN = new Date();
				dto.setAccount_registration(dateN);
			}
			
			if (row.getCell(15) != null) {
				dto.setAccount_memo(row.getCell(15).getStringCellValue());
			}
			
			if (row.getCell(16) != null) {
				dto.setAccount_registration_jpg(row.getCell(16).getStringCellValue());
			}
			
			list.add(dto);

		}

		// 임시저장 삭제
		/**
		 * @TODO test 해야함 !!
		 */
		destFile.delete();
		
		System.out.println(list);
		for(AccountVo accountVo : list) {
			System.out.println(accountVo.getAccount_code());
			accountService.insertAccountInfo(accountVo);
		}
		return "redirect:/account/accountInfoPage";
	}

  	
	
}

