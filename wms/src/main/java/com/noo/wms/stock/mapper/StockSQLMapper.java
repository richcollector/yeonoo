package com.noo.wms.stock.mapper;

import com.noo.wms.vo.StockVo;

public interface StockSQLMapper {
	
	public void insertStockAuto(StockVo stockVo);
	public void updateStockAuto(StockVo stockVo);
	public void deleteStockAuto(StockVo stockVo);
	public int stockValue (String stock_code);
}
