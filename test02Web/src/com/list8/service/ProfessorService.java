package com.list8.service;


import java.util.ArrayList;
import com.list.dao.ProfessorDao;


public class ProfessorService {

	public ArrayList getProfessorList() {
	
		// data pro
		
		ProfessorDao sDao = new ProfessorDao();
		
		ArrayList list = sDao.getProfessorList();
		
		return list;	
	}
	
}
