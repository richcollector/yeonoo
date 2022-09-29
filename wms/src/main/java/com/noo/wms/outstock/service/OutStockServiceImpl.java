package com.noo.wms.outstock.service;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.noo.wms.outstock.mapper.OutstockSQLMapper;
import com.noo.wms.stock.mapper.StockSQLMapper;
import com.noo.wms.vo.AdminVo;
import com.noo.wms.vo.OutstockVo;
import com.noo.wms.vo.StockVo;

@Service
public class OutStockServiceImpl {
	
	@Autowired
	private OutstockSQLMapper outstockMapper;
	@Autowired
	private StockSQLMapper stockMapper;
	
	public void registOutstock(String stock_code, String lot_code, String product_code, String warehouse_code,
			String warehouse_area_code, String warehouse_rack_code , String warehouse_cell_code , 
			int outstock_amount , String outstock_memo , HttpSession session, StockVo stockVo) {
		
		String company_code = ((AdminVo) session.getAttribute("adminInfo")).getCompany_code();	
		
		outstockMapper.insertOutstock(stock_code , lot_code , product_code , warehouse_code , warehouse_area_code , warehouse_rack_code ,warehouse_cell_code
				,outstock_amount , outstock_memo , company_code );	
		
		int stockValue = stockMapper.stockValue(stock_code);
		
		int stock_amount = stockValue - outstock_amount ;
		
		stockVo.setStock_amount(stock_amount);
		stockVo.setStock_code(stock_code);
		stockMapper.updateStockAuto(stockVo);
		
	}
	
	public ArrayList<StockVo> stockSearcher(String searchType, String searchWord, HttpSession session){
		
		String coCode = ((AdminVo) session.getAttribute("adminInfo")).getCompany_code();
		
		ArrayList<StockVo> stock = outstockMapper.searchStock(coCode, searchType, searchWord);
		
		return stock;
	}
	
	public StockVo stockSearchOne(String stockCode) {
		
		StockVo stock = outstockMapper.selectedStock(stockCode);
			
		return stock;
	}
	
	public ArrayList<OutstockVo> outstockSearcher(String searchOsType, String searchOsWord,HttpSession session){
		
		String coCode = ((AdminVo) session.getAttribute("adminInfo")).getCompany_code();
		
		ArrayList <OutstockVo> outstock = outstockMapper.outstockList(coCode, searchOsType, searchOsWord);
		
		return outstock;
		
	}
	
}
