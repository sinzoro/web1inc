package com.paging;

import java.util.ArrayList;



public class ListLogic {

	
	private int viewPage;
	private int allCount;
	private int maxPagingViewCount;
	private int viewCount;
	
	ArrayList<PagingData> pList = new ArrayList<PagingData>();
	GetList getList = new GetList();
	
	public ArrayList<PagingData> getListOnePage(){
		
		int endNum = allCount - (viewCount*(viewPage-1));
		int startNum = endNum - viewCount;
		
		System.out.println( "startNum : " +startNum );
		System.out.println( "endNum : " +endNum );
		
		pList = getList.getListOnePageData( startNum, endNum );
		
		return pList;
	}
	
	public int getAllcountNum() {
		return getList.getAllcountNum2();
	}
	
	
	public void setMaxPagingViewCount( int maxPagingViewCount ) {
		this.maxPagingViewCount = maxPagingViewCount;
	}
	public void setViewCount( int viewCount ) {
		this.viewCount= viewCount;
	}
	public void setAllCount( int allCount ) {
		this.allCount = allCount;
	}
	public void setViewPage( int viewPage ) {
		this.viewPage = viewPage;
	}
	
}
