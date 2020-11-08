package com.updateFunction.model;

import java.util.List;

import com.orderDetail.model.OrderDetailDAOInterface;
import com.orderDetail.model.OrderDetailVO;
import com.space.model.SpaceVO;

public class UpdateService {
	private UpdateInterface dao;
	
	public UpdateService() {
		dao =  new UpdateDAO();
	}
	
	public List<SpaceVO> listByDate() {
		return dao.listByDate();
	}
	
	
}
