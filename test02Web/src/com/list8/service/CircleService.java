package com.list8.service;

import java.util.ArrayList;

import com.list.dao.CircleDao;

public class CircleService {

	public ArrayList getCircleList() {
		
		// data pro
		
		CircleDao sDao = new CircleDao();
		
		ArrayList list = sDao.getCircleList();
		
		return list;	
	}
	
}
