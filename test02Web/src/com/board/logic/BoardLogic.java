package com.board.logic;

import java.util.ArrayList;

import com.board.data.BoardData;

public class BoardLogic {

	private int viewPage; // present page
	private int allCount; // all
	private int maxPagingViewCount; // pagingmax
	private int viewCount; // listCount
	private String pagingPath; // linkPage
	private String field;	//select field
	private String search_word;	//serch_word

	public BoardLogic() {
		this.viewPage = 1;
		this.maxPagingViewCount = 2;
		this.viewCount = 2;
	}

	public BoardLogic( String viewPage, String pagingPath, String field, String search_word ) {
		this();
		this.viewPage = Integer.parseInt(viewPage);
		this.pagingPath = pagingPath;
		this.field = field;
		this.search_word = search_word;
		// this.allCount = 1000;
		this.allCount = getAllCount();
	}

	GetBoardDataLogic getBoardDataLogic = new GetBoardDataLogic();
	ArrayList<BoardData> boardList = new ArrayList<BoardData>();

	public ArrayList<BoardData> getList() {

		int endNum = allCount - (viewCount * (viewPage - 1));
		int startNum = endNum - viewCount;

		return boardList = getBoardDataLogic.getList(startNum, endNum, field, search_word );
	}

	public int dataInsert( BoardData boardData ) {
		return getBoardDataLogic.setDataInsert( boardData );
	}
	public BoardData dataUpdateBoardCnt( BoardData boardData ) {
		return getBoardDataLogic.setBoardContentUp( boardData );
	}
	
	public BoardData getDataPostPage( int selNum ) {
		return getBoardDataLogic.getBoardPostPage( selNum );
	}
	
	public int setUpdateData( BoardData boardData ) {
		return getBoardDataLogic.setBoardUpdateData( boardData );
	}
	
	public int setDelData( int selNum ) {
		return getBoardDataLogic.setBoardDelData( selNum );
	}
	
	public int getAllCount() {
		return getBoardDataLogic.getAllcountNum(  field,  search_word );
	}

	public String getPaging() {

		String pagingStr = "<div class=ui_page_navigator role=navigation aria-label=페이지 선택>"; // paging str start
		String alinkTag = " class=ui_pgn_active ";	// alink style
		int s = allCount / viewCount; // quotient(몫)
		int c = allCount % viewCount; // remainder(나머지)
		int sels = (viewPage - 1) / maxPagingViewCount; // sel min and max
		int selc = viewPage % maxPagingViewCount; // sel plus one
		if (c != 0) {
			s++;
		}
		if (selc != 0) {
			// sels++;
		}
		if (sels >= 1) { // < 뒤로
			pagingStr += "<a id=ui_pgn_prev title=이전페이지 class=pgn_btn href=" + pagingPath + "?allCount=" + allCount + "&viewCount=" + viewCount
					+ "&maxPagingViewCount=" + maxPagingViewCount + "&field="+field+"&search_word="+search_word+ "&viewPage="
					+ (viewPage - maxPagingViewCount < 1 ? 1 : viewPage - maxPagingViewCount)
					+ " target=_self><span class=a11y_hidden>이전페이지</span></a>";
		}
		for (int i = (sels * maxPagingViewCount) + 1; i <= (sels * maxPagingViewCount) + maxPagingViewCount; i++) {

			if (viewPage == i) { // paging list
				pagingStr += "<a href=" + pagingPath + "?allCount=" + allCount + "&viewCount=" + viewCount
						+ "&maxPagingViewCount=" + maxPagingViewCount + "&field="+field+"&search_word="+search_word + "&viewPage=" + i + "  target=_self id=pgn_a_"+i+" "+alinkTag+" ><span>" + i
						+ "</span></a>";	// present page
			} else {
				pagingStr += "<a href=" + pagingPath + "?allCount=" + allCount + "&viewCount=" + viewCount
						+ "&maxPagingViewCount=" + maxPagingViewCount + "&field="+field+"&search_word="+search_word + "&viewPage=" + i + " target=_self  id=pgn_a_"+i+" ><span>" + i
						+ "</span></a>";
			}
			if (s <= i) {
				break;
			}
		} // for
		//if (s / maxPagingViewCount > sels) { // > 앞으로
		if (  (sels*maxPagingViewCount+1) != s ) { // > 앞으로
			pagingStr += "<a  title=다음페이지 id=ui_pgn_next class=pgn_btn href=" + pagingPath + "?allCount=" + allCount + "&viewCount=" + viewCount
					+ "&maxPagingViewCount=" + maxPagingViewCount + "&field="+field+"&search_word="+search_word + "&viewPage="
					+ (viewPage + maxPagingViewCount > s ? s : viewPage + maxPagingViewCount)
					+ " target=_self><span class=a11y_hidden>다음페이지</span></a>";
		}

		pagingStr += "</div>";

		return pagingStr;
	}

	
}
