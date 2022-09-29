package com.noo.wms.warehouse.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.noo.wms.vo.AdminVo;
import com.noo.wms.vo.AreaVo;
import com.noo.wms.vo.CellVo;
import com.noo.wms.vo.LotVo;
import com.noo.wms.vo.RackVo;
import com.noo.wms.vo.WarehouseVo;
import com.noo.wms.warehouse.service.WarehouseServiceImpl;

@RestController
@RequestMapping("/warehouse/*")
public class WarehouseRestController {

	@Autowired
	private WarehouseServiceImpl warehouseService;
	
	@RequestMapping("insertWarehouse")
	public HashMap<String, Object> insertWarehouse(WarehouseVo warehouseVo, HttpSession session){
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		String companyCode = ((AdminVo) session.getAttribute("adminInfo")).getCompany_code();
		
		warehouseVo.setCompany_code(companyCode);
		
		warehouseService.insertMyWarehouse(warehouseVo);
		
		map.put("result", "sucess");
		
		return map;
		
	}
	
	@RequestMapping("myWarehouseList")
	public HashMap<String, Object> warehouseList(String companyCode, HttpSession session){
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("result", "sucess");
		map.put("whList", warehouseService.warehouseList(companyCode, session));
		
		return map;
	}
	
	@RequestMapping("areaInsert")
	public HashMap<String, Object> areaInsert(AreaVo areaVo){
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		warehouseService.insertMyArea(areaVo);
		
		map.put("result", "sucess");
		
		return map;		
	}
	
	
	@RequestMapping("inWhAreaList")
	public HashMap<String, Object> inWhAreaList(String warehouseCode){
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("result","sucess");
		map.put("warehouseCode", warehouseCode);
		map.put("aList",warehouseService.areaList(warehouseCode));
		
		return map;
		
	}
	
	@RequestMapping("inArRackList")
	public HashMap<String, Object> inArRackList(String areaCode){
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("result","sucess");
		map.put("areaCode", areaCode);
		map.put("rList",warehouseService.rackList(areaCode));
		
		return map;
	}
	
	@RequestMapping("rackInsert")
	public HashMap<String, Object> rackInsert(RackVo rackVo){
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		warehouseService.insertMyRack(rackVo);
		
		map.put("result", "sucess");
		
		return map;
		
	}

	@RequestMapping("inRkCellList")
	public HashMap<String, Object> inRkCellList(String rackCode){
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("result","sucess");
		map.put("rackCode", rackCode);
		map.put("cList",warehouseService.cellList(rackCode));
		
		return map;
		
	}
	
	@RequestMapping("cellInsert")
	public HashMap<String,Object> cellInsert(CellVo cellVo){
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		warehouseService.insertMyCell(cellVo);
		
		map.put("result", "sucess");
		
		return map;
		
	}
	
	@RequestMapping("whUpdate")
	public HashMap<String, Object> whUpdate(WarehouseVo warehouseVo){
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		warehouseService.warehouseUpdate(warehouseVo);
		
		map.put("result", "sucess");
		
		return map;
		
	}
	
	@RequestMapping("arUpdate")
	public HashMap<String, Object> arUpdate(AreaVo areaVo){
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		warehouseService.areaUpdate(areaVo);
		
		map.put("result", "sucess");
		
		return map;
	}
	
	@RequestMapping("rkUpdate")
	public HashMap<String, Object> rkUpdate(RackVo rackVo){
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		warehouseService.rackUpdate(rackVo);
		
		map.put("result", "sucess");
		
		return map;
		
	}
	
	@RequestMapping("clUpdate")
	public HashMap<String, Object> clUpdate(CellVo cellVo){
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		warehouseService.cellUpdate(cellVo);
		
		map.put("result", "sucess");
		
		return map;
		
	}
	
	@RequestMapping("deleteCell")
	public HashMap<String, Object> deleteCell(String [] code){
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		for(String Code : code) {
			
			CellVo cellVo = new CellVo();
			cellVo.setWarehouse_cell_code(Code);
			warehouseService.cellDelete(cellVo);
		}
		
		return map;
	}
	
	
	@RequestMapping("deleteRack")
	public HashMap<String, Object> deleteRack(String [] code, CellVo cellVo){
	
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		for(String Code : code) {
			
			RackVo rackVo = new RackVo();
			rackVo.setWarehouse_rack_code(Code);
			warehouseService.rackDelete(rackVo);
			
			String rkCode = rackVo.getWarehouse_rack_code();			
			cellVo.setWarehouse_rack_code(rkCode);			
			warehouseService.delWithRkCell(cellVo);			
		}
		
		return map;
	}
	
	@RequestMapping("deleteByAreaCode")
	public HashMap<String, Object> deleteByAreaCode (String [] code){
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		for(String Code : code) {

			warehouseService.deleteByAreaCode(Code);
	
		}
		
		return map;
	}
	
	@RequestMapping("deleteByWarehouseCode")
	public HashMap<String, Object> deleteByWarehouseCode (String [] code){
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		for(String Code : code) {

			warehouseService.deleteByWarehouseCode(Code);
	
		}
		
		return map;
	}
	
	
}
