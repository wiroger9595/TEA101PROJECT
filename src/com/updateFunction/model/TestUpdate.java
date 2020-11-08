package com.updateFunction.model;

import java.util.List;

import com.space.model.SpaceVO;

public class TestUpdate {
	public static void main(String[] args) {
	
	UpdateInterface dao = new UpdateDAO();
		
		
	List<SpaceVO> list = dao.listByDate();
	
	for(SpaceVO spaceVO : list) {
		System.out.println(spaceVO.getSpaceName());
		System.out.println(spaceVO.getSpaceSignupDate());
	}
	
	}
}
