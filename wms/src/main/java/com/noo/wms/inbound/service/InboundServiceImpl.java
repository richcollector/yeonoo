package com.noo.wms.inbound.service;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.noo.wms.inbound.mapper.InboundSQLMapper;
import com.noo.wms.lot.service.LotServiceImpl;
import com.noo.wms.vo.AdminVo;
import com.noo.wms.vo.CellVo;
import com.noo.wms.vo.InboundVo;
import com.noo.wms.vo.LotVo;

@Service
public class InboundServiceImpl {

	@Autowired
	private InboundSQLMapper inboundMapper;
	
	public void insertInboundlog(InboundVo inboundVo, HttpSession session) {
		
		String companyCode = ((AdminVo) session.getAttribute("adminInfo")).getCompany_code();
		
		inboundVo.setCompany_code(companyCode);
			
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
	
	public void selectedInboundUpdate(InboundVo inboundVo) {
		
		inboundMapper.updateInbound(inboundVo);
	}
	
	
	public void selectedInboundDelete(InboundVo inboundVo) {
		
		inboundMapper.deleteInbound(inboundVo);
	}
	
}


