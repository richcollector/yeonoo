package com.noo.wms.stock.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.noo.wms.stock.service.StockServiceImpl;

@RestController
@RequestMapping ("/stock/*")
public class StockRestController {
	
	@Autowired
	private StockServiceImpl stockService;
	
	@RequestMapping("vanillaStockList")
	public HashMap<String, Object> vanillaStockList(HttpSession session){
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("stockList", stockService.basicStockList(session));
		
		return map;
		
	}
	
	@RequestMapping("stockSearcher")
	public HashMap<String, Object> stockSearcher(HttpSession session,String lot_code){
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("stockList", stockService.stockSearch(session, lot_code));
		map.put("totalStock", stockService.stockInfo(lot_code));
		
		return map;
		
	}
	
	@RequestMapping("productSearcher")
	public HashMap<String, Object> productSearcher (HttpSession session,String product_name){
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("searchItem", stockService.productSearch(session, product_name));
		map.put("totalProduct",stockService.productInfo(session, product_name));
		
		return map;
		
	}
	
	@RequestMapping("warehouseSearcher")
	public HashMap<String, Object> warehouseSearcher(HttpSession session,String warehouse_name){
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("searchWarehouse",stockService.warehouseSearch(session, warehouse_name));
		map.put("warehouseTotal",stockService.warehouseTotalInfo(session, warehouse_name));
		map.put("searchWarehouseHelper",stockService.warehouseSearchHelper(session, warehouse_name));
		
		return map;
		
	}
	
	@RequestMapping("areaSearcher")
	public HashMap<String,Object> areaSearcher(HttpSession session,String warehouse_area_name){
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("searchArea", stockService.areaSearch(session, warehouse_area_name));
		map.put("areaTotal", stockService.areaTotalInfo(session, warehouse_area_name));
		map.put("searchAreaHelper", stockService.areaSearchHelper(session, warehouse_area_name));
		
		return map;
		
	}
	
	@RequestMapping("rackSearcher")
	public HashMap<String,Object> rackSearcher(HttpSession session,String warehouse_rack_name){
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("searchRack", stockService.rackSearch(session, warehouse_rack_name));
		map.put("rackTotal", stockService.rackTotalInfo(session, warehouse_rack_name));
		map.put("searchRackHelper", stockService.rackSearchHelper(session, warehouse_rack_name));
		
		return map;
	}
	
	
}
