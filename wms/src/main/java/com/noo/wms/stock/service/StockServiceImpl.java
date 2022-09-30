package com.noo.wms.stock.service;


import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.noo.wms.stock.mapper.StockSQLMapper;
import com.noo.wms.vo.AdminVo;
import com.noo.wms.vo.StockVo;

@Service
public class StockServiceImpl {

	@Autowired
	private StockSQLMapper stockMapper;
	
	public ArrayList<StockVo> basicStockList(HttpSession session){	
		
		String coCode = ((AdminVo) session.getAttribute("adminInfo")).getCompany_code();
		
		ArrayList<StockVo> stock = stockMapper.basicStockList(coCode);		
	
		return stock;
		
	}
	
	public ArrayList<StockVo> stockSearch(HttpSession session, String lot_code){
		
		String coCode = ((AdminVo) session.getAttribute("adminInfo")).getCompany_code();
		
		ArrayList<StockVo> stock = stockMapper.stockSearch(coCode, lot_code);	
		
		return stock;
		
	}
	
	public HashMap<String, Object> stockInfo(String lot_code){
		
		return stockMapper.totalStockAmount(lot_code);
		
	}
	
	public ArrayList<HashMap<String, Object>> productSearch(HttpSession session, String product_name){
		
		String coCode = ((AdminVo) session.getAttribute("adminInfo")).getCompany_code();
				
		return stockMapper.productSearch(coCode, product_name);
			
	}
	
	public HashMap<String,Object> productInfo(HttpSession session, String product_name){
		
		String coCode = ((AdminVo) session.getAttribute("adminInfo")).getCompany_code();
		
		return stockMapper.totalProductAmount(coCode, product_name);
		
	}
	
	
	public ArrayList<HashMap<String, Object>> warehouseSearch(HttpSession session,String warehouse_name){
		
		String coCode = ((AdminVo) session.getAttribute("adminInfo")).getCompany_code();
		
		return stockMapper.warehouseSearch(coCode, warehouse_name);
	}
	
	public HashMap<String, Object> warehouseTotalInfo (HttpSession session,String warehouse_name){
		
		String coCode = ((AdminVo) session.getAttribute("adminInfo")).getCompany_code();
		
		return stockMapper.totalWarehouseStock(coCode, warehouse_name);
	}
	
	public ArrayList<HashMap<String, Object>> warehouseSearchHelper(HttpSession session,String warehouse_name){
		
		String coCode = ((AdminVo) session.getAttribute("adminInfo")).getCompany_code();
		
		return stockMapper.warehouseSearchHelp(coCode, warehouse_name);
	
	}
	
	public ArrayList<HashMap<String, Object>> areaSearch(HttpSession session,String warehouse_area_name){
		
		String coCode = ((AdminVo) session.getAttribute("adminInfo")).getCompany_code();
		
		return stockMapper.areaSearch(coCode, warehouse_area_name);
		
	}
	
	public HashMap<String, Object> areaTotalInfo (HttpSession session,String warehouse_area_name){
		
		String coCode = ((AdminVo) session.getAttribute("adminInfo")).getCompany_code();
		
		return stockMapper.totalAreaStock(coCode, warehouse_area_name);
	}
	
	public ArrayList<HashMap<String, Object>> areaSearchHelper(HttpSession session,String warehouse_area_name){
		
		String coCode = ((AdminVo) session.getAttribute("adminInfo")).getCompany_code();
		
		return stockMapper.areaSearchHelp(coCode, warehouse_area_name);
	
	}
	
	public ArrayList<HashMap<String, Object>> rackSearch(HttpSession session,String warehouse_rack_name){
		
		String coCode = ((AdminVo) session.getAttribute("adminInfo")).getCompany_code();
		
		return stockMapper.rackSearch(coCode, warehouse_rack_name);
		
	}
	
	public HashMap<String, Object> rackTotalInfo (HttpSession session,String warehouse_rack_name){
		
		String coCode = ((AdminVo) session.getAttribute("adminInfo")).getCompany_code();
		
		return stockMapper.totalRackStock(coCode, warehouse_rack_name);
	}
	
	public ArrayList<HashMap<String, Object>> rackSearchHelper(HttpSession session,String warehouse_rack_name){
		
		String coCode = ((AdminVo) session.getAttribute("adminInfo")).getCompany_code();
		
		return stockMapper.rackSearchHelp(coCode, warehouse_rack_name);
	
	}
	
	
}
