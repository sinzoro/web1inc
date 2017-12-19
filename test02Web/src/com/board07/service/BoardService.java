package com.board07.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletOutputStream;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.board07.dao.BoardDao;
import com.board07.entity.BoardEntity;
import com.board07.entity.BoardFileEntity;
import com.oreilly.servlet.MultipartRequest;

public class BoardService {

	private int viewPage; // present page - 현재 페이지
	private int allCount; // all - 전체건수
	private int maxPagingViewCount; // pagingmax - 총 페이징 표시 갯수
	private int viewCount; // listCount - 총게시물수
	private String pagingPath; // linkPage
	private String field; // select field
	private String search_word; // serch_word

	public BoardService() {
		this.viewPage = 1;
		this.maxPagingViewCount = 2;
		this.viewCount = 2;
	}

	public BoardService(HashMap<String, String> selectMap) {
		this();
		this.viewPage = Integer.parseInt(selectMap.get("viewPage"));
		this.pagingPath = selectMap.get("pagingPath");
		this.field = selectMap.get("field");
		this.search_word = selectMap.get("search_word");
		// this.allCount = 1000;
		this.allCount = getAllCount();
	}

	BoardDao boardDao = new BoardDao();
	ArrayList<BoardEntity> boardList = new ArrayList<BoardEntity>();

	public ArrayList<BoardEntity> getList() {

		int endNum = allCount - (viewCount * (viewPage - 1));
		int startNum = endNum - viewCount;
		HashMap<String, String> listMap = new HashMap<String, String>();
		listMap.put("startNum", startNum + "");
		listMap.put("endNum", endNum + "");
		listMap.put("field", field);
		listMap.put("search_word", search_word);

		return boardList = boardDao.getList(listMap);
	}

	public String getOneSelect(String setNum) {
		String getNum = "";
		return getNum;
	}

	public int getAllCount() {
		HashMap<String, String> countMap = new HashMap<String, String>();
		countMap.put("field", field);
		countMap.put("search_word", search_word);
		return boardDao.getAllcountNum(countMap);
	}

	public int dataInsert(HashMap<String, String> insertMap) {
		return boardDao.setDataInsert(insertMap);
	}

	public BoardEntity getDataPostPage(String selNum) {
		boardDao.setBoardContentUp(selNum);
		return boardDao.getDataPostPage(selNum);
	}

	public int setUpdateData(HashMap<String, String> updatetMap) {
		return boardDao.setBoardUpdateData(updatetMap);
	}

	public int setDelData(String selNum) {
		return boardDao.setBoardDelData(selNum);	// 보드 정보 삭제
	}

	public List getByteCheck() throws Exception {
		return boardDao.byteCheck();
	}

