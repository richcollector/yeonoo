package com.noo.wms.employee.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.UUID;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.apache.commons.math3.stat.descriptive.summary.Product;
import org.apache.poi.ss.formula.functions.Today;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import com.noo.wms.account.mapper.AccountSQLMapper;
import com.noo.wms.employee.mapper.EmployeeSQLMapper;
import com.noo.wms.vo.AccountVo;
import com.noo.wms.vo.AdminVo;
import com.noo.wms.vo.EmployeeVo;
import com.noo.wms.vo.MailAuthVo;
import com.noo.wms.vo.ManufactureDetailVo;
import com.noo.wms.vo.ManufactureVo;
import com.noo.wms.vo.ObtainOrderDetailVo;
import com.noo.wms.vo.ObtainOrderVo;
import com.noo.wms.vo.OutboundDetailVo;
import com.noo.wms.vo.OutboundVo;
import com.noo.wms.vo.PasswordAuthVo;
import com.noo.wms.vo.ProductPriceVo;
import com.noo.wms.vo.ProductVo;
import com.noo.wms.vo.PurchaseDetailVo;
import com.noo.wms.vo.PurchaseVo;

@Service
public class EmployeeServiceImpl {
	
	@Autowired
	private EmployeeSQLMapper employeeSQLMapper;
	
	@Autowired
	private JavaMailSender javaMailSender; 
	
	//공통
	public ArrayList<ProductVo> findProductNumName (String productName, String company_code) {
		ArrayList<ProductVo> productList = employeeSQLMapper.findProductNumName(productName, company_code);
		
		return productList;
	}
	
	public ArrayList<AccountVo> findAccountNum (String accountName, String company_code) {
		ArrayList<AccountVo> productList = employeeSQLMapper.findAccountNum(accountName, company_code);
		
		return productList;
	}
	
	
	//발주
	public ArrayList<PurchaseVo> purchaseInfo(String searchType, String searchWord, int pageNum, String company_code){
		
		int startList = (pageNum-1)*15;
		
		ArrayList<PurchaseVo> purchaseList = employeeSQLMapper.purchaseInfo(searchType , searchWord, startList, company_code);
		return purchaseList;
	}
	
	public int purchaseInfoCount(String searchType, String searchWord, String company_code){
		int purchaseList = employeeSQLMapper.purchaseInfoCount(searchType , searchWord, company_code);
		
		return purchaseList;
	}
	
	public void insertPurchaseInfo(PurchaseVo purchaseVo) {
		employeeSQLMapper.insertPurchaseInfo(purchaseVo);
	}
	
	public PurchaseVo selectPurchaseInfo (PurchaseVo purchase_code) {
		
		return employeeSQLMapper.selectPurchaseInfo(purchase_code);
	}
	
	public void updatePurchaseInfo(PurchaseVo purchaseVo) {
		employeeSQLMapper.updatePurchaseInfo(purchaseVo);
	}
	
	public void deletePurchaseInfo (PurchaseVo purchase_code) {
		employeeSQLMapper.deletePurchaseInfo(purchase_code);
	}
	
	//발주 디테일
	public ArrayList<PurchaseDetailVo> purchaseDetailInfo(String searchType, String searchWord, int pageNum, String purchase_code){
		
		int startList = (pageNum-1)*15;
		
		ArrayList<PurchaseDetailVo> purchaseDetailList = employeeSQLMapper.purchaseDetailInfo(searchType , searchWord, startList, purchase_code);
		return purchaseDetailList;
	}
	
	public int purchaseDetailInfoCount(String searchType, String searchWord, String purchase_code){
		int purchaseDetailList = employeeSQLMapper.purchaseDetailInfoCount(searchType , searchWord, purchase_code);
		
		return purchaseDetailList;
	}
	
