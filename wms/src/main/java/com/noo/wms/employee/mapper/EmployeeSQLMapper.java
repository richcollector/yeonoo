package com.noo.wms.employee.mapper;

import java.net.PasswordAuthentication;
import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.noo.wms.vo.AccountVo;
import com.noo.wms.vo.EmployeeVo;
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

public interface EmployeeSQLMapper {
	//발주 불러오기
	public ArrayList<PurchaseVo> purchaseInfo(@Param("searchType") String searchType, 
											@Param("searchWord") String searchWord,
											@Param("startList") int startList,
											@Param("company_code") String company_code
											);
	
	public int purchaseInfoCount(@Param("searchType") String searchType, 
								@Param("searchWord") String searchWord,
								@Param("company_code") String company_code
								);
	
	//발주 등록하기
	public void insertPurchaseInfo(PurchaseVo purchaseVo);
	
	//발주 수정하기
	public PurchaseVo selectPurchaseInfo(PurchaseVo purchase_code);
	public void updatePurchaseInfo(PurchaseVo purchaseVo);
	
	//발주 삭제하기
	public void deletePurchaseInfo(PurchaseVo purchase_code);
	
	//발주 디테일 불러오기
	public ArrayList<PurchaseDetailVo> purchaseDetailInfo(@Param("searchType") String searchType, 
											@Param("searchWord") String searchWord,
											@Param("startList") int startList,
											@Param("purchase_code") String purchase_code
											);
	
	public int purchaseDetailInfoCount(@Param("searchType") String searchType, 
										@Param("searchWord") String searchWord,
										@Param("purchase_code") String purchase_code
										);
	
	//발주 디테일 등록하기
	public void insertPurchaseDetailInfo(PurchaseDetailVo purchaseDetailVo);
	
	//발주 디테일 수정하기
	public PurchaseDetailVo selectPurchaseDetailInfo(PurchaseDetailVo purchase_detail_code);
	public void updatePurchaseDetailInfo(PurchaseDetailVo purchaseDetailVo);
	
	//발주 디테일 삭제하기
	public void deletePurchaseDetailInfo(PurchaseDetailVo purchase_detail_code);
	
	
	
	
	
	
	
	
	
	
	//상품 불러오기
	public ArrayList<ProductVo> productInfo(@Param("searchType") String searchType, 
											@Param("searchWord") String searchWord,
											@Param("startList") int startList,
											@Param("company_code") String company_code
											);
	
	public int productInfoCount(@Param("searchType") String searchType, 
								@Param("searchWord") String searchWord,
								@Param("company_code") String company_code
								);
	
	//상품 엑셀 값
	public ProductVo excelProductSelect(String product_code);
	
	//상품 등록하기
	public void insertProductInfo(ProductVo productVo);
	
	//상품 수정하기
	public ProductVo selectProductInfo(ProductVo product_code);
	public void updateProductInfo(ProductVo productVo);
	
	//상품 삭제하기
	public void deleteProductInfo(ProductVo product_code);
	
	


	
	//수주 불러오기
	public ArrayList<ObtainOrderVo> obtainOrderInfo(@Param("searchType") String searchType, 
											@Param("searchWord") String searchWord,
											@Param("startList") int startList,
											@Param("company_code") String company_code
											);
	
	public int obtainOrderInfoCount(@Param("searchType") String searchType, 
								@Param("searchWord") String searchWord,
								@Param("company_code") String company_code
								);
	
	//수주 등록하기
	public void insertObtainOrderInfo(ObtainOrderVo obtainOrderVo);
	
	//수주 수정하기
	public ObtainOrderVo selectObtainOrderInfo(ObtainOrderVo obtain_order_code);
	public void updateObtainOrderInfo(ObtainOrderVo obtainOrderVo);
	
	//수주 삭제하기
	public void deleteObtainOrderInfo(ObtainOrderVo obtain_order_code);
	
	//수주디테일 불러오기
	public ArrayList<ObtainOrderDetailVo> obtainOrderDetailInfo(@Param("searchType") String searchType, 
											@Param("searchWord") String searchWord,
											@Param("startList") int startList,
											@Param("obtain_order_code") String obtain_order_code
											);
	
	public int obtainOrderDetailInfoCount(@Param("searchType") String searchType, 
								@Param("searchWord") String searchWord,
								@Param("obtain_order_code") String obtain_order_code
								);
	
	//수주디테일 등록하기
	public void insertObtainOrderDetailInfo(ObtainOrderDetailVo obtainOrderDetailVo);
	
	//수주디테일 수정하기
	public ObtainOrderDetailVo selectObtainOrderDetailInfo(ObtainOrderDetailVo obtain_order_detail_code);
	public void updateObtainOrderDetailInfo(ObtainOrderDetailVo obtainOrderDetailVo);
	
