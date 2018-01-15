package com.list10.service;

import java.util.ArrayList;

import com.list.dao.SubjectDao;

public class SubjectService {

	public ArrayList getSubjectList() {
	
		// data pro
		
		SubjectDao sDao = new SubjectDao();
		
		ArrayList list = sDao.getSubjectList();
		
		return list;	
	}
	
}
