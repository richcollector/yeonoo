package com.noo.wms.employee.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.net.ssl.HttpsURLConnection;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.noo.wms.account.service.AccountServiceImpl;
import com.noo.wms.employee.service.EmployeeServiceImpl;
import com.noo.wms.vo.AccountVo;
import com.noo.wms.vo.AdminVo;
import com.noo.wms.vo.EmployeeVo;
import com.noo.wms.vo.ManufactureDetailVo;
import com.noo.wms.vo.ManufactureVo;
import com.noo.wms.vo.ObtainOrderDetailVo;
import com.noo.wms.vo.ObtainOrderVo;
import com.noo.wms.vo.OutboundDetailVo;
import com.noo.wms.vo.OutboundVo;
import com.noo.wms.vo.ProductPriceVo;
import com.noo.wms.vo.ProductVo;
import com.noo.wms.vo.PurchaseDetailVo;
import com.noo.wms.vo.PurchaseVo;

@RestController
@RequestMapping("/employee/*")
public class EmployeeRestController {
	
	@Autowired
	private EmployeeServiceImpl employeeService;
	
	//발주
	@RequestMapping("purchaseInfo")
	public HashMap<String, Object> purchaseInfo(HttpSession session, Model model, String searchType, String searchWord,
									@RequestParam(value="pageNum", defaultValue = "1") int pageNum) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		
		String company_code = null;
		
		AdminVo adminInfo = (AdminVo)session.getAttribute("adminInfo");
		EmployeeVo employeeInfo = (EmployeeVo)session.getAttribute("employeeInfo");
		
		if(adminInfo != null) {
			company_code = adminInfo.getCompany_code();
		}
		
		if(employeeInfo != null) {
			company_code = employeeInfo.getCompany_code();
		}
		
		ArrayList<PurchaseVo> purchaseList = employeeService.purchaseInfo(searchType , searchWord, pageNum, company_code);

		
		int orderCount = employeeService.purchaseInfoCount(searchType, searchWord, company_code);
		
		//올림처리
		int totalPageCount = (int)Math.ceil(orderCount/15.0);

		int startPage = ((pageNum-1)/5)*5 + 1;
		int endPage = ((pageNum-1)/5+1)*5;
		
		if(endPage > totalPageCount) {
			endPage = totalPageCount;
		}
		
		map.put("startPage", startPage);
		map.put("endPage", endPage);
		map.put("currentPageNum", pageNum);
		map.put("totalPageCount", totalPageCount);
		
		//링크유지
		String additionalParamType = "";
		String additionalParamWord = "";
		if(searchType != null && searchWord != null) {
			additionalParamType +=  searchType;
			additionalParamWord += searchWord;
		}
		map.put("additionalParamType", additionalParamType);
		map.put("additionalParamWord", additionalParamWord);
		map.put("purchaseList", purchaseList);
		map.put("result", "success");
		
