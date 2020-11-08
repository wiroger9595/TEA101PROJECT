package com.allSpace.service;

import java.util.List;

import com.space.model.SpaceVO;



public class AllSpaceServiceList {
	
	private AllSpaceInterface dao;

	
	public AllSpaceServiceList() {
		dao =  new AllSpaceDAO();
	}
	
	
	public List<SpaceVO> selectAllSpaceList() {
		return dao.selectAllSpaceList();
	}
}
