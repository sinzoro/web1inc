package com.paging;

import java.util.ArrayList;



public class ListLogicBack2 {

	
	private int viewPage;
	private int allCount;
	private int maxPagingViewCount;
	private int viewCount;
	
	ArrayList<PagingData> pList = new ArrayList<PagingData>();
	
	public ArrayList<PagingData> getList(){
		
		int startNum = allCount -(viewCount*(viewPage-1));
		
		for( int i=0; i<viewCount; i++ ) {
			PagingData pagingData = new PagingData();
			//pagingData.setTmp( (startNum-i)+"" );
			pList.add( pagingData );
		}
		
		return pList;
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
