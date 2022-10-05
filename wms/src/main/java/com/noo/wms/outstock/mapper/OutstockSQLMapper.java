package com.noo.wms.outstock.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.noo.wms.vo.OutstockVo;
import com.noo.wms.vo.StockVo;

public interface OutstockSQLMapper {

	public void insertOutstock(
			@Param("stock_code")String stock_code, 
			@Param("lot_code")String lot_code, 
			@Param("product_code")String product_code, 
			@Param("warehouse_code")String warehouse_code,
			@Param("warehouse_area_code")String warehouse_area_code, 
			@Param("warehouse_rack_code")String warehouse_rack_code, 
			@Param("warehouse_cell_code")String warehouse_cell_code, 
			@Param("outstock_amount")int outstock_amount,
			@Param("outstock_memo")String outstock_memo, 
			@Param("company_code")String company_code);
	public ArrayList<StockVo> searchStock(
			@Param("company_code") String company_code, 
			@Param("searchType") String searchType,
			@Param("searchWord") String searchWord); 	
	public StockVo selectedStock (String stockCode);	
	public ArrayList<OutstockVo> outstockList(
			@Param("company_code") String outstockCode,
			@Param("searchOsType") String searchOsType,
			@Param("searchOsWord") String searchOsWord,
			@Param("startList")int startList);
	public int outStockCount (String company_code);
}
