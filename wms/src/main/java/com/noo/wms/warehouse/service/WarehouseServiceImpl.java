package com.noo.wms.warehouse.service;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.noo.wms.vo.AdminVo;
import com.noo.wms.vo.AreaVo;
import com.noo.wms.vo.WarehouseVo;
import com.noo.wms.warehouse.mapper.WarehouseSQLMapper;

@Service
public class WarehouseServiceImpl {
	
	@Autowired
	private WarehouseSQLMapper warehouseMapper;
	
	public void insertMyWarehouse(WarehouseVo warehouseVo) {
		warehouseMapper.insertWarehouse(warehouseVo);
	}
	

	public ArrayList<HashMap<String, Object>> warehouseList(String companyCode, HttpSession session){
		
		ArrayList<HashMap<String, Object>> whList = new ArrayList<HashMap<String, Object>>();
		String coCode = ((AdminVo) session.getAttribute("adminInfo")).getCompany_code();
		
		ArrayList<WarehouseVo> whVo = warehouseMapper.warehouseList(coCode);
		
		for(WarehouseVo warehouse : whVo) {
			HashMap<String, Object> map = new HashMap<String, Object>();
			
			map.put("warehouse", warehouse);
			
			whList.add(map);
		}
		
		return whList;
	}
	
	
	public void insertMyArea(AreaVo areaVo) {
		
		warehouseMapper.insertArea(areaVo);
		
	}
	
	
	public ArrayList<HashMap<String, Object>> areaList(String warehouseCode){
		
		ArrayList<HashMap<String, Object>> aL = new ArrayList<HashMap<String, Object>>();
		
		ArrayList<AreaVo> aLVo = warehouseMapper.AreaList(warehouseCode);		
		
		for(AreaVo area : aLVo ) {
			HashMap<String,Object> map = new HashMap<String,Object>();
			
			map.put("area",area);
			
			aL.add(map);
			
		}
		
		return aL;
		
	}

	
}
