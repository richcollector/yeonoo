package com.noo.wms.warehouse.mapper;

import java.util.ArrayList;

import com.noo.wms.vo.AreaVo;
import com.noo.wms.vo.WarehouseVo;

public interface WarehouseSQLMapper {

	public void insertWarehouse(WarehouseVo warehouseVo);
	public ArrayList<WarehouseVo> warehouseList(String companyCode);
	public void insertArea (AreaVo areaVo);
	public ArrayList<AreaVo> AreaList(String warehouseCode); 
	
	
}
