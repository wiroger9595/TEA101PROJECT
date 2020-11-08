package com.allSpace.service;

import java.util.List;

import com.space.model.SpaceVO;


public class AllSpaceTest {
	public static void main(String[] args) {
	AllSpaceInterface dao = new AllSpaceDAO();
	
	
	List<SpaceVO> list = dao.selectAllSpaceList();
	
	for(SpaceVO spaceVO : list) {
		System.out.println(spaceVO.getSpaceId());
		System.out.println(spaceVO.getSpaceName());
		System.out.println(spaceVO.getSpaceSignupDate());
		System.out.println(spaceVO.getDetailCharge());
		System.out.println(spaceVO.getSpaceContain());
		System.out.println(spaceVO.getSpaceAddress());
		System.out.println(spaceVO.getSpaceSignupDate());
		System.out.println(spaceVO.getSpaceLng());
		System.out.println(spaceVO.getSpaceLat());
		System.out.println(spaceVO.getAvgComment());
	}
	
	}
}
