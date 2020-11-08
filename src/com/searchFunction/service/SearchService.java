package com.searchFunction.service;

import java.util.List;

import com.orderDetail.model.OrderDetailDAOInterface;
import com.orderDetail.model.OrderDetailVO;
import com.space.model.SpaceVO;

public class SearchService {
	private SearchInterface dao;
	
	public SearchService() {
		dao =  new SearchDAO();
	}
	
	public List<SpaceVO> listTheResult(String str) throws Exception {
		return dao.searchFunction(str);
	}

	
	
	public List<SpaceVO> listTheAddress(String address) throws Exception {
		return dao.searchFunction(address);
	}
	
	public SpaceVO listTheResult2(String str) {
		// TODO Auto-generated method stub
		return null;
	}

	public List<SpaceVO> listTheBoth(String str, String address) {
		// TODO Auto-generated method stub
		return null;
	}

	
	
	
}
 