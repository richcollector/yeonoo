package com.noo.wms.employee.controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.noo.wms.account.service.AccountServiceImpl;
import com.noo.wms.employee.service.EmployeeServiceImpl;
import com.noo.wms.vo.AccountVo;
import com.noo.wms.vo.ManufactureVo;
import com.noo.wms.vo.ObtainOrderVo;
import com.noo.wms.vo.OutboundVo;
import com.noo.wms.vo.ProductPriceVo;
import com.noo.wms.vo.ProductVo;
import com.noo.wms.vo.PurchaseVo;

@RestController
@RequestMapping("/employee/*")
public class EmployeeRestController {
	
	@Autowired
	private EmployeeServiceImpl employeeService;
	
	//발주
	@RequestMapping("purchaseInfo")
	public HashMap<String, Object> purchaseInfo(Model model, String searchType, String searchWord,
									@RequestParam(value="pageNum", defaultValue = "1") int pageNum) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		ArrayList<PurchaseVo> purchaseList = employeeService.purchaseInfo(searchType , searchWord, pageNum);

		
		int orderCount = employeeService.purchaseInfoCount(searchType, searchWord);
		
		//올림처리
		int totalPageCount = (int)Math.ceil(orderCount/10.0);

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
		
		return map;
	}
	
	@RequestMapping("insertPurchaseInfo")
	public void insertPurchaseInfo(PurchaseVo purchaseVo) {
		System.out.println("들어오니");
		employeeService.insertPurchaseInfo(purchaseVo);
	}
	
	@RequestMapping("selectPurchaseInfo")
	public PurchaseVo selectPurchaseInfo(PurchaseVo purchase_code) {
		PurchaseVo purchaseVo =  employeeService.selectPurchaseInfo(purchase_code);
		
		return purchaseVo;
	}

	@RequestMapping("updatePurchaseInfo")
	public void updatePurchaseInfo(PurchaseVo purchaseVo) {
		System.out.println("업데이투");
		System.out.println(purchaseVo);
		employeeService.updatePurchaseInfo(purchaseVo);
	}
	
	@RequestMapping("deletePurchaseInfo")
	public void deletePurchaseInfo(String [] code) {
		
		for (String codeNum : code) {
			PurchaseVo purchase_code = new PurchaseVo();
			purchase_code.setPurchase_code(codeNum);
			employeeService.deletePurchaseInfo(purchase_code);
		}
		
		System.out.println("들어옴??");
		System.out.println(code);
	}
	
	
	//제품
	@RequestMapping("productInfo")
	public HashMap<String, Object> productInfo(Model model, String searchType, String searchWord,
									@RequestParam(value="pageNum", defaultValue = "1") int pageNum) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		ArrayList<ProductVo> productList = employeeService.productInfo(searchType , searchWord, pageNum);

		
		int orderCount = employeeService.productInfoCount(searchType, searchWord);
		
		//올림처리
		int totalPageCount = (int)Math.ceil(orderCount/10.0);

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
	public void insertProductInfo(ProductVo productVo) {
		System.out.println("들어오니");
		employeeService.insertProductInfo(productVo);
	}
	
	@RequestMapping("selectProductInfo")
	public ProductVo selectProductInfo(ProductVo product_code) {
		ProductVo productVo =  employeeService.selectProductInfo(product_code);
		
		return productVo;
	}

	@RequestMapping("updateProductInfo")
	public void updateProductInfo(ProductVo productVo) {
		System.out.println("업데이투");
		System.out.println(productVo);
		System.out.println(productVo.getProduct_code());
		employeeService.updateProductInfo(productVo);
	}
	
	@RequestMapping("deleteProductInfo")
	public void deleteProductInfo(String [] code) {
		
		for (String codeNum : code) {
			ProductVo product_code = new ProductVo();
			product_code.setProduct_code(codeNum);
			employeeService.deleteProductInfo(product_code);
		}
		
		System.out.println("들어옴??");
		System.out.println(code);
	}
	
	
	
	
	//수주
	@RequestMapping("obtainOrderInfo")
	public HashMap<String, Object> obtainOrderInfo(Model model, String searchType, String searchWord,
									@RequestParam(value="pageNum", defaultValue = "1") int pageNum) {
		
		System.out.println("수주래컨");
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		ArrayList<ObtainOrderVo> obtainOrderList = employeeService.obtainOrderInfo(searchType , searchWord, pageNum);

		
		int orderCount = employeeService.obtainOrderInfoCount(searchType, searchWord);
		
		//올림처리
		int totalPageCount = (int)Math.ceil(orderCount/10.0);

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
		
		return map;
	}
	
	@RequestMapping("insertObtainOrderInfo")
	public void insertObtainOrderInfo(ObtainOrderVo obtainOrderVo) {
		System.out.println("들어오니");
		employeeService.insertObtainOrderInfo(obtainOrderVo);
	}
	
	@RequestMapping("selectObtainOrderInfo")
	public ObtainOrderVo selectObtainOrderInfo(ObtainOrderVo obtain_order_code) {
		
		ObtainOrderVo obtainOrderVo =  employeeService.selectObtainOrderInfo(obtain_order_code);

		return obtainOrderVo;
	}

	@RequestMapping("updateObtainOrderInfo")
	public void updateObtainOrderInfo(ObtainOrderVo obtainOrderVo) {
		System.out.println("업데이투");
		System.out.println(obtainOrderVo);
		System.out.println(obtainOrderVo.getObtain_order_code());
		employeeService.updateObtainOrderInfo(obtainOrderVo);
	}
	
	@RequestMapping("deleteObtainOrderInfo")
	public void deleteObtainOrderInfo(String [] code) {
		
		for (String codeNum : code) {
			ObtainOrderVo obtain_order_code = new ObtainOrderVo();
			obtain_order_code.setObtain_order_code(codeNum);
			employeeService.deleteObtainOrderInfo(obtain_order_code);
		}
		
		System.out.println("들어옴??");
		System.out.println(code);
	}

	
	
	
	
	//생산
	@RequestMapping("manufactureInfo")
	public HashMap<String, Object> manufactureInfo(Model model, String searchType, String searchWord,
									@RequestParam(value="pageNum", defaultValue = "1") int pageNum) {
		
		System.out.println("생산래컨");
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		ArrayList<ManufactureVo> manufactureList = employeeService.manufactureInfo(searchType , searchWord, pageNum);

		
		int orderCount = employeeService.manufactureInfoCount(searchType, searchWord);
		
		//올림처리
		int totalPageCount = (int)Math.ceil(orderCount/10.0);

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
		
		return map;
	}
	
	@RequestMapping("insertManufactureInfo")
	public void insertManufactureInfo(ManufactureVo manufactureVo) {
		System.out.println("들어오니");
		employeeService.insertManufactureInfo(manufactureVo);
	}
	
	@RequestMapping("selectManufactureInfo")
	public ManufactureVo selectManufactureInfo(ManufactureVo manufacture_code) {
		
		ManufactureVo manufactureVo =  employeeService.selectManufactureInfo(manufacture_code);

		return manufactureVo;
	}

	@RequestMapping("updateManufactureInfo")
	public void updateManufactureInfo(ManufactureVo manufactureVo) {
		System.out.println("업데이투");
		System.out.println(manufactureVo);
		System.out.println(manufactureVo.getManufacture_code());
		employeeService.updateManufactureInfo(manufactureVo);
	}
	
	@RequestMapping("deleteManufactureInfo")
	public void deleteManufactureInfo(String [] code) {
		
		for (String codeNum : code) {
			ManufactureVo manufacture_code = new ManufactureVo();
			manufacture_code.setManufacture_code(codeNum);
			employeeService.deleteManufactureInfo(manufacture_code);
		}
		
		System.out.println("들어옴??");
		System.out.println(code);
	}
	
	
	
	
	
	//생산
	@RequestMapping("outboundInfo")
	public HashMap<String, Object> outboundInfo(Model model, String searchType, String searchWord,
									@RequestParam(value="pageNum", defaultValue = "1") int pageNum) {
		
		System.out.println("출하래컨");
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		ArrayList<OutboundVo> outboundList = employeeService.outboundInfo(searchType , searchWord, pageNum);

		
		int orderCount = employeeService.outboundInfoCount(searchType, searchWord);
		
		//올림처리
		int totalPageCount = (int)Math.ceil(orderCount/10.0);

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
		
		return map;
	}
	
	@RequestMapping("insertOutboundInfo")
	public void insertOutboundInfo(OutboundVo outboundVo) {
		System.out.println("들어오니");
		employeeService.insertOutboundInfo(outboundVo);
	}
	
	@RequestMapping("selectOutboundInfo")
	public OutboundVo selectOutboundInfo(OutboundVo outbound_code) {
		
		OutboundVo outboundVo =  employeeService.selectOutboundInfo(outbound_code);

		return outboundVo;
	}

	@RequestMapping("updateOutboundInfo")
	public void updateOutboundInfo(OutboundVo outboundVo) {
		System.out.println("업데이투");
		System.out.println(outboundVo);
		System.out.println(outboundVo.getOutbound_code());
		employeeService.updateOutboundInfo(outboundVo);
	}
	
	@RequestMapping("deleteOutboundInfo")
	public void deleteOutboundInfo(String [] code) {
		
		for (String codeNum : code) {
			OutboundVo outbound_code = new OutboundVo();
			outbound_code.setOutbound_code(codeNum);
			employeeService.deleteOutboundInfo(outbound_code);
		}
		
		System.out.println("들어옴??");
		System.out.println(code);
	}
	
	
	
	
	
	//제품단가
	@RequestMapping("productPriceInfo")
	public HashMap<String, Object> productPriceInfo(Model model, String searchType, String searchWord,
									@RequestParam(value="pageNum", defaultValue = "1") int pageNum) {
		
		System.out.println("제품단가래컨");
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		ArrayList<ProductPriceVo> productPriceList = employeeService.productPriceInfo(searchType , searchWord, pageNum);

		
		int orderCount = employeeService.productPriceInfoCount(searchType, searchWord);
		
		//올림처리
		int totalPageCount = (int)Math.ceil(orderCount/10.0);

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
	public void insertProductPriceInfo(ProductPriceVo productPriceVo) {
		System.out.println("들어오니");
		employeeService.insertProductPriceInfo(productPriceVo);
	}
	
	@RequestMapping("selectProductPriceInfo")
	public ProductPriceVo selectProductPriceInfo(ProductPriceVo product_price_code) {
		
		ProductPriceVo productPriceVo =  employeeService.selectProductPriceInfo(product_price_code);

		return productPriceVo;
	}

	@RequestMapping("updateProductPriceInfo")
	public void updateProductPriceInfo(ProductPriceVo productPriceVo) {
		System.out.println("업데이투");
		System.out.println(productPriceVo);
		System.out.println(productPriceVo.getProduct_price_code());
		employeeService.updateProductPriceInfo(productPriceVo);
	}
	
	@RequestMapping("deleteProductPriceInfo")
	public void deleteProductPriceInfo(String [] code) {
		
		for (String codeNum : code) {
			ProductPriceVo product_price_code = new ProductPriceVo();
			product_price_code.setProduct_price_code(codeNum);
			employeeService.deleteProductPriceInfo(product_price_code);
		}
		
		System.out.println("들어옴??");
		System.out.println(code);
	}
	

}
