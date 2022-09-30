package com.noo.wms.stock.mapper;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Param;

import com.noo.wms.vo.StockVo;

public interface StockSQLMapper {
	
	public void insertStockAuto (StockVo stockVo);
	public void updateStockAuto (StockVo stockVo);
	public void deleteStockAuto (StockVo stockVo);
	public int stockValue (String stock_code);
	public ArrayList<StockVo> basicStockList (String stock_code);
	public ArrayList<StockVo> stockSearch (
			@Param("company_code") String company_code, 
			@Param("lot_code") String lot_code);
	public HashMap<String, Object> totalStockAmount(String lot_code);
	//제품 선택자
	public ArrayList<HashMap<String, Object>> productSearch (
			@Param("company_code") String company_code, 
			@Param("product_name") String product_name);
	public HashMap<String, Object> totalProductAmount (
			@Param("company_code") String company_code, 
			@Param("product_name") String product_name);
	//창고 선택자
	public ArrayList<HashMap<String,Object>> warehouseSearch(
			@Param("company_code") String company_code,
			@Param("warehouse_name") String warehouse_name);
	public HashMap<String,Object> totalWarehouseStock(
			@Param("company_code") String company_code,
			@Param("warehouse_name") String warehouse_name);
	public ArrayList<HashMap<String,Object>> warehouseSearchHelp(
			@Param("company_code") String company_code,
			@Param("warehouse_name") String warehouse_name);
	//구역 선택자
	public ArrayList<HashMap<String,Object>> areaSearch(
			@Param("company_code") String company_code,
			@Param("warehouse_area_name") String warehouse_area_name);
	public HashMap<String,Object> totalAreaStock(
			@Param("company_code") String company_code,
			@Param("warehouse_area_name") String warehouse_area_name);
	public ArrayList<HashMap<String,Object>> areaSearchHelp(
			@Param("company_code") String company_code,
			@Param("warehouse_area_name") String warehouse_area_name);
	//랙 선택자
	public ArrayList<HashMap<String,Object>> rackSearch(
			@Param("company_code") String company_code,
			@Param("warehouse_rack_name") String warehouse_rack_name);
	public HashMap<String,Object> totalRackStock(
			@Param("company_code") String company_code,
			@Param("warehouse_rack_name") String warehouse_rack_name);
	public ArrayList<HashMap<String,Object>> rackSearchHelp(
			@Param("company_code") String company_code,
			@Param("warehouse_rack_name") String warehouse_rack_name);
	
}
