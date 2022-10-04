package com.noo.wms.warehouse.mapper;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Param;

import com.noo.wms.vo.AreaVo;
import com.noo.wms.vo.CellVo;
import com.noo.wms.vo.RackVo;
import com.noo.wms.vo.WarehouseVo;

public interface WarehouseSQLMapper {

	public void insertWarehouse(WarehouseVo warehouseVo);
	public ArrayList<WarehouseVo> warehouseList(String companyCode);
	public void insertArea (AreaVo areaVo);
	public ArrayList<AreaVo> areaList(String warehouseCode); 
	public ArrayList<RackVo> rackList(String areaCode);
	public void insertRack (RackVo rackVo);
	public ArrayList<CellVo> cellList(String rackCode);
	public void insertCell (CellVo cellVo);
	public void updateWarehouse (WarehouseVo warehouseVo);
	public void updateArea (AreaVo areaVo);
	public void updateRack (RackVo rackVo);
	public void updateCell (CellVo cellVo);
	public void deleteCell (CellVo cellVo);
	public void deleteRack (RackVo rackVo);
	public void whenDeleteRack (CellVo cellVo);
	public void deleteArea (String areaCode);
	public void deleteWarehouse (String warehouseCode);
	public void deleteAreaVo (AreaVo areaVo);
	//구역코드로 검색
	public ArrayList<CellVo> selectCellByArea (String areaCode);
	public ArrayList<RackVo> selectRackByArea (String areaCode);
	//창고코드로 검색
	public ArrayList<CellVo> selectCellByWarehouse (String warehouseCode);
	public ArrayList<RackVo> selectRackByWarehouse (String warehouseCode);
	public ArrayList<AreaVo> selectAreaByWarehouse (String warehouseCode);
	//새로운 리스트
	public ArrayList<RackVo> newRackList(
			@Param("areaCode") String areaCode,
			@Param("startList") int startList);
	public int rackListCount (String areaCode);
	public ArrayList<CellVo> newCellList(
			@Param("rackCode") String rackCode,
			@Param("startList") int startList);
	public int cellListCount (String rackCode);
	public ArrayList<HashMap<String, Object>> stockInCell(String cellCode);	
}