	//수주디테일 삭제하기
	public void deleteObtainOrderDetailInfo(ObtainOrderDetailVo obtain_order_detail_code);
	
	
	
	
	//생산 불러오기
	public ArrayList<ManufactureVo> manufactureInfo(@Param("searchType") String searchType, 
											@Param("searchWord") String searchWord,
											@Param("startList") int startList,
											@Param("company_code") String company_code
											);
	
	public int manufactureInfoCount(@Param("searchType") String searchType, 
								@Param("searchWord") String searchWord,
								@Param("company_code") String company_code
								);
	
	//생산 등록하기
	public void insertManufactureInfo(ManufactureVo manufactureVo);
	
	//생산 수정하기
	public ManufactureVo selectManufactureInfo(ManufactureVo manufacture_code);
	public void updateManufactureInfo(ManufactureVo manufactureVo);
	
	//생산 삭제하기
	public void deleteManufactureInfo(ManufactureVo manufacture_code);
	
	//생산 디테일 불러오기
	public ArrayList<ManufactureDetailVo> manufactureDetailInfo(@Param("searchType") String searchType, 
											@Param("searchWord") String searchWord,
											@Param("startList") int startList,
											@Param("manufacture_code") String manufacture_code
									
											);
	
	public int manufactureInfoDetailCount(@Param("searchType") String searchType, 
										@Param("searchWord") String searchWord,
										@Param("manufacture_code") String manufacture_code
										);
	
	//생산 디테일 등록하기
	public void insertManufactureDetailInfo(ManufactureDetailVo manufactureDetailVo);
	
	//생산 디테일 수정하기
	public ManufactureDetailVo selectManufactureDetailInfo(ManufactureDetailVo manufacture_detail_code);
	public void updateManufactureDetailInfo(ManufactureDetailVo manufactureDetailVo);
	
	//생산 디테일 삭제하기
	public void deleteManufactureDetailInfo(ManufactureDetailVo manufacture_detail_code);
	
	
	
	
	
	
	
	
	//출하 불러오기
	public ArrayList<OutboundVo> outboundInfo(@Param("searchType") String searchType, 
											@Param("searchWord") String searchWord,
											@Param("startList") int startList,
											@Param("company_code") String company_code
											);
	
	public int outboundInfoCount(@Param("searchType") String searchType, 
								@Param("searchWord") String searchWord,
								@Param("company_code") String company_code
								);
	
	//출하 등록하기
	public void insertOutboundInfo(OutboundVo outboundVo);
	
	//출하 수정하기
	public OutboundVo selectOutboundInfo(OutboundVo outbound_code);
	public void updateOutboundInfo(OutboundVo outboundVo);
	
	//출하 삭제하기
	public void deleteOutboundInfo(OutboundVo outbound_code);
	
	//출하 디테일 불러오기
	public ArrayList<OutboundDetailVo> outboundDetailInfo(@Param("searchType") String searchType, 
											@Param("searchWord") String searchWord,
											@Param("startList") int startList,
											@Param("outbound_code") String outbound_code
											);
	
	public int outboundDetailInfoCount(@Param("searchType") String searchType, 
								@Param("searchWord") String searchWord,
								@Param("outbound_code") String outbound_code
								);
	
	//출하 디테일 등록하기
	public void insertOutboundDetailInfo(OutboundDetailVo outboundDetailVo);
	
	//출하 디테일 수정하기
	public OutboundDetailVo selectOutboundDetailInfo(OutboundDetailVo outbound_detail_code);
	public void updateOutboundDetailInfo(OutboundDetailVo outboundDetailVo);
	
	//출하 디테일 삭제하기
	public void deleteOutboundDetailInfo(OutboundDetailVo outbound_detail_code);
	
	
	
	
	
	
	
	//제품단가 불러오기
	public ArrayList<ProductPriceVo> productPriceInfo(@Param("searchType") String searchType, 
											@Param("searchWord") String searchWord,
											@Param("startList") int startList,
											@Param("company_code") String company_code
											);
	
	public int productPriceInfoCount(@Param("searchType") String searchType, 
								@Param("searchWord") String searchWord,
								@Param("company_code") String company_code
								);
	
	//제품단가 등록하기
	public void insertProductPriceInfo(ProductPriceVo productPriceVo);
	
	//제품단가 수정하기
	public ProductPriceVo selectProductPriceInfo(ProductPriceVo product_price_code);
	public void updateProductPriceInfo(ProductPriceVo productPriceVo);
	
	//제품단가 삭제하기
	public void deleteProductPriceInfo(ProductPriceVo product_price_code);

	public EmployeeVo selectEmployeeByEmailAndPw(EmployeeVo employeeVo);
	
	public void insertPasswordAuth(PasswordAuthVo passoAuthVo);
	
	public PasswordAuthVo selectPasswordAuth(String password_auth_key);
	
	public void deletePasswordAuth(String password_auth_key);
	
	public void updatePassword(EmployeeVo employeeVo);
}
