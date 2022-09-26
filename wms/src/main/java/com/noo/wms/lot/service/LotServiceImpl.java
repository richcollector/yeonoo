package com.noo.wms.lot.service;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.noo.wms.lot.mapper.LotSQLMapper;
import com.noo.wms.vo.AdminVo;
import com.noo.wms.vo.LotVo;
import com.noo.wms.vo.ProductVo;

@Service
public class LotServiceImpl {

	@Autowired
	private LotSQLMapper lotMapper;
	
	public void registLot(LotVo lotVo ) {

		lotMapper.lotRegist(lotVo);
	}
	
	public ArrayList<HashMap<String, Object>> findItem(String prodcutName, HttpSession session){
			
		String code = ((AdminVo) session.getAttribute("adminInfo")).getCompany_code();
		
		ArrayList<HashMap<String, Object>> findProductList = new ArrayList<HashMap<String, Object>>();
		
		ArrayList<ProductVo> productList = lotMapper.findItem(prodcutName, code);
		
		for(ProductVo productVo : productList) {
			HashMap<String, Object> map = new HashMap<String, Object> ();
			
			map.put("product", productVo);
			
			findProductList.add(map);
		}
		
		return findProductList;
		
	}
	
	public HashMap<String, Object> selectItem(String productCode) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
				
		map.put("product", lotMapper.selectItem(productCode));
		
		return map;
		
	}
	
	public ArrayList<HashMap<String, Object>> showLotList(String companyCode, HttpSession session){
		
		ArrayList<HashMap<String, Object>> lotList = new ArrayList<HashMap<String, Object>> ();
					
		companyCode = ((AdminVo) session.getAttribute("adminInfo")).getCompany_code();
		
		ArrayList<LotVo> myLotList = lotMapper.lotList(companyCode); 
		
		for(LotVo lotVo : myLotList ) {
			
			HashMap<String, Object> map = new HashMap<String, Object> ();
			ProductVo product = lotMapper.selectItem(lotVo.getProduct_code());
			
			map.put("lot", lotVo);
			map.put("product", product);
			
			lotList.add(map);
			
		}
		
		return lotList;
		
	}
	
	public void updateLot(LotVo lotVo) {
		lotMapper.lotUpdate(lotVo);
	}
	
	
	public void deleteLot(LotVo lotVo) {
		lotMapper.lotDelete(lotVo);
	}
	
}
