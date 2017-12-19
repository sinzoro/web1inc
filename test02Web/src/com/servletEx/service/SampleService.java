package com.servletEx.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.servletEx.dao.SampleDao;
import com.servletEx.entity.sample.SampleEntity;

public class SampleService {

	public ArrayList getSampleList() {
	
		// data pro
		
		SampleDao sDao = new SampleDao();
		
		ArrayList list = sDao.getSampleList();
		
		return list;	
	}
	
	public ArrayList getSampleListOne(SampleEntity sampleEntity) {
		
		// data pro
		
		SampleDao sDao = new SampleDao();
		
		ArrayList list = sDao.getSampleListOne( sampleEntity );
		
		return list;	
	}
	
public ArrayList getSampleListOne(HashMap codeMap) {
		
		// data pro
		
		SampleDao sDao = new SampleDao();
		
		ArrayList list = sDao.getSampleListOne( codeMap );
		
		return list;	
	}
	
}