	public void insertPurchaseDetailInfo(HttpSession session, PurchaseDetailVo purchaseDetailVo) {
		employeeSQLMapper.insertPurchaseDetailInfo(purchaseDetailVo);

		EmployeeVo employeeInfo = (EmployeeVo)session.getAttribute("employeeInfo");
		AdminVo adminInfo = (AdminVo)session.getAttribute("adminInfo");
		
		ArrayList<ProductPriceVo> productPriceList = 
		employeeSQLMapper.getProductPriceInfo(purchaseDetailVo.getProduct_code());
		
		int length = productPriceList.size()-1;
		
		Date time = new Date();
		
		ProductPriceVo productPriceVo = new ProductPriceVo();
		
		if(adminInfo != null) {
			productPriceVo.setCompany_code(adminInfo.getCompany_code());
		}
		
		if(employeeInfo != null) {
			productPriceVo.setCompany_code(employeeInfo.getCompany_code());
		}
		
		productPriceVo.setProduct_code(purchaseDetailVo.getProduct_code());
		productPriceVo.setProduct_name(purchaseDetailVo.getProduct_name());
		productPriceVo.setProduct_price_selling(purchaseDetailVo.getProduct_price());
		productPriceVo.setProduct_price_selling_date(time);
		
		if(productPriceList.isEmpty()) {
			productPriceVo.setProduct_price_purchase(0);
			productPriceVo.setProduct_price_purchase_date(time);
			productPriceVo.setProduct_price_memo("");
		}else {
			productPriceVo.setProduct_price_purchase(productPriceList.get(length).getProduct_price_purchase());
			productPriceVo.setProduct_price_purchase_date(productPriceList.get(length).getProduct_price_purchase_date());
			productPriceVo.setProduct_price_memo(productPriceList.get(length).getProduct_price_memo());
		}

		employeeSQLMapper.insertPurchaceProductPrice(productPriceVo);
		
	}
	
	public PurchaseDetailVo selectPurchaseDetailInfo (PurchaseDetailVo purchase_detail_code) {
		return employeeSQLMapper.selectPurchaseDetailInfo(purchase_detail_code);
	}
	
	public void updatePurchaseDetailInfo(HttpSession session, PurchaseDetailVo purchaseDetailVo) {
		employeeSQLMapper.updatePurchaseDetailInfo(purchaseDetailVo);
		
		EmployeeVo employeeInfo = (EmployeeVo)session.getAttribute("employeeInfo");
		AdminVo adminInfo = (AdminVo)session.getAttribute("adminInfo");
		
		ArrayList<ProductPriceVo> productPriceList = 
		employeeSQLMapper.getProductPriceInfo(purchaseDetailVo.getProduct_code());
		
		int length = productPriceList.size()-1;

		Date time = new Date();
		
		ProductPriceVo productPriceVo = new ProductPriceVo();
		
		if(adminInfo != null) {
			productPriceVo.setCompany_code(adminInfo.getCompany_code());
		}
		
		if(employeeInfo != null) {
			productPriceVo.setCompany_code(employeeInfo.getCompany_code());
		}
		
		productPriceVo.setProduct_code(purchaseDetailVo.getProduct_code());
		productPriceVo.setProduct_name(purchaseDetailVo.getProduct_name());
		productPriceVo.setProduct_price_purchase(purchaseDetailVo.getProduct_price());
		productPriceVo.setProduct_price_purchase_date(time);
		
		if(productPriceList.isEmpty()) {
			productPriceVo.setProduct_price_selling(0);
			productPriceVo.setProduct_price_selling_date(time);
			productPriceVo.setProduct_price_memo("");
		}else {
			productPriceVo.setProduct_price_selling(productPriceList.get(length).getProduct_price_selling());
			productPriceVo.setProduct_price_selling_date(productPriceList.get(length).getProduct_price_selling_date());
			productPriceVo.setProduct_price_memo(productPriceList.get(length).getProduct_price_memo());
		}

		employeeSQLMapper.insertPurchaceProductPrice(productPriceVo);
		
		
	}
	
	public void deletePurchaseDetailInfo (PurchaseDetailVo purchase_detail_code) {
		employeeSQLMapper.deletePurchaseDetailInfo(purchase_detail_code);
	}
	
	//제품
	public ArrayList<ProductVo> productInfo(String searchType, String searchWord, int pageNum, String company_code){
		
		int startList = (pageNum-1)*15;
		
		ArrayList<ProductVo> productList = employeeSQLMapper.productInfo(searchType , searchWord, startList, company_code);
		return productList;
	}
	
	public int productInfoCount(String searchType, String searchWord, String company_code){
		int productList = employeeSQLMapper.productInfoCount(searchType , searchWord, company_code);
		
		return productList;
	}
	
	public ProductVo excelProductSelect(String product_code) {
		ProductVo productVo = employeeSQLMapper.excelProductSelect(product_code);
		
		return productVo;
	};
	