	public void FileSave( MultipartRequest multi, String uploadPath, String setNum ) {

		String selFileCKCount = multi.getParameter("selFileCKCount");

		String[] filename = null;
		String[] origfilename = null;
		String[] newfilename = null;
		File oldFile[] = null;
		File newFile[] = null;

		filename = new String[Integer.parseInt(selFileCKCount)];
		origfilename = new String[Integer.parseInt(selFileCKCount)];
		newfilename = new String[Integer.parseInt(selFileCKCount)];

		oldFile = new File[Integer.parseInt(selFileCKCount)];
		newFile = new File[Integer.parseInt(selFileCKCount)];

		Enumeration files = multi.getFileNames();

		for (int i = 0; i < Integer.parseInt(selFileCKCount); i++) {
			String file1 = (String) files.nextElement();
			System.out.println( file1 );
			filename[i] = multi.getFilesystemName(file1);
			// newfilename[i]=multi.getOriginalFileName(file1);

			// 타임스탬프
			long currentTime = System.currentTimeMillis();
			SimpleDateFormat simDf = new SimpleDateFormat("yyyyMMddHHmmss");
			String dateTimeString = simDf.format(new java.util.Date(currentTime));
			int randomNumber = (int) (Math.random() * 100000);
			String uniqueFileName = "" + dateTimeString + randomNumber;
			String newuniqueFileName = "";

			System.out.println( "filename["+i+"]:"+filename[i] );
			System.out.println( "uniqueFileName:"+uniqueFileName );
			System.out.println( "uploadPath:"+uploadPath );

			oldFile[i] = new File(uploadPath + "\\" + filename[i]);
			newFile[i] = new File(uploadPath + "\\" + uniqueFileName);

			int count = 1;
			while (newFile[i].exists()) {
				newuniqueFileName = uniqueFileName + "_" + count;
				count = count + 1;
				newFile[i] = new File(uploadPath + "\\" + newuniqueFileName);
			}
			oldFile[i].renameTo(newFile[i]);
			// System.out.println("oldFile:"+ oldFile[i].getName() );
			// System.out.println("newFile:"+ newFile[i].getName() );
			origfilename[i] = oldFile[i].getName();
			newfilename[i] = newFile[i].getName();
			// i++;
		} // for 파일 총갯수

		///
		ArrayList<BoardFileEntity> flist = new ArrayList<BoardFileEntity>();
		BoardFileEntity boardFileEntity = null;
		///
		for (int i = 0; i < Integer.parseInt(selFileCKCount); i++) {
			System.out.println("origfilename[" + i + "]:" + origfilename[i]);
			System.out.println("newfilename[" + i + "]:" + newfilename[i]);

			if( !origfilename[i].equals("null") ) {
				
				boardFileEntity = new BoardFileEntity();
				boardFileEntity.setFileNum(i);
				boardFileEntity.setBoardNum(Integer.parseInt(setNum));
				boardFileEntity.setOrgNm(origfilename[i]);
				boardFileEntity.setSysNm(newfilename[i]);
				flist.add(boardFileEntity);
				System.out.println( "in!!!" );
			}else {
				
			}
		}

		try {
			setBoardFileUpload(flist);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public int setBoardFileUpload( ArrayList<BoardFileEntity> flist ) throws Exception {
		
		HashMap fileHm = new HashMap();
		fileHm = boardDao.setBoardFileUpload(flist);
		
		String delFile = null;
		for( int i=0;i<fileHm.size();i++ ) {
			delFile = (String) fileHm.get(i);
			deleteFile(delFile);
		}
		return 3;
	}
	
	public ArrayList<BoardFileEntity> getUpdateFileNames( String selNum ) {

		return boardDao.getUpdateFileNames(selNum);
	}
	
	public String getFileName( String delFile ) {
		System.out.println( "deleteFile:"+delFile );
		//
		String getFileName = null;
		HashMap getFileMap = boardDao.getFileName( delFile );
		getFileName = (String) getFileMap.get("SYS_NM");
		return getFileName;
	}
	
	public void  deleteFile( String delFile ) {
		System.out.println( "deleteFile:"+delFile );
		//
		File fileEx = new File( delFile );
		if(fileEx.exists())
		{
			fileEx.delete();
		}
	}
	
	public int delFileBoardListData(String selNum) {
		return boardDao.delFileBoardListData(selNum);	// 파일정보 테이블 y -> n 변경 
	}
	
	public void fileDown( HttpServletRequest request, HttpServletResponse response ) {
		
		String fileNum = request.getParameter("fileNum");
		
		HashMap fileDownName = new HashMap();
		fileDownName = boardDao.getFileName(fileNum);
		
		String fileName = (String) fileDownName.get("SYS_NM");
		String fileName2 = (String) fileDownName.get("ORG_NM");
		
		System.out.println( "fileName:"+ fileName );
		
		ServletContext context = request.getServletContext();

		String savePath = "upload";
		String sDownloadPath = context.getRealPath(savePath);
		String sFilePath = sDownloadPath + "\\" + fileName;
		String sMimeType = request.getServletContext().getMimeType(sFilePath);
		
		int size = 10*1024*1024;
		byte c[] = new byte[size];
		FileInputStream in = null;

		System.out.println("sMimeType>>>" + sMimeType);
		
		try {
			in = new FileInputStream(sFilePath);
			
			if (sMimeType == null)
				sMimeType = "application/octet-stream";

			//out.clear();					//	response err 해결
			//out=pageContext.pushBody(); 	//	response err 해결
			response.reset();
			response.setContentType(sMimeType);
			String agent = request.getHeader("User-Agent");
			boolean ieBrowser = (agent.indexOf("MSIE") > -1) || (agent.indexOf("Trident") > -1);

			if (ieBrowser) {
				fileName = URLEncoder.encode(fileName2, "UTF-8").replaceAll("\\+", "%20");
			} else {
				fileName = new String(fileName2.getBytes("UTF-8"), "iso-8859-1");
			}

			response.setHeader("Content-Disposition", "attachment; filename= " + fileName);

			ServletOutputStream out2 = response.getOutputStream();
			int numRead;

			while ((numRead = in.read(c, 0, c.length)) != -1) {
				out2.write(c, 0, numRead);
			}
			out2.flush();
			out2.close();
			in.close();
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public String getPaging() {

//		private int viewPage; // present page - 현재 페이지
//		private int allCount; // all - 전체건수
//		private int maxPagingViewCount; // pagingmax - 총 페이징 표시 갯수
//		private int viewCount; // listCount - 총게시물수
		
		// paging str start
		String pagingStr = "<div class=ui_page_navigator role=navigation aria-label=페이지 선택>"
				+ "<input type=hidden name=allCount><input type=hidden name=viewCount><input type=hidden name=maxPagingViewCount><input type=hidden id=viewPage name=viewPage value='1'>"
				+ "<script language=javascript>" + "	function selectedPageSubmit( selNum ){"
				+ "		document.getElementById('viewPage').value = selNum;"
				// + " alert( 'testA:'+selNum +':'+document.getElementById('viewPage').value );
				// "
				+ "		document.forms[0].submit(); " // form 값이 하나일때만 사용 여러개면 form name 써주세요.
				+ "	}" + "</script>";
		// String pagingStr = "<form action="+pagingPath+" method='post'><div
		// class=ui_page_navigator role=navigation aria-label=페이지 선택>"; // paging str
		// start
		String alinkTag = " class=ui_pgn_active "; // alink style
		int s = allCount / viewCount; // quotient(몫) - 총페이지
		int c = allCount % viewCount; // remainder(나머지) - 추가 원 페이지
		int sels = (viewPage - 1) / maxPagingViewCount; // sel min and max - 페이지 표시 숫자 곱용? 이제필요 없는거 아님? 
		int selc = viewPage % maxPagingViewCount; // sel plus one
		if (c != 0) {
			s++;
		}
		if (selc != 0) {
		//	sels++;
		}
		if (sels >= 1) { // < 뒤로
			pagingStr += "<a id=ui_pgn_prev title=이전페이지 class=pgn_btn href=javascript:selectedPageSubmit("
					+ ((viewPage - maxPagingViewCount) < 1 ? 1 : (viewPage - maxPagingViewCount))
					+ ") target=_self><span class=a11y_hidden>이전페이지</span></a>";
		}
		for (int i = (sels * maxPagingViewCount) + 1; i <= (sels * maxPagingViewCount) + maxPagingViewCount; i++) {

			if (viewPage == i) { // paging list
				pagingStr += "<a href=javascript:selectedPageSubmit(" + i + ")  target=_self id=pgn_a_" + i + " "
						+ alinkTag + " ><span>" + i + "</span></a>"; // present page
			} else {
				pagingStr += "<a href=javascript:selectedPageSubmit(" + i + ")  target=_self id=pgn_a_" + i
						+ "  ><span>" + i + "</span></a>";
			}
			if (s <= i) {
				break;
			}
		} // for
		if (  (sels*maxPagingViewCount+1) != s ) { // > 앞으로
			pagingStr += "<a  title=다음페이지 id=ui_pgn_next class=pgn_btn href=javascript:selectedPageSubmit("
					+ ((viewPage + maxPagingViewCount) > s ? s : (viewPage + maxPagingViewCount))
					+ ") target=_self><span class=a11y_hidden>다음페이지</span></a>";
		}
		pagingStr += "</div>";

		//System.out.println( "s:"+s );
		//System.out.println( "sels:"+sels );
		//System.out.println( "c:"+c );
		
		return pagingStr;
	}

}
