package com.noo.wms.outstock.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.noo.wms.outstock.service.OutStockServiceImpl;
import com.noo.wms.vo.AdminVo;
import com.noo.wms.vo.OutstockVo;
import com.noo.wms.vo.StockVo;

@RestController
@RequestMapping("/outstock/*")
public class OutstockRestController {
	
	@Autowired
	private OutStockServiceImpl outstockService;
	
	@RequestMapping("outstockInsert")
	public HashMap<String, Object> outstockInsert(String stock_code, String lot_code, String product_code, String warehouse_code,
			String warehouse_area_code, String warehouse_rack_code , String warehouse_cell_code , StockVo stockVo ,
			@RequestParam(value = "outstock_amount" , defaultValue = "0")
			int outstock_amount , String outstock_memo ,HttpSession session){
		
		HashMap<String, Object> map = new HashMap<String, Object>();	
		
		outstockService.registOutstock(stock_code , lot_code , product_code , warehouse_code , warehouse_area_code , warehouse_rack_code ,
				warehouse_cell_code, outstock_amount ,outstock_memo, session, stockVo );
		
		map.put("result", "sucess");
		
		return map;
	}
	
	@RequestMapping("stockSearch")
	public HashMap<String, Object> stockSearch(String searchType, String searchWord, HttpSession session){
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("result", "sucess");
		map.put("stockList" , outstockService.stockSearcher(searchType, searchWord, session));

		return map;
		
	}
	
	@RequestMapping("stockSelected")
	public HashMap<String, Object> stockSelected(String stockCode){
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("result", "sucess");
		map.put("stock", outstockService.stockSearchOne(stockCode));
		
		return map;
		
	}
	
	@RequestMapping("outstockList")
	public HashMap<String, Object> outstockList(String searchOsType, String searchOsWord,HttpSession session,
			@RequestParam(value="pageNum", defaultValue = "1") int pageNum){
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		String coCode = ((AdminVo) session.getAttribute("adminInfo")).getCompany_code();
		
		int outstockCount = outstockService.outstockCount(coCode);
		
		int totalPageCount = (int)Math.ceil(outstockCount/15.0);
		int startPage = ((pageNum-1)/5)*5 + 1;
		int endPage = ((pageNum-1)/5+1)*5;
			
		if(endPage > totalPageCount) {
			endPage = totalPageCount;
		}
	
		map.put("startPage", startPage);
		map.put("endPage", endPage);
		map.put("currentPageNum", pageNum);
		map.put("totalPageCount", totalPageCount);
		
		String additionalParamType = "";
		String additionalParamWord = "";
		if(searchOsType != null && searchOsWord != null) {
			additionalParamType +=  searchOsType;
			additionalParamWord += searchOsWord;
		}		
		
		map.put("additionalParamType", additionalParamType);
		map.put("additionalParamWord", additionalParamWord);
		map.put("outstockList",outstockService.outstockSearcher(searchOsType, searchOsWord, coCode, pageNum));
		
		return map;
	}
	
	
}
