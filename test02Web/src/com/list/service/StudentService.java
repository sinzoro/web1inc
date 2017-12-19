package com.list.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.list.dao.StudentDao;


public class StudentService {

	public ArrayList getStudentList(HashMap<String,String> SMap) {
	
		// data pro
		
		StudentDao sDao = new StudentDao();
		
		ArrayList list = sDao.getStudentList(SMap);
		
		return list;	
	}
	
	
}
