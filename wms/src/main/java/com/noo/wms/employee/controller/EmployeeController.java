package com.noo.wms.employee.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FilenameUtils;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellType;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.noo.wms.employee.service.EmployeeServiceImpl;
import com.noo.wms.vo.AccountVo;
import com.noo.wms.vo.ProductPriceVo;
import com.noo.wms.vo.ProductVo;
import com.noo.wms.vo.PurchaseVo;

@Controller
@RequestMapping("/employee/*")
public class EmployeeController {
	
	@Autowired
	private EmployeeServiceImpl employeeService;
	
	@RequestMapping("findInfoPage")
	public String findInfoPage(Model model, String searchType, String searchWord,
			@RequestParam(value="pageNum", defaultValue = "1") int pageNum) {
		
		return "/employee/findInfoPage";
	}
	
	@RequestMapping("purchaseInfoPage")
	public String purchaseInfoPage(Model model, String searchType, String searchWord,
			@RequestParam(value="pageNum", defaultValue = "1") int pageNum) {
//	System.out.println("발주걍컨");
//	System.out.println(searchType);
//	System.out.println(searchWord);
//	System.out.println(pageNum);
//	
//	ArrayList<PurchaseVo> purchaseList = employeeService.purchaseInfo(searchType , searchWord, pageNum);
//	
//	int orderCount = employeeService.purchaseInfoCount(searchType, searchWord);
//	
//	//올림처리
//	int totalPageCount = (int)Math.ceil(orderCount/10.0);
//	
//	int startPage = ((pageNum-1)/5)*5 + 1;
//	int endPage = ((pageNum-1)/5+1)*5;
//	
//	if(endPage > totalPageCount) {
//	endPage = totalPageCount;
//	}
//	
//	model.addAttribute("startPage",startPage);
//	model.addAttribute("endPage",endPage);
//	model.addAttribute("currentPageNum",pageNum);
//	model.addAttribute("totalPageCount",totalPageCount);
//	
//	//링크유지
//	String additionalParam = "";
//	if(searchType != null && searchWord != null) {
//	additionalParam += "&searchType=" +searchType;
//	additionalParam += "&searchWord=" +searchWord;
//	}
//	
//	model.addAttribute("additionalParam",additionalParam);
//	
//	
//	
//	model.addAttribute("purchaseList", purchaseList);
		
		return "/employee/purchaseInfoPage";
	}
	
	@RequestMapping("outboundInfoPage")
	public String outboundInfoPage(Model model, String searchType, String searchWord,
			@RequestParam(value="pageNum", defaultValue = "1") int pageNum) {
		
		return "/employee/outboundInfoPage";
	}
	
	@RequestMapping("obtainOrderInfoPage")
	public String obtainOrderInfoPage(Model model, String searchType, String searchWord,
			@RequestParam(value="pageNum", defaultValue = "1") int pageNum) {
		
		return "/employee/obtainOrderInfoPage";
	}
	
	@RequestMapping("manufactureInfoPage")
	public String manufactureInfoPage(Model model, String searchType, String searchWord,
			@RequestParam(value="pageNum", defaultValue = "1") int pageNum) {
		
		return "/employee/manufactureInfoPage";
	}
	
	@RequestMapping("productInfoPage")
	public String productInfoPage(Model model, String searchType, String searchWord,
			@RequestParam(value="pageNum", defaultValue = "1") int pageNum) {
		
		return "/employee/productInfoPage";
	}
	
