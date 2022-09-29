package com.noo.wms.inbound.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.noo.wms.inbound.mapper.InboundSQLMapper;
import com.noo.wms.lot.service.LotServiceImpl;
import com.noo.wms.stock.mapper.StockSQLMapper;
import com.noo.wms.vo.AdminVo;
import com.noo.wms.vo.CellVo;
import com.noo.wms.vo.InboundVo;
import com.noo.wms.vo.LotVo;
import com.noo.wms.vo.StockVo;

@Service
public class InboundServiceImpl {

	@Autowired
	private InboundSQLMapper inboundMapper;
	@Autowired
	private StockSQLMapper stockMapper;
	
	//입고 로그 삽입, 동시에 재고 삽입
	public void insertInboundlog(InboundVo inboundVo, StockVo stockVo, HttpSession session) {
		
		String companyCode = ((AdminVo) session.getAttribute("adminInfo")).getCompany_code();
				
		inboundVo.setCompany_code(companyCode);			
		
		//값 다시 집어넣기
		
		String lotCode = inboundVo.getLot_code();
		String productCode = inboundVo.getProduct_code();
		String warehouseCode = inboundVo.getWarehouse_code();
		String warehouseAreaCode = inboundVo.getWarehouse_area_code();
		String warehouseRackCode = inboundVo.getWarehouse_rack_code();
		String warehouseCellCode = inboundVo.getWarehouse_cell_code();
		int amount = inboundVo.getInbound_amount();
		Date regiDate = inboundVo.getInbound_register_date();
		String regiEmp = inboundVo.getInbound_register_employee();
		String memo = inboundVo.getInbound_memo();		
		
		stockVo.setCompany_code(companyCode);
		stockVo.setLot_code(lotCode);
		stockVo.setProduct_code(productCode);
		stockVo.setWarehouse_code(warehouseCode);
		stockVo.setWarehouse_area_code(warehouseAreaCode);
		stockVo.setWarehouse_rack_code(warehouseRackCode);
		stockVo.setWarehouse_cell_code(warehouseCellCode);
		stockVo.setStock_amount(amount);
		stockVo.setStock_register_date(regiDate);
		stockVo.setStock_register_employee(regiEmp);
		stockVo.setStock_memo(memo);
		
		stockMapper.insertStockAuto(stockVo);
		inboundVo.setStock_code(stockVo.getStock_code());
		inboundMapper.insertInbound(inboundVo);
		
	}
	
	public ArrayList<HashMap<String, Object>> searchLot(String lotCode, HttpSession session) {
		
		String code = ((AdminVo) session.getAttribute("adminInfo")).getCompany_code();
		
		ArrayList<HashMap<String, Object>> findLotList = new ArrayList<HashMap<String, Object>>();
		
		ArrayList<LotVo> lotList = inboundMapper.findLot(code, lotCode);
		
		for(LotVo lotVo : lotList) {
			
			HashMap<String, Object> map = new HashMap<String, Object>();
			
			map.put("lot",lotVo);
			
			findLotList.add(map);
			
		}
		
		return findLotList;
		
	}
	
	public HashMap<String, Object> searchedLot(String lotCode) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("lot",inboundMapper.selectedLot(lotCode));
		
		return map;
		
	}
	
	public HashMap<String, Object> searchedProduct(String productCode){
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("product", inboundMapper.selectedProduct(productCode));
		
		return map;
	}
	
	public ArrayList<InboundVo> myInboundList (String companyCode){
		
		ArrayList<InboundVo> inboundList = inboundMapper.inboundList(companyCode);
		
		return inboundList;
		
	}
	
	public void selectedInboundUpdate(InboundVo inboundVo, StockVo stockVo) {
		
		inboundMapper.updateInbound(inboundVo);
		
		//값 다시 집어넣기
		
		String lotCode = inboundVo.getLot_code();
		String productCode = inboundVo.getProduct_code();
		String warehouseCode = inboundVo.getWarehouse_code();
		String warehouseAreaCode = inboundVo.getWarehouse_area_code();
		String warehouseRackCode = inboundVo.getWarehouse_rack_code();
		String warehouseCellCode = inboundVo.getWarehouse_cell_code();
		int amount = inboundVo.getInbound_amount();
		String memo = inboundVo.getInbound_memo();
		String stockCode = inboundVo.getStock_code();
			
		stockVo.setStock_code(stockCode);
		stockVo.setLot_code(lotCode);
		stockVo.setProduct_code(productCode);
		stockVo.setWarehouse_code(warehouseCode);
		stockVo.setWarehouse_area_code(warehouseAreaCode);
		stockVo.setWarehouse_rack_code(warehouseRackCode);
		stockVo.setWarehouse_cell_code(warehouseCellCode);
		stockVo.setStock_amount(amount);
		stockVo.setStock_memo(memo);		
		
		
		stockMapper.updateStockAuto(stockVo);
		
	}
	
	
	public void selectedInboundDelete(InboundVo inboundVo) {
		
		inboundMapper.deleteInbound(inboundVo);
	}
	
	public void whenDeleteInbound(StockVo stockVo) {
		
		stockMapper.deleteStockAuto(stockVo);
	}
	
	
	
}