		return map;
	}
	
	@RequestMapping("insertPurchaseInfo")
	public HashMap<String, Object> insertPurchaseInfo(PurchaseVo purchaseVo) {
		System.out.println("들어오니");
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("result", "success");
		
		employeeService.insertPurchaseInfo(purchaseVo);
		
		return map;
	}
	
	@RequestMapping("selectPurchaseInfo")
	public PurchaseVo selectPurchaseInfo(PurchaseVo purchase_code) {
		PurchaseVo purchaseVo =  employeeService.selectPurchaseInfo(purchase_code);
		
		return purchaseVo;
	}

	@RequestMapping("updatePurchaseInfo")
	public HashMap<String, Object> updatePurchaseInfo(PurchaseVo purchaseVo) {
		System.out.println("업데이투");
		System.out.println(purchaseVo);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("result", "success");
		
		employeeService.updatePurchaseInfo(purchaseVo);
		
		return map;
	}
	
	@RequestMapping("deletePurchaseInfo")
	public HashMap<String, Object> deletePurchaseInfo(String [] code) {
		
		for (String codeNum : code) {
			PurchaseVo purchase_code = new PurchaseVo();
			purchase_code.setPurchase_code(codeNum);
			employeeService.deletePurchaseInfo(purchase_code);
		}
		
		System.out.println("들어옴??");
		System.out.println(code);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("result", "success");
		
		return map;
	}
	
	
	//발주 디테일
	@RequestMapping("purchaseDetailInfo")
	public HashMap<String, Object> purchaseDetailInfo(HttpSession session, Model model, String searchType, String searchWord,
									@RequestParam(value="pageNum", defaultValue = "1") int pageNum, String purchase_code) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		ArrayList<PurchaseDetailVo> purchaseDetailList = employeeService.purchaseDetailInfo(searchType , searchWord, pageNum, purchase_code);

		
		int orderCount = employeeService.purchaseDetailInfoCount(searchType, searchWord, purchase_code);
		
		//올림처리
		int totalPageCount = (int)Math.ceil(orderCount/15.0);

		int startPage = ((pageNum-1)/5)*5 + 1;
		int endPage = ((pageNum-1)/5+1)*5;
		
		if(endPage > totalPageCount) {
			endPage = totalPageCount;
		}
		
		map.put("startPage", startPage);
		map.put("endPage", endPage);
		map.put("currentPageNum", pageNum);
		map.put("totalPageCount", totalPageCount);
		
		//링크유지
		String additionalParamType = "";
		String additionalParamWord = "";
		if(searchType != null && searchWord != null) {
			additionalParamType +=  searchType;
			additionalParamWord += searchWord;
		}
		map.put("additionalParamType", additionalParamType);
		map.put("additionalParamWord", additionalParamWord);
		map.put("purchaseDetailList", purchaseDetailList);
		map.put("result", "success");
		session.setAttribute("purchase_code", purchase_code);
		
		return map;
	}
	
	@RequestMapping("insertPurchaseDetailInfo")
	public HashMap<String, Object> insertPurchaseDetailInfo(HttpSession session, PurchaseDetailVo purchaseDetailVo) {
		System.out.println("들어오니");
		employeeService.insertPurchaseDetailInfo(purchaseDetailVo);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("result", "success");
		
		map.put("purchase_code", session.getAttribute("purchase_code"));
		
		return map;
	}
	
	@RequestMapping("selectPurchaseDetailInfo")
	public PurchaseDetailVo selectPurchaseDetailInfo(PurchaseDetailVo purchase_detail_code) {
		PurchaseDetailVo purchaseDetailVo =  employeeService.selectPurchaseDetailInfo(purchase_detail_code);
		
		return purchaseDetailVo;
	}

	@RequestMapping("updatePurchaseDetailInfo")
	public HashMap<String, Object> updatePurchaseDetailInfo(PurchaseDetailVo purchaseDetailVo) {
		System.out.println("업데이투");
		System.out.println(purchaseDetailVo);
		employeeService.updatePurchaseDetailInfo(purchaseDetailVo);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("result", "success");
		
		return map;
	}
	
	@RequestMapping("deletePurchaseDetailInfo")
	public HashMap<String, Object> deletePurchaseDetailInfo(HttpSession session, String [] code) {
		
		for (String codeNum : code) {
			PurchaseDetailVo purchaseDetailVo = new PurchaseDetailVo();
			purchaseDetailVo.setPurchase_detail_code(codeNum);
			employeeService.deletePurchaseDetailInfo(purchaseDetailVo);
		}
		
		System.out.println("들어옴??");
		System.out.println(code);
		
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("result", "success");
		map.put("purchase_code", session.getAttribute("purchase_code"));
		
		return map;
	}
	
	
	
	
	
	
	
	
	
	
	//제품
	@RequestMapping("productInfo")
	public HashMap<String, Object> productInfo(HttpSession session, Model model, String searchType, String searchWord,
									@RequestParam(value="pageNum", defaultValue = "1") int pageNum) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		String company_code = null;
		
		AdminVo adminInfo = (AdminVo)session.getAttribute("adminInfo");
		EmployeeVo employeeInfo = (EmployeeVo)session.getAttribute("employeeInfo");
		
		if(adminInfo != null) {
			company_code = adminInfo.getCompany_code();
		}
		
		if(employeeInfo != null) {
			company_code = employeeInfo.getCompany_code();
		}
		
		
		ArrayList<ProductVo> productList = employeeService.productInfo(searchType , searchWord, pageNum, company_code);

		
		int orderCount = employeeService.productInfoCount(searchType, searchWord, company_code);
		
		//올림처리
		int totalPageCount = (int)Math.ceil(orderCount/15.0);

		int startPage = ((pageNum-1)/5)*5 + 1;
		int endPage = ((pageNum-1)/5+1)*5;
		
		if(endPage > totalPageCount) {
			endPage = totalPageCount;
		}
		
		map.put("startPage", startPage);
		map.put("endPage", endPage);
		map.put("currentPageNum", pageNum);
		map.put("totalPageCount", totalPageCount);
		
		//링크유지
		String additionalParamType = "";
		String additionalParamWord = "";
		if(searchType != null && searchWord != null) {
			additionalParamType +=  searchType;
			additionalParamWord += searchWord;
		}
		map.put("additionalParamType", additionalParamType);
		map.put("additionalParamWord", additionalParamWord);
		map.put("productList", productList);
		
		return map;
	}
	
	@RequestMapping("insertProductInfo")
	public HashMap<String, Object> insertProductInfo(ProductVo productVo) {
		System.out.println("들어오니");
		employeeService.insertProductInfo(productVo);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("result", "success");
		
		return map;
	}
	
	@RequestMapping("selectProductInfo")
	public ProductVo selectProductInfo(ProductVo product_code) {
		ProductVo productVo =  employeeService.selectProductInfo(product_code);
		
		return productVo;
	}

	@RequestMapping("updateProductInfo")
	public HashMap<String, Object> updateProductInfo(ProductVo productVo) {
		System.out.println("업데이투");
		System.out.println(productVo);
		System.out.println(productVo.getProduct_code());
		employeeService.updateProductInfo(productVo);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("result", "success");
		
		return map;
	}
	
	@RequestMapping("deleteProductInfo")
	public HashMap<String, Object> deleteProductInfo(String [] code) {
		
		for (String codeNum : code) {
			ProductVo product_code = new ProductVo();
			product_code.setProduct_code(codeNum);
			employeeService.deleteProductInfo(product_code);
		}
		
		System.out.println("들어옴??");
		System.out.println(code);
		
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("result", "success");
		
		return map;
	}
	
	
	
	
	//수주
	@RequestMapping("obtainOrderInfo")
	public HashMap<String, Object> obtainOrderInfo(HttpSession session, Model model, String searchType, String searchWord,
									@RequestParam(value="pageNum", defaultValue = "1") int pageNum) {
		
		System.out.println("수주래컨");
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		String company_code = null;
		
		AdminVo adminInfo = (AdminVo)session.getAttribute("adminInfo");
		EmployeeVo employeeInfo = (EmployeeVo)session.getAttribute("employeeInfo");
		
		if(adminInfo != null) {
			company_code = adminInfo.getCompany_code();
		}
		
		if(employeeInfo != null) {
			company_code = employeeInfo.getCompany_code();
		}
		
		
		ArrayList<ObtainOrderVo> obtainOrderList = employeeService.obtainOrderInfo(searchType , searchWord, pageNum, company_code);

		
		int orderCount = employeeService.obtainOrderInfoCount(searchType, searchWord, company_code);
		
		//올림처리
		int totalPageCount = (int)Math.ceil(orderCount/15.0);

		int startPage = ((pageNum-1)/5)*5 + 1;
		int endPage = ((pageNum-1)/5+1)*5;
		
		if(endPage > totalPageCount) {
			endPage = totalPageCount;
		}
		
		map.put("startPage", startPage);
		map.put("endPage", endPage);
		map.put("currentPageNum", pageNum);
		map.put("totalPageCount", totalPageCount);
		
		//링크유지
		String additionalParamType = "";
		String additionalParamWord = "";
		if(searchType != null && searchWord != null) {
			additionalParamType +=  searchType;
			additionalParamWord += searchWord;
		}
		map.put("additionalParamType", additionalParamType);
		map.put("additionalParamWord", additionalParamWord);
		map.put("obtainOrderList", obtainOrderList);
		map.put("result", "success");
		
		return map;
	}
	
	@RequestMapping("insertObtainOrderInfo")
	public HashMap<String, Object> insertObtainOrderInfo(ObtainOrderVo obtainOrderVo) {
		System.out.println("들어오니");
		employeeService.insertObtainOrderInfo(obtainOrderVo);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("result", "success");
		
		return map;
	}
	
	@RequestMapping("selectObtainOrderInfo")
	public ObtainOrderVo selectObtainOrderInfo(ObtainOrderVo obtain_order_code) {
		ObtainOrderVo obtainOrderVo =  employeeService.selectObtainOrderInfo(obtain_order_code);
		
		return obtainOrderVo;
	}

	@RequestMapping("updateObtainOrderInfo")
	public HashMap<String, Object> updateObtainOrderInfo(ObtainOrderVo obtainOrderVo) {
		System.out.println("업데이투");
		System.out.println(obtainOrderVo);
		employeeService.updateObtainOrderInfo(obtainOrderVo);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("result", "success");
		
		return map;
	}
	
	@RequestMapping("deleteObtainOrderInfo")
	public HashMap<String, Object> deleteObtainOrderInfo(String [] code) {
		
		for (String codeNum : code) {
			ObtainOrderVo obtain_order_code = new ObtainOrderVo();
			obtain_order_code.setObtain_order_code(codeNum);
			employeeService.deleteObtainOrderInfo(obtain_order_code);
		}
		
		System.out.println("들어옴??");
		System.out.println(code);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("result", "success");
		
		return map;
	}
	
	
	
	
	
	//수주디테일
	@RequestMapping("obtainOrderDetailInfo")
	public HashMap<String, Object> obtainOrderDetailInfo(HttpSession session, Model model, String searchType, String searchWord,
									@RequestParam(value="pageNum", defaultValue = "1") int pageNum, String obtain_order_code) {
		
		System.out.println("수주디테일래컨");
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		ArrayList<ObtainOrderDetailVo> obtainOrderDetailList = employeeService.obtainOrderDetailInfo(searchType , searchWord, pageNum, obtain_order_code);

		
		int orderCount = employeeService.obtainOrderDetailInfoCount(searchType, searchWord, obtain_order_code);
		
		//올림처리
		int totalPageCount = (int)Math.ceil(orderCount/15.0);

		int startPage = ((pageNum-1)/5)*5 + 1;
		int endPage = ((pageNum-1)/5+1)*5;
		
		if(endPage > totalPageCount) {
			endPage = totalPageCount;
		}
		
		
		map.put("startPage", startPage);
		map.put("endPage", endPage);
		map.put("currentPageNum", pageNum);
		map.put("totalPageCount", totalPageCount);
		
		//링크유지
		String additionalParamType = "";
		String additionalParamWord = "";
		if(searchType != null && searchWord != null) {
			additionalParamType +=  searchType;
			additionalParamWord += searchWord;
		}
		map.put("additionalParamType", additionalParamType);
		map.put("additionalParamWord", additionalParamWord);
		map.put("obtainOrderDetailList", obtainOrderDetailList);
		map.put("result", "success");
		session.setAttribute("obtain_order_code", obtain_order_code);
		
		return map;
	}
	
	@RequestMapping("insertObtainOrderDetailInfo")
	public HashMap<String, Object> insertObtainOrderInfo(HttpSession session, ObtainOrderDetailVo obtainOrderDetailVo) {
		System.out.println("들어오니");
		employeeService.insertObtainOrderDetailInfo(obtainOrderDetailVo);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("result", "success");

		
		map.put("obtain_order_code", session.getAttribute("obtain_order_code"));
		
		return map;
	}
	
	@RequestMapping("selectObtainOrderDetailInfo")
	public ObtainOrderDetailVo selectObtainOrderDetailInfo(ObtainOrderDetailVo obtain_order_detail_code) {
		
		ObtainOrderDetailVo obtainOrderDetailVo =  employeeService.selectObtainOrderDetailInfo(obtain_order_detail_code);
		return obtainOrderDetailVo;
	}

	@RequestMapping("updateObtainOrderDatailInfo")
	public HashMap<String, Object> updateObtainOrderDatailInfo(ObtainOrderDetailVo obtainOrderDetailVo) {
		
		System.out.println("업데이투 들어오니");
		System.out.println(obtainOrderDetailVo);
		System.out.println(obtainOrderDetailVo.getObtain_order_detail_code());
		
		employeeService.updateObtainOrderDetailInfo(obtainOrderDetailVo);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("result", "success");
		
		return map;
	}
	
	@RequestMapping("deleteObtainOrderDetailInfo")
	public HashMap<String, Object> deleteObtainOrderDetailInfo(HttpSession session, String [] code) {
		
		for (String codeNum : code) {
			ObtainOrderDetailVo obtainOrderDetailVo = new ObtainOrderDetailVo();
			obtainOrderDetailVo.setObtain_order_detail_code(codeNum);
			employeeService.deleteObtainOrderDetailInfo(obtainOrderDetailVo);
		}
		
		System.out.println("들어옴??");
		System.out.println(code);
		
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("result", "success");
		map.put("obtain_order_code", session.getAttribute("obtain_order_code"));
		
		return map;
	}

	
	
	
	
	//생산
	@RequestMapping("manufactureInfo")
	public HashMap<String, Object> manufactureInfo(HttpSession session, Model model, String searchType, String searchWord,
									@RequestParam(value="pageNum", defaultValue = "1") int pageNum) {
		
		System.out.println("생산래컨");
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		String company_code = null;
		
		AdminVo adminInfo = (AdminVo)session.getAttribute("adminInfo");
		EmployeeVo employeeInfo = (EmployeeVo)session.getAttribute("employeeInfo");
		
		if(adminInfo != null) {
			company_code = adminInfo.getCompany_code();
		}
		
		if(employeeInfo != null) {
			company_code = employeeInfo.getCompany_code();
		}
		
		
		ArrayList<ManufactureVo> manufactureList = employeeService.manufactureInfo(searchType , searchWord, pageNum, company_code);

		
		int orderCount = employeeService.manufactureInfoCount(searchType, searchWord, company_code);
		
		//올림처리
		int totalPageCount = (int)Math.ceil(orderCount/15.0);

		int startPage = ((pageNum-1)/5)*5 + 1;
		int endPage = ((pageNum-1)/5+1)*5;
		
		if(endPage > totalPageCount) {
			endPage = totalPageCount;
		}
		
		map.put("startPage", startPage);
		map.put("endPage", endPage);
		map.put("currentPageNum", pageNum);
		map.put("totalPageCount", totalPageCount);
		
		//링크유지
		String additionalParamType = "";
		String additionalParamWord = "";
		if(searchType != null && searchWord != null) {
			additionalParamType +=  searchType;
			additionalParamWord += searchWord;
		}
		map.put("additionalParamType", additionalParamType);
		map.put("additionalParamWord", additionalParamWord);
		map.put("manufactureList", manufactureList);
		map.put("result", "success");
		
		return map;
	}
	
	@RequestMapping("insertManufactureInfo")
	public HashMap<String, Object> insertManufactureInfo(ManufactureVo manufactureVo) {
		System.out.println("들어오니");
		employeeService.insertManufactureInfo(manufactureVo);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("result", "success");
		
		return map;
	}
	
	@RequestMapping("selectManufactureInfo")
	public ManufactureVo selectManufactureInfo(ManufactureVo manufacture_code) {
		
		ManufactureVo manufactureVo =  employeeService.selectManufactureInfo(manufacture_code);
		
		HashMap<String, Object> map = new HashMap<String, Object>();

		return manufactureVo;
	}

	@RequestMapping("updateManufactureInfo")
	public HashMap<String, Object> updateManufactureInfo(ManufactureVo manufactureVo) {
		System.out.println("업데이투");
		System.out.println(manufactureVo);
		System.out.println(manufactureVo.getManufacture_code());
		employeeService.updateManufactureInfo(manufactureVo);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("result", "success");
		
		return map;
	}
	
	@RequestMapping("deleteManufactureInfo")
	public HashMap<String, Object> deleteManufactureInfo(String [] code) {
		
		for (String codeNum : code) {
			ManufactureVo manufacture_code = new ManufactureVo();
			manufacture_code.setManufacture_code(codeNum);
			employeeService.deleteManufactureInfo(manufacture_code);
		}
		
		System.out.println("들어옴??");
		System.out.println(code);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("result", "success");
		
		return map;
	}
	
	
	//생산디테일
	@RequestMapping("manufactureDetailInfo")
	public HashMap<String, Object> manufactureDetailInfo(HttpSession session, Model model, String searchType, String searchWord,
									@RequestParam(value="pageNum", defaultValue = "1") int pageNum, String manufacture_code) {
		
		System.out.println("생산디테일래컨");
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		ArrayList<ManufactureDetailVo> manufactureDetailList = employeeService.manufactureDetailInfo(searchType , searchWord, pageNum, manufacture_code);

		
		int orderCount = employeeService.manufactureInfoDetailCount(searchType, searchWord, manufacture_code);
		
		//올림처리
		int totalPageCount = (int)Math.ceil(orderCount/15.0);

		int startPage = ((pageNum-1)/5)*5 + 1;
		int endPage = ((pageNum-1)/5+1)*5;
		
		if(endPage > totalPageCount) {
			endPage = totalPageCount;
		}
		
		map.put("startPage", startPage);
		map.put("endPage", endPage);
		map.put("currentPageNum", pageNum);
		map.put("totalPageCount", totalPageCount);
		
		//링크유지
		String additionalParamType = "";
		String additionalParamWord = "";
		if(searchType != null && searchWord != null) {
			additionalParamType +=  searchType;
			additionalParamWord += searchWord;
		}
		map.put("additionalParamType", additionalParamType);
		map.put("additionalParamWord", additionalParamWord);
		map.put("manufactureDetailList", manufactureDetailList);
		map.put("result", "success");
		session.setAttribute("manufacture_code", manufacture_code);
		
		return map;
	}
	
	@RequestMapping("insertManufactureDetailInfo")
	public HashMap<String, Object> insertManufactureDetailInfo(HttpSession session, ManufactureDetailVo manufactureDetailVo) {
		System.out.println("들어오니");
		employeeService.insertManufactureDetailInfo(manufactureDetailVo);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("result", "success");
		
		
		map.put("manufacture_code", session.getAttribute("manufacture_code"));
		
		return map;
	}
	
	@RequestMapping("selectManufactureDetailInfo")
	public ManufactureDetailVo selectManufactureDetailInfo(ManufactureDetailVo manufacture_detail_code) {
		System.out.println("셀렉투");
		ManufactureDetailVo manufactureDetailVo =  employeeService.selectManufactureDetailInfo(manufacture_detail_code);
		
		HashMap<String, Object> map = new HashMap<String, Object>();

		return manufactureDetailVo;
	}

	@RequestMapping("updateManufactureDetailInfo")
	public HashMap<String, Object> updateManufactureDetailInfo(ManufactureDetailVo manufactureDetailVo) {
		System.out.println("업데이투");
		System.out.println(manufactureDetailVo);
		System.out.println(manufactureDetailVo.getManufacture_detail_code());
		employeeService.updateManufactureDetailInfo(manufactureDetailVo);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("result", "success");
		
		return map;
	}
	
	@RequestMapping("deleteManufactureDetailInfo")
	public HashMap<String, Object> deleteManufactureDetailInfo(HttpSession session , String [] code) {
		
		for (String codeNum : code) {
			ManufactureDetailVo manufactureDetailVo = new ManufactureDetailVo();
			manufactureDetailVo.setManufacture_detail_code(codeNum);
			employeeService.deleteManufactureDetailInfo(manufactureDetailVo);
		}
		
		System.out.println("들어옴??");
		System.out.println(code);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("result", "success");
		map.put("manufacture_code", session.getAttribute("manufacture_code"));
		
		return map;
	}
	
	
	
	
	
	
	//출하
	@RequestMapping("outboundInfo")
	public HashMap<String, Object> outboundInfo(HttpSession session, Model model, String searchType, String searchWord,
									@RequestParam(value="pageNum", defaultValue = "1") int pageNum) {
		
		System.out.println("출하래컨");
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		String company_code = null;
		
		AdminVo adminInfo = (AdminVo)session.getAttribute("adminInfo");
		EmployeeVo employeeInfo = (EmployeeVo)session.getAttribute("employeeInfo");
		
		if(adminInfo != null) {
			company_code = adminInfo.getCompany_code();
		}
		
		if(employeeInfo != null) {
			company_code = employeeInfo.getCompany_code();
		}
		
		ArrayList<OutboundVo> outboundList = employeeService.outboundInfo(searchType , searchWord, pageNum, company_code);

		
		int orderCount = employeeService.outboundInfoCount(searchType, searchWord, company_code);
		
		//올림처리
		int totalPageCount = (int)Math.ceil(orderCount/15.0);

		int startPage = ((pageNum-1)/5)*5 + 1;
		int endPage = ((pageNum-1)/5+1)*5;
		
		if(endPage > totalPageCount) {
			endPage = totalPageCount;
		}
		
		map.put("startPage", startPage);
		map.put("endPage", endPage);
		map.put("currentPageNum", pageNum);
		map.put("totalPageCount", totalPageCount);
		
		//링크유지
		String additionalParamType = "";
		String additionalParamWord = "";
		if(searchType != null && searchWord != null) {
			additionalParamType +=  searchType;
			additionalParamWord += searchWord;
		}
		map.put("additionalParamType", additionalParamType);
		map.put("additionalParamWord", additionalParamWord);
		map.put("outboundList", outboundList);
		map.put("result", "success");
		
		return map;
	}
	
	@RequestMapping("insertOutboundInfo")
	public HashMap<String, Object> insertOutboundInfo(OutboundVo outboundVo) {
		System.out.println("들어오니");
		employeeService.insertOutboundInfo(outboundVo);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("result", "success");
		
		return map;
	}
	
	@RequestMapping("selectOutboundInfo")
	public OutboundVo selectOutboundInfo(OutboundVo outbound_code) {
		
		OutboundVo outboundVo =  employeeService.selectOutboundInfo(outbound_code);

		return outboundVo;
	}

	@RequestMapping("updateOutboundInfo")
	public HashMap<String, Object> updateOutboundInfo(OutboundVo outboundVo) {
		System.out.println("업데이투");
		System.out.println(outboundVo);
		System.out.println(outboundVo.getOutbound_code());
		employeeService.updateOutboundInfo(outboundVo);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("result", "success");
		
		return map;
	}
	
	@RequestMapping("deleteOutboundInfo")
	public HashMap<String, Object> deleteOutboundInfo(String [] code) {
		
		for (String codeNum : code) {
			OutboundVo outbound_code = new OutboundVo();
			outbound_code.setOutbound_code(codeNum);
			employeeService.deleteOutboundInfo(outbound_code);
		}
		
		System.out.println("들어옴??");
		System.out.println(code);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("result", "success");
		
		return map;
	}
	
	
	//출하 디테일
	@RequestMapping("outboundDetailInfo")
	public HashMap<String, Object> outboundDetailInfo(HttpSession session, Model model, String searchType, String searchWord,
									@RequestParam(value="pageNum", defaultValue = "1") int pageNum, String outbound_code) {
		
		System.out.println("출하디래컨");
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		ArrayList<OutboundDetailVo> outboundDetailList = employeeService.outboundDetailInfo(searchType , searchWord, pageNum, outbound_code);

		
		int orderCount = employeeService.outboundDetailInfoCount(searchType, searchWord, outbound_code);
		
		//올림처리
		int totalPageCount = (int)Math.ceil(orderCount/15.0);

		int startPage = ((pageNum-1)/5)*5 + 1;
		int endPage = ((pageNum-1)/5+1)*5;
		
		if(endPage > totalPageCount) {
			endPage = totalPageCount;
		}
		
		map.put("startPage", startPage);
		map.put("endPage", endPage);
		map.put("currentPageNum", pageNum);
		map.put("totalPageCount", totalPageCount);
		
		//링크유지
		String additionalParamType = "";
		String additionalParamWord = "";
		if(searchType != null && searchWord != null) {
			additionalParamType +=  searchType;
			additionalParamWord += searchWord;
		}
		map.put("additionalParamType", additionalParamType);
		map.put("additionalParamWord", additionalParamWord);
		map.put("outboundDetailList", outboundDetailList);
		session.setAttribute("outbound_code", outbound_code);
		
		return map;
	}
	
	@RequestMapping("insertOutboundDetailInfo")
	public HashMap<String, Object> insertOutboundDetailInfo(HttpSession session, OutboundDetailVo outboundDetailVo) {
		System.out.println("들어오니");
		employeeService.insertOutboundDetailInfo(outboundDetailVo);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("result", "success");
		
		map.put("manufacture_code", session.getAttribute("manufacture_code"));
		
		return map;
	}
	
	@RequestMapping("selectOutboundDetailInfo")
	public OutboundDetailVo selectOutboundDetailInfo(OutboundDetailVo outbound_detail_code) {
		
		OutboundDetailVo outboundDetailVo =  employeeService.selectOutboundDetailInfo(outbound_detail_code);

		return outboundDetailVo;
	}

	@RequestMapping("updateOutboundDetailInfo")
	public HashMap<String, Object> updateOutboundDetailInfo(OutboundDetailVo outboundDetailVo) {
		System.out.println("업데이투");
		System.out.println(outboundDetailVo);
		System.out.println(outboundDetailVo.getOutbound_detail_code());
		employeeService.updateOutboundDetailInfo(outboundDetailVo);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("result", "success");
		
		return map;
	}
	
	@RequestMapping("deleteOutboundDetailInfo")
	public HashMap<String, Object> deleteOutboundDetailInfo(HttpSession session, String [] code) {
		
		for (String codeNum : code) {
			OutboundDetailVo outboundDetaileVo = new OutboundDetailVo();
			outboundDetaileVo.setOutbound_detail_code(codeNum);
			employeeService.deleteOutboundDetailInfo(outboundDetaileVo);
		}
		
		System.out.println("들어옴??");
		System.out.println(code);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("result", "success");
		map.put("outbound_code", session.getAttribute("outbound_code"));
		
		return map;
	}
	
	
	
	
	
	//제품단가
	@RequestMapping("productPriceInfo")
	public HashMap<String, Object> productPriceInfo(HttpSession session, Model model, String searchType, String searchWord,
									@RequestParam(value="pageNum", defaultValue = "1") int pageNum) {
		
		System.out.println("제품단가래컨");
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		String company_code = null;
		
		AdminVo adminInfo = (AdminVo)session.getAttribute("adminInfo");
		EmployeeVo employeeInfo = (EmployeeVo)session.getAttribute("employeeInfo");
		
		if(adminInfo != null) {
			company_code = adminInfo.getCompany_code();
		}
		
		if(employeeInfo != null) {
			company_code = employeeInfo.getCompany_code();
		}
		
		
		
		ArrayList<ProductPriceVo> productPriceList = employeeService.productPriceInfo(searchType , searchWord, pageNum, company_code);

		
		int orderCount = employeeService.productPriceInfoCount(searchType, searchWord, company_code);
		
		//올림처리
		int totalPageCount = (int)Math.ceil(orderCount/15.0);

		int startPage = ((pageNum-1)/5)*5 + 1;
		int endPage = ((pageNum-1)/5+1)*5;
		
		if(endPage > totalPageCount) {
			endPage = totalPageCount;
		}
		
		map.put("startPage", startPage);
		map.put("endPage", endPage);
		map.put("currentPageNum", pageNum);
		map.put("totalPageCount", totalPageCount);
		
		//링크유지
		String additionalParamType = "";
		String additionalParamWord = "";
		if(searchType != null && searchWord != null) {
			additionalParamType +=  searchType;
			additionalParamWord += searchWord;
		}
		map.put("additionalParamType", additionalParamType);
		map.put("additionalParamWord", additionalParamWord);
		map.put("productPriceList", productPriceList);
		
		return map;
	}
	
	@RequestMapping("insertProductPriceInfo")
	public HashMap<String, Object> insertProductPriceInfo(ProductPriceVo productPriceVo) {
		System.out.println("들어오니");
		System.out.println(productPriceVo.getProduct_code());
		employeeService.insertProductPriceInfo(productPriceVo);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("result", "success");
		
		return map;
	}
	
	@RequestMapping("selectProductPriceInfo")
	public ProductPriceVo selectProductPriceInfo(ProductPriceVo product_price_code) {
		
		ProductPriceVo productPriceVo =  employeeService.selectProductPriceInfo(product_price_code);

		return productPriceVo;
	}

	@RequestMapping("updateProductPriceInfo")
	public HashMap<String, Object> updateProductPriceInfo(ProductPriceVo productPriceVo) {
		System.out.println("업데이투");
		System.out.println(productPriceVo);
		System.out.println(productPriceVo.getProduct_price_code());
		employeeService.updateProductPriceInfo(productPriceVo);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("result", "success");
		
		return map;
	}
	
	@RequestMapping("deleteProductPriceInfo")
	public HashMap<String, Object> deleteProductPriceInfo(String [] code) {
		
		for (String codeNum : code) {
			ProductPriceVo product_price_code = new ProductPriceVo();
			product_price_code.setProduct_price_code(codeNum);
			employeeService.deleteProductPriceInfo(product_price_code);
		}
		
		System.out.println("들어옴??");
		System.out.println(code);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("result", "success");
		
		return map;
	}
	

}