	public void insertProductInfo(ProductVo productVo) {
		employeeSQLMapper.insertProductInfo(productVo);
	}
	
	public ProductVo selectProductInfo (ProductVo product_code) {
		
		return employeeSQLMapper.selectProductInfo(product_code);
	}
	
	public void updateProductInfo(ProductVo productVo) {
		System.out.println("업데이투 서비스");
		System.out.println(productVo);
		System.out.println(productVo.getProduct_code());
		employeeSQLMapper.updateProductInfo(productVo);
	}
	
	public void deleteProductInfo (ProductVo product_code) {
		employeeSQLMapper.deleteProductInfo(product_code);
	}
	
	//수주
	public ArrayList<ObtainOrderVo> obtainOrderInfo(String searchType, String searchWord, int pageNum, String company_code){
		
		int startList = (pageNum-1)*15;
		
		ArrayList<ObtainOrderVo> obtainOrderList = employeeSQLMapper.obtainOrderInfo(searchType , searchWord, startList, company_code);
		return obtainOrderList;
	}
	
	public int obtainOrderInfoCount(String searchType, String searchWord, String company_code){
		int obtainOrderList = employeeSQLMapper.obtainOrderInfoCount(searchType , searchWord, company_code);
		
		return obtainOrderList;
	}
	
	
	public void insertObtainOrderInfo(ObtainOrderVo obtainOrderVo) {
		System.out.println("뭐가문제니");
		System.out.println(obtainOrderVo);
		employeeSQLMapper.insertObtainOrderInfo(obtainOrderVo);
	}
	
	public ObtainOrderVo selectObtainOrderInfo (ObtainOrderVo obtain_order_code) {
		
		return employeeSQLMapper.selectObtainOrderInfo(obtain_order_code);
	}
	
	public void updateObtainOrderInfo(ObtainOrderVo obtainOrderVo) {
		System.out.println("업데이투 서비스");
		System.out.println(obtainOrderVo);
		System.out.println(obtainOrderVo.getObtain_order_code());
		employeeSQLMapper.updateObtainOrderInfo(obtainOrderVo);
	}
	
	public void deleteObtainOrderInfo (ObtainOrderVo obtain_order_code) {
		employeeSQLMapper.deleteObtainOrderInfo(obtain_order_code);
	}
	
	//수주디테일
	public ArrayList<ObtainOrderDetailVo> obtainOrderDetailInfo(String searchType, String searchWord, int pageNum, String obtain_order_code){
		
		int startList = (pageNum-1)*15;
		System.out.println("수디숫" + obtain_order_code);
		ArrayList<ObtainOrderDetailVo> obtainOrderDetailList = employeeSQLMapper.obtainOrderDetailInfo(searchType , searchWord, startList, obtain_order_code);
		
		return obtainOrderDetailList;
	}
	
	public int obtainOrderDetailInfoCount(String searchType, String searchWord, String obtain_order_code){
		int obtainOrderDetailList = employeeSQLMapper.obtainOrderDetailInfoCount(searchType , searchWord, obtain_order_code);
		
		return obtainOrderDetailList;
	}
	
	public void insertObtainOrderDetailInfo(HttpSession session, ObtainOrderDetailVo obtainOrderDetailVo) {
		employeeSQLMapper.insertObtainOrderDetailInfo(obtainOrderDetailVo);
		
		EmployeeVo employeeInfo = (EmployeeVo)session.getAttribute("employeeInfo");
		AdminVo adminInfo = (AdminVo)session.getAttribute("adminInfo");
		
		ArrayList<ProductPriceVo> productPriceList = 
		employeeSQLMapper.getProductPriceInfo(obtainOrderDetailVo.getProduct_code());
		
		int length = productPriceList.size()-1;

		Date time = new Date();
		
		ProductPriceVo productPriceVo = new ProductPriceVo();
		
		if(adminInfo != null) {
			productPriceVo.setCompany_code(adminInfo.getCompany_code());
		}
		
		if(employeeInfo != null) {
			productPriceVo.setCompany_code(employeeInfo.getCompany_code());
		}
		
		productPriceVo.setProduct_code(obtainOrderDetailVo.getProduct_code());
		productPriceVo.setProduct_name(obtainOrderDetailVo.getProduct_name());
		productPriceVo.setProduct_price_purchase(obtainOrderDetailVo.getProduct_price());
		productPriceVo.setProduct_price_purchase_date(time);
		
		if(productPriceList.isEmpty()) {
			productPriceVo.setProduct_price_selling(0);
			productPriceVo.setProduct_price_selling_date(time);
			productPriceVo.setProduct_price_memo("");
		}else {
			productPriceVo.setProduct_price_selling(productPriceList.get(length).getProduct_price_selling());
			productPriceVo.setProduct_price_selling_date(productPriceList.get(length).getProduct_price_selling_date());
			productPriceVo.setProduct_price_memo(productPriceList.get(length).getProduct_price_memo());
		}

		employeeSQLMapper.insertObtainProductPrice(productPriceVo);
	}
	
