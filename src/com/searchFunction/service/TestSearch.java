package com.searchFunction.service;

import java.util.List;

import com.space.model.SpaceVO;

public class TestSearch {
	public static void main(String[] args) throws Exception {
	
	SearchInterface dao = new SearchDAO();
		
		
	List<SpaceVO> list = dao.searchFunction("大");
	
	for(SpaceVO spaceVO : list) {
		System.out.println(spaceVO.getSpaceName());
		System.out.println(spaceVO.getSpaceSignupDate());
		System.out.println(spaceVO.getSpaceAddress());
	}
	 
	
	
	for(SpaceVO spaceVO : list) {
		System.out.println(spaceVO.getSpaceName());
		System.out.println(spaceVO.getSpaceSignupDate());
	}
	}
}
 