package com.noo.wms.warehouse.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.noo.wms.vo.AdminVo;
import com.noo.wms.vo.AreaVo;
import com.noo.wms.vo.WarehouseVo;
import com.noo.wms.warehouse.service.WarehouseServiceImpl;

@RestController
@RequestMapping("/warehouse/*")
public class WarehouseRestController {

	@Autowired
	private WarehouseServiceImpl warehouseService;
	
	@RequestMapping("insertWarehouse")
	public HashMap<String, Object> insertWarehouse(WarehouseVo warehouseVo, HttpSession session){
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		String companyCode = ((AdminVo) session.getAttribute("adminInfo")).getCompany_code();
		
		warehouseVo.setCompany_code(companyCode);
		
		warehouseService.insertMyWarehouse(warehouseVo);
		
		map.put("result", "sucess");
		
		return map;
		
	}
	
	@RequestMapping("myWarehouseList")
	public HashMap<String, Object> warehouseList(String companyCode, HttpSession session){
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("result", "sucess");
		map.put("whList", warehouseService.warehouseList(companyCode, session));
		
		return map;
	}
	
	@RequestMapping("areaInsert")
	public HashMap<String, Object> areaInsert(AreaVo areaVo){
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		warehouseService.insertMyArea(areaVo);
		
		map.put("result", "sucess");
		
		return map;		
	}
	
	
	@RequestMapping("inWhAreaList")
	public HashMap<String, Object> whAreaList(String warehouseCode){
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("result","sucess");
		map.put("aList",warehouseService.areaList(warehouseCode));
		
		return map;
		
	}
	
}
