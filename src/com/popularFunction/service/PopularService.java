package com.popularFunction.service;

import java.util.List;

import com.space.model.SpaceVO;


public class PopularService {
	
	private PopularInterface dao;
	
	public PopularService() {
		dao =  new PopularDAO();
	}
	
	public List<SpaceVO> listByPopular() {
		
		
		return dao.listByPopular();
	}
	

	
}
