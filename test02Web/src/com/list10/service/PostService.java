package com.list10.service;

import java.util.ArrayList;

import com.list.dao.PostDao;

public class PostService {

	public ArrayList getPostList() {
	
		// data pro
		
		PostDao sDao = new PostDao();
		
		ArrayList list = sDao.getPostList();
		
		return list;	
	}
	
	
	
}
