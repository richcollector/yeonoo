package com.noo.wms.warehouse.service;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.noo.wms.vo.AdminVo;
import com.noo.wms.vo.AreaVo;
import com.noo.wms.vo.CellVo;
import com.noo.wms.vo.RackVo;
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
		
		ArrayList<AreaVo> aLVo = warehouseMapper.areaList(warehouseCode);		
		
		for(AreaVo area : aLVo ) {
			HashMap<String,Object> map = new HashMap<String,Object>();
			
			map.put("area",area);
			
			aL.add(map);
			
		}
		
		return aL;
		
	}
	
	public ArrayList<HashMap<String,Object>> rackList(String areaCode){
		
		ArrayList<HashMap<String, Object>> rL = new ArrayList<HashMap<String, Object>>();
		
		ArrayList<RackVo> rKVo = warehouseMapper.rackList(areaCode);
		
		for(RackVo rack : rKVo) {
			HashMap<String,Object> map = new HashMap<String,Object>();
			
			map.put("rack",rack);
			
			rL.add(map);
			
		}
		
		return rL;
		
	}
	
	public void insertMyRack(RackVo rackVo) {
			
			warehouseMapper.insertRack(rackVo);
			
		}
	
	public ArrayList<HashMap<String,Object>> cellList(String rackCode){
			
			ArrayList<HashMap<String, Object>> cL = new ArrayList<HashMap<String, Object>>();
			
			ArrayList<CellVo> clVo = warehouseMapper.cellList(rackCode);
			
			for(CellVo cell : clVo) {
				
				HashMap<String,Object> map = new HashMap<String,Object>();
				
				map.put("cell",cell);
				
				cL.add(map);
				
			}
			
			return cL;
					
		}
	
	public void insertMyCell(CellVo cellVo) {
		
		warehouseMapper.insertCell(cellVo);
		
	}
	
	public void warehouseUpdate(WarehouseVo warehouseVo) {
		
		warehouseMapper.updateWarehouse(warehouseVo);
	}

	
	public void areaUpdate(AreaVo areaVo) {
		
		warehouseMapper.updateArea(areaVo);
	}
	
	public void rackUpdate(RackVo rackVo) {
		
		warehouseMapper.updateRack(rackVo);
	}
	
	public void cellUpdate(CellVo cellVo) {
		
		warehouseMapper.updateCell(cellVo);
	}
	
	
}
