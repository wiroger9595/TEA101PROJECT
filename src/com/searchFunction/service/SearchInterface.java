package com.searchFunction.service;

import java.util.List;

import com.orderMaster.model.OrderMasterVO;
import com.space.model.SpaceVO;

public interface SearchInterface {
	
	//public List<SpaceVO> searchFunction() throws Exception;

	List<SpaceVO> searchFunction(String str) throws Exception;

	 List<SpaceVO> listTheAddress(String address) throws Exception;
	 
	 
	 List<SpaceVO> listTheBoth(String str, String address) throws Exception;

}
