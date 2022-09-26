package com.noo.wms.employee.service;

import java.util.ArrayList;

import org.apache.commons.math3.stat.descriptive.summary.Product;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.noo.wms.account.mapper.AccountSQLMapper;
import com.noo.wms.employee.mapper.EmployeeSQLMapper;
import com.noo.wms.vo.AccountVo;
import com.noo.wms.vo.ManufactureVo;
import com.noo.wms.vo.ObtainOrderDetailVo;
import com.noo.wms.vo.ObtainOrderVo;
import com.noo.wms.vo.OutboundVo;
import com.noo.wms.vo.ProductPriceVo;
import com.noo.wms.vo.ProductVo;
import com.noo.wms.vo.PurchaseVo;

@Service
public class EmployeeServiceImpl {
	
	@Autowired
	private EmployeeSQLMapper employeeSQLMapper;
	
	//발주
	public ArrayList<PurchaseVo> purchaseInfo(String searchType, String searchWord, int pageNum){
		
		int startList = (pageNum-1)*15;
		
		ArrayList<PurchaseVo> purchaseList = employeeSQLMapper.purchaseInfo(searchType , searchWord, startList);
		return purchaseList;
	}
	
	public int purchaseInfoCount(String searchType, String searchWord){
		int purchaseList = employeeSQLMapper.purchaseInfoCount(searchType , searchWord);
		
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
	
	
	
	//상품
	public ArrayList<ProductVo> productInfo(String searchType, String searchWord, int pageNum){
		
		int startList = (pageNum-1)*15;
		
		ArrayList<ProductVo> productList = employeeSQLMapper.productInfo(searchType , searchWord, startList);
		return productList;
	}
	
	public int productInfoCount(String searchType, String searchWord){
		int productList = employeeSQLMapper.productInfoCount(searchType , searchWord);
		
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
	public ArrayList<ObtainOrderVo> obtainOrderInfo(String searchType, String searchWord, int pageNum){
		
		int startList = (pageNum-1)*15;
		
		ArrayList<ObtainOrderVo> obtainOrderList = employeeSQLMapper.obtainOrderInfo(searchType , searchWord, startList);
		return obtainOrderList;
	}
	
	public int obtainOrderInfoCount(String searchType, String searchWord){
		int obtainOrderList = employeeSQLMapper.obtainOrderInfoCount(searchType , searchWord);
		
		return obtainOrderList;
	}
	
	
	public void insertObtainOrderInfo(ObtainOrderVo obtainOrderVo) {
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
	
	
	public void insertObtainOrderDetailInfo(ObtainOrderDetailVo obtainOrderDetailVo) {
		employeeSQLMapper.insertObtainOrderDetailInfo(obtainOrderDetailVo);
	}
	
	public ObtainOrderDetailVo selectObtainOrderDetailInfo (ObtainOrderDetailVo obtain_order_detail_code) {
		System.out.println("디테일 셀렉트 서비스");
		return employeeSQLMapper.selectObtainOrderDetailInfo(obtain_order_detail_code);
	}
	
	public void updateObtainOrderDetailInfo(ObtainOrderDetailVo obtainOrderDetailVo) {
		System.out.println("업데이투 서비스");
		System.out.println(obtainOrderDetailVo);
		employeeSQLMapper.updateObtainOrderDetailInfo(obtainOrderDetailVo);
	}
	
	public void deleteObtainOrderDetailInfo (ObtainOrderDetailVo obtain_order_detail_code) {
		employeeSQLMapper.deleteObtainOrderDetailInfo(obtain_order_detail_code);
	}
	
	
	
	
	
	//생산
	public ArrayList<ManufactureVo> manufactureInfo(String searchType, String searchWord, int pageNum){
		
		int startList = (pageNum-1)*15;
		
		ArrayList<ManufactureVo> manufactureList = employeeSQLMapper.manufactureInfo(searchType , searchWord, startList);
		return manufactureList;
	}
	
	public int manufactureInfoCount(String searchType, String searchWord){
		int manufactureList = employeeSQLMapper.manufactureInfoCount(searchType , searchWord);
		
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
	
	
	
	
	
	//출하
	public ArrayList<OutboundVo> outboundInfo(String searchType, String searchWord, int pageNum){
		
		int startList = (pageNum-1)*15;
		
		ArrayList<OutboundVo> outboundList = employeeSQLMapper.outboundInfo(searchType , searchWord, startList);
		return outboundList;
	}
	
	public int outboundInfoCount(String searchType, String searchWord){
		int outboundList = employeeSQLMapper.outboundInfoCount(searchType , searchWord);
		
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
	
	
	
	
	
	
	//제품 단가
	public ArrayList<ProductPriceVo> productPriceInfo(String searchType, String searchWord, int pageNum){
		
		int startList = (pageNum-1)*15;
		
		ArrayList<ProductPriceVo> productPriceList = employeeSQLMapper.productPriceInfo(searchType , searchWord, startList);
		return productPriceList;
	}
	
	public int productPriceInfoCount(String searchType, String searchWord){
		int productPriceList = employeeSQLMapper.productPriceInfoCount(searchType , searchWord);
		
		return productPriceList;
	}
	
	
	
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
}