	public ObtainOrderDetailVo selectObtainOrderDetailInfo (ObtainOrderDetailVo obtain_order_detail_code) {
		return employeeSQLMapper.selectObtainOrderDetailInfo(obtain_order_detail_code);
	}
	
	public void updateObtainOrderDetailInfo(HttpSession session, ObtainOrderDetailVo obtainOrderDetailVo) {
		employeeSQLMapper.updateObtainOrderDetailInfo(obtainOrderDetailVo);
		
		EmployeeVo employeeInfo = (EmployeeVo)session.getAttribute("employeeInfo");
		AdminVo adminInfo = (AdminVo)session.getAttribute("adminInfo");
		
		ArrayList<ProductPriceVo> productPriceList = 
		employeeSQLMapper.getProductPriceInfo(obtainOrderDetailVo.getProduct_code());
		
		int length = productPriceList.size()-1;

		Date time = new Date();
		
		ProductPriceVo productPriceVo = new ProductPriceVo();
		
		if(adminInfo != null) {
			productPriceVo.setCompany_code(adminInfo.getCompany_code());
		}
		
		if(employeeInfo != null) {
			productPriceVo.setCompany_code(employeeInfo.getCompany_code());
		}
		
		productPriceVo.setProduct_code(obtainOrderDetailVo.getProduct_code());
		productPriceVo.setProduct_name(obtainOrderDetailVo.getProduct_name());
		productPriceVo.setProduct_price_purchase(obtainOrderDetailVo.getProduct_price());
		productPriceVo.setProduct_price_purchase_date(time);
		
		if(productPriceList.isEmpty()) {
			productPriceVo.setProduct_price_selling(0);
			productPriceVo.setProduct_price_selling_date(time);
			productPriceVo.setProduct_price_memo("");
		}else {
			productPriceVo.setProduct_price_selling(productPriceList.get(length).getProduct_price_selling());
			productPriceVo.setProduct_price_selling_date(productPriceList.get(length).getProduct_price_selling_date());
			productPriceVo.setProduct_price_memo(productPriceList.get(length).getProduct_price_memo());
		}

		employeeSQLMapper.insertObtainProductPrice(productPriceVo);
	}
	
	public void deleteObtainOrderDetailInfo (ObtainOrderDetailVo obtain_order_detail_code) {
		employeeSQLMapper.deleteObtainOrderDetailInfo(obtain_order_detail_code);
	}
	

	
	
	

	//생산
	public ArrayList<ManufactureVo> manufactureInfo(String searchType, String searchWord, int pageNum, String company_code){
		
		int startList = (pageNum-1)*15;
		
		ArrayList<ManufactureVo> manufactureList = employeeSQLMapper.manufactureInfo(searchType , searchWord, startList, company_code);
		return manufactureList;
	}
	
	public int manufactureInfoCount(String searchType, String searchWord, String company_code){
		int manufactureList = employeeSQLMapper.manufactureInfoCount(searchType , searchWord, company_code);
		
		return manufactureList;
	}
	
	public void insertManufactureInfo(ManufactureVo manufactureVo) {
		employeeSQLMapper.insertManufactureInfo(manufactureVo);
	}
	
	public ManufactureVo selectManufactureInfo (ManufactureVo manufacture_code) {
		
		return employeeSQLMapper.selectManufactureInfo(manufacture_code);
	}
	
	public void updateManufactureInfo(ManufactureVo manufactureVo) {
		System.out.println("업데이투 서비스");
		System.out.println(manufactureVo);
		System.out.println(manufactureVo.getManufacture_code());
		employeeSQLMapper.updateManufactureInfo(manufactureVo);
	}
	