	  @RequestMapping("product/excel/download")
	  public void excelDownload(HttpServletResponse response, String [] code) throws IOException {
//	      Workbook wb = new HSSFWorkbook();
	  	
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
	      cell.setCellValue("제품코드");
	      
	      cell = row.createCell(1);
	      cell.setCellValue("회사코드");
	      
	      cell = row.createCell(2);
	      cell.setCellValue("제품이름");
	      
	      cell = row.createCell(3);
	      cell.setCellValue("제품사이즈");
	      
	      cell = row.createCell(4);
	      cell.setCellValue("제품버전");
	      
	      cell = row.createCell(5);
	      cell.setCellValue("제품타입");
	      
	      cell = row.createCell(6);
	      cell.setCellValue("제품등록일");
	      
	      cell = row.createCell(7);
	      cell.setCellValue("제품등록자");
	      
	      cell = row.createCell(8);
	      cell.setCellValue("제품수정일");
	      
	      cell = row.createCell(9);
	      cell.setCellValue("제품수정자");
	      
	      cell = row.createCell(10);
	      cell.setCellValue("메모");
	      
	      
	      // Body
	      
	      for (String codeNum : code) {
	    	  
	    	  
	    	  if(!codeNum.isEmpty()) {
	    	  
	      	
		      	ProductVo productVo = employeeService.excelProductSelect(codeNum);
		      	System.out.println("for문안");
		      	System.out.println("이거시" + codeNum);
		      	
		          row = sheet.createRow(rowNum++);
		          
		          cell = row.createCell(0);
		          cell.setCellValue(productVo.getProduct_code());
		          
		          cell = row.createCell(1);
		          cell.setCellValue(productVo.getCompany_code());
		          
		          cell = row.createCell(2);
		          cell.setCellValue(productVo.getProduct_name());
		          
		          cell = row.createCell(3);
		          cell.setCellValue(productVo.getProduct_size());
		          
		          cell = row.createCell(4);
		          cell.setCellValue(productVo.getProduct_version());
		          
		          cell = row.createCell(5);
		          cell.setCellValue(productVo.getProduct_type());
		          
		          cell = row.createCell(6);
		          cell.setCellValue(productVo.getProduct_register_date());
		          
		          cell = row.createCell(7);
		          cell.setCellValue(productVo.getProduct_register_employee());
		          
		          cell = row.createCell(8);
		          cell.setCellValue(productVo.getProduct_update_date());
		          
		          cell = row.createCell(9);
		          cell.setCellValue(productVo.getProduct_update_employee());
		          
		          cell = row.createCell(10);
		          cell.setCellValue(productVo.getProduct_memo());
		          
		          System.out.println("메모" + productVo.getProduct_memo());
	    	  }
	      }
	      
	      // 컨텐츠 타입과 파일명 지정
	      response.setContentType("ms-vnd/excel");
//	      response.setHeader("Content-Disposition", "attachment;filename=example.xls");
	      response.setHeader("Content-Disposition", "attachment;filename=productInfo.xlsx");

	      // Excel File Output
	      wb.write(response.getOutputStream());
	      wb.close();
	      System.out.println("여기까진오니");
	      
	  }
	  
	//  @RequestMapping(value = "/execl/read_excel", method = RequestMethod.POST)
	  @RequestMapping("product/excel/read_excel")
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

			List<ProductVo> list = new ArrayList<ProductVo>();
			System.out.println(worksheet.getPhysicalNumberOfRows());

			// 0~3까지는 사용자 인풋값이 아님
			for (int i = 1; i < worksheet.getPhysicalNumberOfRows(); i++) { // 4

				Row row = worksheet.getRow(i);

				ProductVo dto = new ProductVo();
				
				if (row.getCell(0) != null) {
					System.out.println(row.getCell(0).getStringCellValue());
					dto.setProduct_code(row.getCell(0).getStringCellValue());
				}else {
					
				}
				
				// 번호는 필수입력사항입니다. 필수입력사항이 입력되었을 때만 list에 add
				if (row.getCell(1) != null) {
					dto.setCompany_code(row.getCell(1).getStringCellValue());
				}

				// 번호는 필수입력사항입니다. 필수입력사항이 입력되었을 때만 list에 add
				if (row.getCell(2) != null) {
					dto.setProduct_name(row.getCell(2).getStringCellValue());
				}
				
				if (row.getCell(3) != null) {
//					dto.setProduct_size(row.getCell(3).getStringCellValue());
					dto.setProduct_size(100);
				}
				
				if (row.getCell(4) != null) {
//					dto.setProduct_version(row.getCell(4).getStringCellValue());
					dto.setProduct_version(5);
				}
				
				if (row.getCell(5) != null) {
					dto.setProduct_type(row.getCell(5).getStringCellValue());
				}
				
				if (row.getCell(6) != null) {
					Date dateN = new Date();
//					dto.setProduct_register_date(row.getCell(6).getStringCellValue());
					dto.setProduct_register_date(dateN);
				}
				
				if (row.getCell(7) != null) {
					dto.setProduct_register_employee(row.getCell(7).getStringCellValue());
				}
				
				if (row.getCell(8) != null) {
					Date dateN = new Date();
//					dto.setProduct_update_date(row.getCell(8).getStringCellValue());
					dto.setProduct_update_date(dateN);
				}
				
				if (row.getCell(9) != null) {
//					System.out.println(row.getCell(8).getStringCellValue());
//					System.out.println(row.getCell(8).getStringCellValue().getClass().getName());
					dto.setProduct_update_employee(row.getCell(9).getStringCellValue());
				}
				
				if (row.getCell(10) != null) {
					dto.setProduct_memo(row.getCell(10).getStringCellValue());
				}
				
				list.add(dto);

			}

