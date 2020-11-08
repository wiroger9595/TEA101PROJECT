package com.popularFunction.service;

import java.util.List;

import com.space.model.SpaceVO;
import com.spaceComment.model.SpaceCommentVO;



public class TestPopular {
	public static void main(String[] args) {
		
	PopularInterface dao = new PopularDAO();
		
		
	List<SpaceVO> list = dao.listByPopular();
	
	
	
	
	
	 
	
	
	for(SpaceVO spaceVO : list) {
		
		
		System.out.println(spaceVO.getSpaceId());
		System.out.println(spaceVO.getSpaceName());
		System.out.println(spaceVO.getSpaceSignupDate());
		System.out.println(spaceVO.getSpaceAddress());
		System.out.println(spaceVO.getAvgComment());

		
		
		}
	
	
	
	}
}



