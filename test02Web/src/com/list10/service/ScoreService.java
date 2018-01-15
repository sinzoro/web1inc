package com.list10.service;

import java.util.ArrayList;

import com.list.dao.ScoreDao;

public class ScoreService {

	public ArrayList getScoreList() {
	
		// data pro
		
		ScoreDao sDao = new ScoreDao();
		
		ArrayList list = sDao.getScoreList();
		
		return list;	
	}
	
}
