package com.list8.service;

import java.util.ArrayList;

import com.list.dao.AttendDao;

public class AttendService {

	public ArrayList getattendList() {
	
		// data pro
		
		AttendDao sDao = new AttendDao();
		
		ArrayList list = sDao.getAttendList();
		
		return list;	
	}
	
	
	
}
