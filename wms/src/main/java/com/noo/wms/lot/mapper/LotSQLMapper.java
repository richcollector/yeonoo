package com.noo.wms.lot.mapper;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Param;

import com.noo.wms.vo.LotVo;
import com.noo.wms.vo.ProductVo;

public interface LotSQLMapper {

	public void lotRegist(LotVo lotVo);
	public ArrayList<ProductVo> findItem(
			@Param("productName") String productName,
			@Param("companyCode") String companyCode);
	public ProductVo selectItem (String productCode);
	public ArrayList<LotVo> lotList (String companyCode);
}