package com.popularFunction.service;

import java.util.List;

import com.space.model.SpaceVO;
import com.spaceComment.model.SpaceCommentVO;

public interface PopularInterface {
	
	public List<SpaceVO> listByPopular();
	public List<SpaceCommentVO> listByPopularCon();

	
}
