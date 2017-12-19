package com.paging;

import java.util.ArrayList;

public class PagingLogic {

	///
	private int viewPage;	// present page
	private int allCount;	// all
	private int maxPagingViewCount;	// pagingmax
	private int viewCount;	// listCount
	private String pagingPath;	// linkPage
	private String styleTag;
		
	public PagingLogic(){
		
	}
	public PagingLogic( int viewPage ){
		this.viewPage = viewPage;	// page init
	}
		
	public String getPaging() {
		
		String pagingStr = "<div name='autoPaging'>";	// paging str start
			int s = allCount/viewCount;	// quotient(몫)
			int c = allCount%viewCount;	// remainder(나머지)
			int sels = (viewPage-1)/maxPagingViewCount;	// sel min and max
			int selc = viewPage%maxPagingViewCount;	// sel plus one
			if( c != 0 ) {
				s++;
			}
			if( selc != 0 ) {
				//sels++;
			}
			if( sels >= 1 ) {	// < 뒤로
				pagingStr += "<a href="+pagingPath+"?allCount="+allCount+"&viewCount="+viewCount
						+"&maxPagingViewCount="+maxPagingViewCount+"&viewPage="
						+(viewPage-maxPagingViewCount<1?1:viewPage-maxPagingViewCount)+ " target=_self><span><</span></a>" ;
			}
			for( int i=(sels*maxPagingViewCount)+1; i<=(sels*maxPagingViewCount)+maxPagingViewCount ; i++ ) {
				
				if( viewPage==i ) {	// paging list
					pagingStr += "<a href="+pagingPath+"?allCount="+allCount+"&viewCount="+viewCount
							+"&maxPagingViewCount="+maxPagingViewCount+"&viewPage="+i+"  target=_self><span>("+i+")</span></a>" ;
				}else {
					pagingStr += "<a href="+pagingPath+"?allCount="+allCount+"&viewCount="+viewCount
							+"&maxPagingViewCount="+maxPagingViewCount+"&viewPage="+i+ " target=_self><span>["+i+"]</span></a>" ;
				}
				if( s <= i ) {
					break;
				}
			}//for
			if( s/maxPagingViewCount > sels ) {	// > 앞으로
				pagingStr += "<a href="+pagingPath+"?allCount="+allCount+"&viewCount="+viewCount
						+"&maxPagingViewCount="+maxPagingViewCount+"&viewPage="
						+(viewPage+maxPagingViewCount>s?s:viewPage+maxPagingViewCount)+ " target=_self><span>></span></a>" ;
			}

			pagingStr += "</div>";
		
		
		
		return pagingStr;
	}
	
	// setting variable
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
	public void setPagingPath(String pagingPath) {
		this.pagingPath = pagingPath;
	}
	public void setStyleTag(String styleTag) {
		this.styleTag = styleTag;
	}
	
}