	public void deleteManufactureInfo (ManufactureVo manufacture_code) {
		employeeSQLMapper.deleteManufactureInfo(manufacture_code);
	}
	
	//생산디테일
	public ArrayList<ManufactureDetailVo> manufactureDetailInfo(String searchType, String searchWord, int pageNum, String manufacture_code){
		
		int startList = (pageNum-1)*15;
		
		ArrayList<ManufactureDetailVo> manufactureDetailList = employeeSQLMapper.manufactureDetailInfo(searchType , searchWord, startList, manufacture_code);
		return manufactureDetailList;
	}
	
	public int manufactureInfoDetailCount(String searchType, String searchWord, String manufacture_code){
		int manufactureDetailList = employeeSQLMapper.manufactureInfoDetailCount(searchType , searchWord, manufacture_code);
		
		return manufactureDetailList;
	}
	
	public void insertManufactureDetailInfo(ManufactureDetailVo manufactureDetailVo) {
		employeeSQLMapper.insertManufactureDetailInfo(manufactureDetailVo);
	}
	
	public ManufactureDetailVo selectManufactureDetailInfo (ManufactureDetailVo manufacture_detail_code) {
		
		return employeeSQLMapper.selectManufactureDetailInfo(manufacture_detail_code);
	}
	
	public void updateManufactureDetailInfo(ManufactureDetailVo manufactureDetailVo) {
		System.out.println("업데이투 서비스");
		System.out.println(manufactureDetailVo);
		System.out.println(manufactureDetailVo.getManufacture_detail_code());
		employeeSQLMapper.updateManufactureDetailInfo(manufactureDetailVo);
	}
	
	public void deleteManufactureDetailInfo (ManufactureDetailVo manufacture_detail_code) {
		employeeSQLMapper.deleteManufactureDetailInfo(manufacture_detail_code);
	}
	
	//출하
	public ArrayList<OutboundVo> outboundInfo(String searchType, String searchWord, int pageNum, String company_code){
		
		int startList = (pageNum-1)*15;
		
		ArrayList<OutboundVo> outboundList = employeeSQLMapper.outboundInfo(searchType , searchWord, startList, company_code);
		return outboundList;
	}
	
	public int outboundInfoCount(String searchType, String searchWord, String company_code){
		int outboundList = employeeSQLMapper.outboundInfoCount(searchType , searchWord, company_code);
		
		return outboundList;
	}
	
	public void insertOutboundInfo(OutboundVo outboundVo) {
		employeeSQLMapper.insertOutboundInfo(outboundVo);
	}
	
	public OutboundVo selectOutboundInfo (OutboundVo outbound_code) {
		
		return employeeSQLMapper.selectOutboundInfo(outbound_code);
	}
	
	public void updateOutboundInfo(OutboundVo outboundVo) {
		System.out.println("업데이투 서비스");
		System.out.println(outboundVo);
		System.out.println(outboundVo.getOutbound_code());
		employeeSQLMapper.updateOutboundInfo(outboundVo);
	}
	
	public void deleteOutboundInfo (OutboundVo outbound_code) {
		employeeSQLMapper.deleteOutboundInfo(outbound_code);
	}
	
	//출하 디테일
	public ArrayList<OutboundDetailVo> outboundDetailInfo(String searchType, String searchWord, int pageNum, String outbound_code){
		
		int startList = (pageNum-1)*15;
		
		ArrayList<OutboundDetailVo> outboundDetailList = employeeSQLMapper.outboundDetailInfo(searchType , searchWord, startList, outbound_code);
		return outboundDetailList;
	}
	
	public int outboundDetailInfoCount(String searchType, String searchWord, String outbound_code){
		int outboundDetailList = employeeSQLMapper.outboundDetailInfoCount(searchType , searchWord, outbound_code);
		
		return outboundDetailList;
	}
	
	public void insertOutboundDetailInfo(OutboundDetailVo outboundDetailVo) {
		employeeSQLMapper.insertOutboundDetailInfo(outboundDetailVo);
	}
	
	public OutboundDetailVo selectOutboundDetailInfo (OutboundDetailVo outbound_detail_code) {
		
		return employeeSQLMapper.selectOutboundDetailInfo(outbound_detail_code);
	}
	
