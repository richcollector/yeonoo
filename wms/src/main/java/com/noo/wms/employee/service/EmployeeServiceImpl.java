package com.noo.wms.employee.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.noo.wms.account.mapper.AccountSQLMapper;
import com.noo.wms.employee.mapper.EmployeeSQLMapper;
import com.noo.wms.vo.AccountVo;
import com.noo.wms.vo.ManufactureDetailVo;
import com.noo.wms.vo.ManufactureVo;
import com.noo.wms.vo.ObtainOrderVo;
import com.noo.wms.vo.OutboundDetailVo;
import com.noo.wms.vo.OutboundVo;
import com.noo.wms.vo.ProductPriceVo;
import com.noo.wms.vo.ProductVo;
import com.noo.wms.vo.PurchaseDetailVo;
import com.noo.wms.vo.PurchaseVo;

@Service
public class EmployeeServiceImpl {
	
	@Autowired
	private EmployeeSQLMapper employeeSQLMapper;
	
	//발주
	public ArrayList<PurchaseVo> purchaseInfo(String searchType, String searchWord, int pageNum, String company_code){
		
		int startList = (pageNum-1)*10;
		
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
		
		int startList = (pageNum-1)*10;
		
		ArrayList<PurchaseDetailVo> purchaseDetailList = employeeSQLMapper.purchaseDetailInfo(searchType , searchWord, startList, purchase_code);
		return purchaseDetailList;
	}
	
	public int purchaseDetailInfoCount(String searchType, String searchWord, String purchase_code){
		int purchaseDetailList = employeeSQLMapper.purchaseDetailInfoCount(searchType , searchWord, purchase_code);
		
		return purchaseDetailList;
	}
	
	
	
	public void insertPurchaseDetailInfo(PurchaseDetailVo purchaseDetailVo) {
		employeeSQLMapper.insertPurchaseDetailInfo(purchaseDetailVo);
	}
	
	public PurchaseDetailVo selectPurchaseDetailInfo (PurchaseDetailVo purchase_detail_code) {
		
		return employeeSQLMapper.selectPurchaseDetailInfo(purchase_detail_code);
	}
	
	public void updatePurchaseDetailInfo(PurchaseDetailVo purchaseDetailVo) {
		employeeSQLMapper.updatePurchaseDetailInfo(purchaseDetailVo);
	}
	
	public void deletePurchaseDetailInfo (PurchaseDetailVo purchase_detail_code) {
		employeeSQLMapper.deletePurchaseDetailInfo(purchase_detail_code);
	}
	
	
	
	
	
	
	
	
	//상품
	public ArrayList<ProductVo> productInfo(String searchType, String searchWord, int pageNum, String company_code){
		
		int startList = (pageNum-1)*15;
		
		ArrayList<ProductVo> productList = employeeSQLMapper.productInfo(searchType , searchWord, startList, company_code);
		return productList;
	}
	
	public int productInfoCount(String searchType, String searchWord, String company_code){
		int productList = employeeSQLMapper.productInfoCount(searchType , searchWord, company_code);
		
		return productList;
	}
	
	
	
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
		
		int startList = (pageNum-1)*10;
		
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
	
	
	
	
	
	//생산
	public ArrayList<ManufactureVo> manufactureInfo(String searchType, String searchWord, int pageNum, String company_code){
		
		int startList = (pageNum-1)*10;
		
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
		
		int startList = (pageNum-1)*10;
		
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
		
		int startList = (pageNum-1)*10;
		
		ArrayList<ProductPriceVo> productPriceList = employeeSQLMapper.productPriceInfo(searchType , searchWord, startList, company_code);
		return productPriceList;
	}
	
	public int productPriceInfoCount(String searchType, String searchWord, String company_code){
		int productPriceList = employeeSQLMapper.productPriceInfoCount(searchType , searchWord, company_code);
		
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
