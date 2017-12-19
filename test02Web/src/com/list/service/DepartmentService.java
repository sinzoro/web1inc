package com.list.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.list.dao.DepartmentDao;

public class DepartmentService {

	DepartmentDao sDao = new DepartmentDao();
	
	public ArrayList getDepartmentList() {

		//ArrayList list = sDao.getDepartmentList();
		ArrayList list = sDao.getDepartmentIbatisList();

		return list;
	}
	
	public int setDepartmentInsert( HashMap<String, String> dMap ) {
		
		
		int rsNum = sDao.setDepartmentInsert( dMap );
		
		
		
		return rsNum;
	}
	

}

