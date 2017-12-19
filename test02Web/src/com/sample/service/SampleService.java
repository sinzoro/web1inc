package com.sample.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.sample.dao.SampleDao;
import com.sample.entity.SampleEntity;

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

		ArrayList list = sDao.getSampleListOne(sampleEntity);

		return list;
	}

	public ArrayList getSampleListOne(HashMap codeMap) {

		// data pro

		SampleDao sDao = new SampleDao();

		ArrayList list = sDao.getSampleListOne(codeMap);

		return list;
	}
	//////////////
	public int SampleInsert(HashMap insertMap) {
		
		// data pro
		
		SampleDao sDao = new SampleDao();
		
		int retVal=0;
		try {
			retVal = sDao.SampleInsert( insertMap );
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return retVal;	
	}

}