	public void updateOutboundDetailInfo(OutboundDetailVo outboundDetailVo) {
		System.out.println("업데이투 서비스");
		System.out.println(outboundDetailVo);
		System.out.println(outboundDetailVo.getOutbound_code());
		employeeSQLMapper.updateOutboundDetailInfo(outboundDetailVo);
	}
	
	public void deleteOutboundDetailInfo (OutboundDetailVo outbound_detail_code) {
		employeeSQLMapper.deleteOutboundDetailInfo(outbound_detail_code);
	}
	
	//제품 단가
	public ArrayList<ProductPriceVo> productPriceInfo(String searchType, String searchWord, int pageNum, String company_code){
		
		int startList = (pageNum-1)*15;
		
		ArrayList<ProductPriceVo> productPriceList = employeeSQLMapper.productPriceInfo(searchType , searchWord, startList, company_code);
		return productPriceList;
	}
	
	public int productPriceInfoCount(String searchType, String searchWord, String company_code){
		int productPriceList = employeeSQLMapper.productPriceInfoCount(searchType , searchWord, company_code);
		
		return productPriceList;
	}
	
	public ProductPriceVo excelProductPriceSelect(String product_price_code) {
		ProductPriceVo productPriceVo = employeeSQLMapper.excelProductPriceSelect(product_price_code);
		
		return productPriceVo;
	};
	
	public void insertProductPriceInfo(ProductPriceVo productPriceVo) {
		employeeSQLMapper.insertProductPriceInfo(productPriceVo);
	}
	
	public ProductPriceVo selectProductPriceInfo (ProductPriceVo product_price_code) {
		
		return employeeSQLMapper.selectProductPriceInfo(product_price_code);
	}
	
	public void updateProductPriceInfo(ProductPriceVo productPriceVo) {
		System.out.println("업데이투 서비스");
		System.out.println(productPriceVo);
		System.out.println(productPriceVo.getProduct_price_code());
		employeeSQLMapper.updateProductPriceInfo(productPriceVo);
	}
	
	public void deleteProductPriceInfo (ProductPriceVo product_price_code) {
		employeeSQLMapper.deleteProductPriceInfo(product_price_code);
	}
	
	public boolean selectEmployeeByEmailAndPw(EmployeeVo employeeVo) {
		boolean result = false;
		
		if(employeeSQLMapper.selectEmployeeByEmailAndPw(employeeVo) != null) {
			result = true;
			
			//인증 메일 전송.... 
			try {
				MimeMessage mimeMessage = javaMailSender.createMimeMessage();
				MimeMessageHelper mimeMessageHelper = new MimeMessageHelper(mimeMessage,true,"UTF-8");  
				
				mimeMessageHelper.setSubject("[WMS] 인증번호입니다.");
				
				String uuid = UUID.randomUUID().toString();
				
				String text = "";
				text += "<h1>[WMS] 인증번호입니다.</h1>";
				//text += "인증 번호 :" + uuid;
				text += "아래 인증번호를 입력해주세요.<br>";
				text += uuid;
				
				mimeMessageHelper.setText(text , true);
				mimeMessageHelper.setFrom("admin", "wms 관리자");
				mimeMessageHelper.setTo(employeeVo.getEmployee_email());			
				
				//javaMailSender.send(mimeMessage); //쓰레드로 처리...
				new MailSenderThread(javaMailSender,mimeMessage).start();
				
				
				PasswordAuthVo passwordAuthVo = new PasswordAuthVo();
				passwordAuthVo.setPassword_auth_key(uuid);
				employeeSQLMapper.insertPasswordAuth(passwordAuthVo);
				
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		
		return result;
	}
	
	//인증 메일 확인
	public void mailAuth(String password_auth_key) {
		employeeSQLMapper.selectPasswordAuth(password_auth_key);
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
	
	public boolean selectPasswordAuth(String password_auth_key) {
		boolean result = false;
		
		if(employeeSQLMapper.selectPasswordAuth(password_auth_key) != null) {
			employeeSQLMapper.deletePasswordAuth(password_auth_key);
			result = true;
		}

		return result;
	}
	
	public void updatePassword(EmployeeVo employeeVo) {
		employeeSQLMapper.updatePassword(employeeVo);
	}
}
