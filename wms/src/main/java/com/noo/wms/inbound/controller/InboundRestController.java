package com.noo.wms.inbound.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.noo.wms.inbound.service.InboundServiceImpl;
import com.noo.wms.lot.service.LotServiceImpl;
import com.noo.wms.vo.AdminVo;
import com.noo.wms.vo.InboundVo;
import com.noo.wms.warehouse.service.WarehouseServiceImpl;

@RestController
@RequestMapping("/inbound/*")
public class InboundRestController {

	@Autowired
	private InboundServiceImpl inboundService;
	@Autowired
	private LotServiceImpl lotService;
	@Autowired
	private WarehouseServiceImpl warehouseService;
	
	@RequestMapping("registInbound")
	public HashMap<String, Object> registInbound (InboundVo inboundVo, HttpSession session){
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		inboundService.insertInboundlog(inboundVo, session);
		
		map.put("result", "sucess");
	
		return map;
		
	}

	@RequestMapping("findLotToRegi")
	public HashMap<String, Object> findLotToRegi(String lotCode, HttpSession session){
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("result", "sucess");
		map.put("lot",inboundService.searchLot(lotCode, session));
		
		return map;
		
	}
	
	@RequestMapping("foundedLotInfo")
	public HashMap<String, Object> foundedLotInfo(String lotCode){
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("result", "sucess");
		map.put("lot",inboundService.searchedLot(lotCode));
		
		return map;
		
	}
	
	@RequestMapping("helpProduct")
	public HashMap<String, Object> helpProduct(String productCode){
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("result", "sucess");
		map.put("product", inboundService.searchedProduct(productCode));
		
		return map;
	}
	
	@RequestMapping("whSel")
	public HashMap<String, Object> whSel(String companyCode, HttpSession session){
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("whSel", warehouseService.warehouseList(companyCode, session));
		map.put("result", "sucess");
		
		return map;
		
	}
	
	@RequestMapping("arSel")
	public HashMap<String, Object> arSel(String warehouseCode){
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("result", "sucess");
		map.put("arSel",warehouseService.areaList(warehouseCode));
		
		return map;
	}
	
	@RequestMapping("rkSel")
	public HashMap<String, Object> rkSel(String areaCode){
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("result", "sucess");
		map.put("rkSel",warehouseService.rackList(areaCode));
		
		return map;
		
	}
	
	@RequestMapping("clSel")
	public HashMap<String, Object> clSel(String rackCode){
		
		HashMap<String, Object> map = new HashMap<String, Object>();
	
		map.put("result", "sucess");
		map.put("clSel",warehouseService.cellList(rackCode));
		
		return map;
		
	}

	@RequestMapping("companyInboundList")
	public HashMap<String, Object> companyInboundList(String companyCode,HttpSession session){
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		String coCode = ((AdminVo) session.getAttribute("adminInfo")).getCompany_code();

		map.put("result", "sucess");
		map.put("inboundList",inboundService.myInboundList(coCode));
	
		return map;
	}
	
	@RequestMapping("updateInbound")
	public HashMap<String,Object> updateInbound(InboundVo inboundVo){
	
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		inboundService.selectedInboundUpdate(inboundVo);
		
		map.put("result", "sucess");
		
		return map;
		
	}
	
}
