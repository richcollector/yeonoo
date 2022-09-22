package com.noo.wms.warehouse.mapper;

import java.util.ArrayList;

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
	
}
