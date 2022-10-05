package com.noo.wms.inbound.mapper;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Param;

import com.noo.wms.vo.CellVo;
import com.noo.wms.vo.InboundVo;
import com.noo.wms.vo.LotVo;
import com.noo.wms.vo.ProductVo;

public interface InboundSQLMapper {

	public void insertInbound(InboundVo inboundVo);
	public ArrayList<LotVo> findLot(
			@Param("companyCode") String companyCode,
			@Param("lotCode") String lotCode);
	public LotVo selectedLot(String lotCode);
	public ProductVo selectedProduct (String productCode);
	public ArrayList<InboundVo>inboundList (String companyCode);
	public void updateInbound(InboundVo inboundVo);
	public void deleteInbound(InboundVo inboundVo);
	public ArrayList<HashMap<String, Object>> newInboundList(
			@Param("companyCode") String companyCode,
			@Param("searchType") String searchType, 
			@Param("searchWord") String searchWord,
			@Param("startList") int startList);
	public int inboundListCount (String companyCode);
	
}
