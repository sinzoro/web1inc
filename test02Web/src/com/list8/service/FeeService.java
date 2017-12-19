package com.list8.service;

import java.util.ArrayList;

import com.list.dao.FeeDao;

public class FeeService {

	public ArrayList getFeeList() {
	
		// data pro
		
		FeeDao sDao = new FeeDao();
		
		ArrayList list = sDao.getFeeList();
		
		return list;	
	}
	
	
}
