package com.noo.wms.employee.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