			// 임시저장 삭제
			/**
			 * @TODO test 해야함 !!
			 */
			destFile.delete();
			
			System.out.println(list);
			for(ProductVo productVo : list) {
				System.out.println(productVo.getCompany_code());
				employeeService.insertProductInfo(productVo);
			}
			return "redirect:/employee/productInfoPage";
		}
	  
	  @RequestMapping("productPrice/excel/download")
	  public void priceExcelDownload(HttpServletResponse response, String [] code) throws IOException {
//	      Workbook wb = new HSSFWorkbook();
	  	
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
	      cell.setCellValue("제품단가코드");
	      
	      cell = row.createCell(1);
	      cell.setCellValue("회사코드");
	      
	      cell = row.createCell(2);
	      cell.setCellValue("제품코드");
	      
	      cell = row.createCell(3);
	      cell.setCellValue("제품명");
	      
	      cell = row.createCell(4);
	      cell.setCellValue("제품구매단가");
	      
	      cell = row.createCell(5);
	      cell.setCellValue("제품구매일");
	      
	      cell = row.createCell(6);
	      cell.setCellValue("제품판매단가");
	      
	      cell = row.createCell(7);
	      cell.setCellValue("제품판매일");
	      
	      cell = row.createCell(8);
	      cell.setCellValue("비고");
	      
	      
	      // Body
	      
	      for (String codeNum : code) {
	    	  
	    	  
	    	  if(!codeNum.isEmpty()) {
	    	  
	      	
		      	ProductPriceVo productPriceVo = employeeService.excelProductPriceSelect(codeNum);
		      	System.out.println("for문안");
		      	System.out.println("이거시" + codeNum);
		      	
		          row = sheet.createRow(rowNum++);
		          
		          cell = row.createCell(0);
		          cell.setCellValue(productPriceVo.getProduct_price_code());
		          
		          cell = row.createCell(1);
		          cell.setCellValue(productPriceVo.getCompany_code());
		          
		          cell = row.createCell(2);
		          cell.setCellValue(productPriceVo.getProduct_code());
		          
		          cell = row.createCell(3);
		          cell.setCellValue(productPriceVo.getProduct_name());
		          
		          cell = row.createCell(4);
		          cell.setCellValue(productPriceVo.getProduct_price_purchase());
		          
		          cell = row.createCell(5);
		          cell.setCellValue(productPriceVo.getProduct_price_purchase_date());
		          
		          cell = row.createCell(6);
		          cell.setCellValue(productPriceVo.getProduct_price_selling());
		          
		          cell = row.createCell(7);
		          cell.setCellValue(productPriceVo.getProduct_price_selling_date());
		          
		          cell = row.createCell(8);
		          cell.setCellValue(productPriceVo.getProduct_price_memo());
		          
		          System.out.println("메모" + productPriceVo.getProduct_price_memo());
	    	  }
	      }
	      
	      // 컨텐츠 타입과 파일명 지정
	      response.setContentType("ms-vnd/excel");
//	      response.setHeader("Content-Disposition", "attachment;filename=example.xls");
	      response.setHeader("Content-Disposition", "attachment;filename=productPriceInfo.xlsx");

	      // Excel File Output
	      wb.write(response.getOutputStream());
	      wb.close();
	      System.out.println("여기까진오니");
	      
	  }
	      
	      
	      
	      
	
	@RequestMapping("productPriceInfoPage")
	public String productPriceInfoPage(Model model, String searchType, String searchWord,
			@RequestParam(value="pageNum", defaultValue = "1") int pageNum) {
		
		return "/employee/productPriceInfoPage";
	}

}
