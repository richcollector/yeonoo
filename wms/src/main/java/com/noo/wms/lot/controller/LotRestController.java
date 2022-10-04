package com.noo.wms.lot.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.noo.wms.lot.service.LotServiceImpl;
import com.noo.wms.vo.AdminVo;
import com.noo.wms.vo.LotVo;

@RestController
@RequestMapping ("/lot/*")
public class LotRestController {

	@Autowired
	private LotServiceImpl lotService;
		
	@RequestMapping("lotRegist")
	public HashMap<String,Object> lotRegist(LotVo lotVo, HttpSession session){
	
		HashMap<String,Object> map = new HashMap<String,Object>();
		
		String coCode = ((AdminVo) session.getAttribute("adminInfo")).getCompany_code();
		
		lotVo.setCompany_code(coCode);
		
		lotService.registLot(lotVo);
		
		map.put("result", "sucess");
		
		return map;
		
	}
	
	@RequestMapping("findPdToRegi")
	public HashMap<String,Object> findPdForRegi(String productName, HttpSession session){
		
		HashMap<String, Object> map = new HashMap<String,Object>();
			
		map.put("result", "sucess");
		map.put("product", lotService.findItem(productName, session));
		
		return map;
		
	}
	
	@RequestMapping("selPdToRegi")
	public HashMap<String,Object> selPdToRegi(String productCode){
		
		HashMap<String, Object> map = new HashMap<String,Object>();
	
		map.put("result", "sucess");
		map.put("product", lotService.selectItem(productCode));
		
		return map;
	}
	
	@RequestMapping("lotItemUpdate")
	public HashMap<String, Object> lotItemUpdate(LotVo lotVo){
		
		lotService.updateLot(lotVo);
		
		HashMap<String, Object> map = new HashMap<String,Object>();
		map.put("result", "sucess");
		
		return map;
		
	}
	
	@RequestMapping("deleteLotLog")
	public HashMap<String, Object> deleteLotLog(String [] code) {
		
		HashMap<String, Object> map = new HashMap<String,Object>();
		
		for(String Code : code) {
			
			LotVo lotVo = new LotVo();
			lotVo.setLot_code(Code);
			lotService.deleteLot(lotVo);
		}
		
		map.put("result", "sucess");
		return map;
	}
	
	@RequestMapping("newLotList")
	public HashMap<String, Object> newLotList(String companyCode,HttpSession session, String searchType, String searchWord,
			@RequestParam(value="pageNum", defaultValue = "1") int pageNum){
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		String coCode = ((AdminVo) session.getAttribute("adminInfo")).getCompany_code();
		
		int lotCount = lotService.lotCount(coCode);
		
		int totalPageCount = (int)Math.ceil(lotCount/15.0);
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
		if(searchType != null && searchWord != null) {
			additionalParamType +=  searchType;
			additionalParamWord += searchWord;
		}		
		
		map.put("additionalParamType", additionalParamType);
		map.put("additionalParamWord", additionalParamWord);
		map.put("lL", lotService.newListLot(coCode, searchType, searchWord, pageNum));
			
		return map;
	}
	
}
