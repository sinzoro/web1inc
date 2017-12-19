package com.paging;

import java.util.ArrayList;

public class ListPagingLogic {

		///
		private int viewPage;
		private int allCount;
		private int maxPagingViewCount;
		private int viewCount;
		private String pagingPath;
		private String styleTag;

		ListLogic listLogic = new ListLogic();
		PagingLogic pagingLogic = new PagingLogic();


		public ListPagingLogic() {
			this.viewPage = 1;
			//this.allCount = 1000;
			this.allCount = listLogic.getAllcountNum();
			this.maxPagingViewCount = 6;
			this.viewCount = 6;
		}
		
		public ListPagingLogic( String viewPage, String pagingPath ) {
			this();
			this.viewPage = Integer.parseInt(viewPage);
			this.pagingPath = pagingPath;
			this.styleTag = styleTag;
		}
		
		public ArrayList<PagingData> getList(){
			listLogic.setMaxPagingViewCount( maxPagingViewCount );
			listLogic.setViewCount( viewCount );
			listLogic.setAllCount( allCount );
			listLogic.setViewPage( viewPage );
			
			return listLogic.getListOnePage();
		}
		
		public int getAllCount() {
			return allCount;
		}
		
		///
		public String getPaging() {
			pagingLogic.setMaxPagingViewCount( maxPagingViewCount );
			pagingLogic.setViewCount( viewCount );
			pagingLogic.setAllCount( allCount );
			pagingLogic.setViewPage( viewPage );
			pagingLogic.setPagingPath( pagingPath );
			
			return pagingLogic.getPaging();
		}
		
}
