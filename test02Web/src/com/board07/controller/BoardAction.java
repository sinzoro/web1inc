package com.board07.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.board07.entity.BoardEntity;
import com.board07.entity.BoardFileEntity;
import com.board07.service.BoardService;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

/**
 * Servlet implementation class BoardAction
 */
public class BoardAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public BoardAction() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// 기본 설정값 공통
		String url = null;// "/stj07/table.jsp";
		String cmd = request.getParameter("cmd");
		String errMsg = "";

		System.out.println("cmd:" + cmd);
		System.out.println("request.getMethod() : " + request.getMethod());
		if (cmd == null && request.getMethod().equals("GET")) {
			cmd = "select";
		} else if (cmd == null && request.getMethod().equals("POST")) {
			cmd = "insertPro";
		}
		System.out.println("cmd:" + cmd);

		/// 페이지 로직
		if (cmd.equals("insertPage")) {
			List list = GetByteCheck();
			request.setAttribute("list", list);
			request.setAttribute("errMsg", "");
			url = "/stj07/writePage.jsp";

		} else if (cmd.equals("insertPro")) {
			System.out.println("insertPro");
			int setNum = Integer.parseInt(insertPro(request));

			if( setNum == -1 ) {
				cmd = "UpdateFileInsertPro";
				System.out.println("insertPro:UpdateFileInsertPro");
				
			} else if (!(setNum == 0)) {
				request = select(request);
				// request.setAttribute("cmd2", "select");
				System.out.println("insertPro:select");
				url = "/stj07/table.jsp";
				
			} else {
				System.out.println("insertPro:writePage");
				List list = GetByteCheck();
				request.setAttribute("list", list);
				request.setAttribute("errMsg", "fail");
				url = "/stj07/writePage.jsp";
			}

		} else if (cmd.equals("select")) {
			request = select(request);
			url = "/stj07/table.jsp";

		} else if (cmd.equals("update")) {
			System.out.println("update");

			BoardEntity boardEntity = new BoardEntity();
			List list = null;
			boardEntity = update(request);
			list = GetByteCheck();
			ArrayList flist = updateGetFileName(request);

			request.setAttribute("flist", flist);
			request.setAttribute("list", list);
			request.setAttribute("boardEntity", boardEntity);
			url = "/stj07/postPage.jsp";

		} else if (cmd.equals("delete")) {
			int rsNum = delete(request);

			if (rsNum == 1) {
				request = select(request);
				url = "/stj07/table.jsp";
			} else {
				request.setAttribute("errMsg", "fail");
				url = "/stj07/postPage.jsp";
			}

		} else if (cmd.equals("detail")) {

			BoardEntity boardEntity = new BoardEntity();
			List list = null;
			boardEntity = detail(request);
			list = GetByteCheck();
			ArrayList flist = updateGetFileName(request);

			request.setAttribute("flist", flist);
			request.setAttribute("list", list);
			request.setAttribute("boardEntity", boardEntity);
			url = "/stj07/postPage.jsp";

		} else if (cmd.equals("fileDown")) {

			fileDown(request, response);

		} else if (cmd.equals("fileDel")) {
			
			fileDel(request, response);
			
			BoardEntity boardEntity = new BoardEntity();
			List list = null;
			boardEntity = detail(request);
			list = GetByteCheck();
			ArrayList flist = updateGetFileName(request);

			request.setAttribute("flist", flist);
			request.setAttribute("list", list);
			request.setAttribute("boardEntity", boardEntity);
			url = "/stj07/postPage.jsp";
			
		} else if (cmd.equals("ajaxListData")) {
			///UpdateFileInsertProSubmit(request, response);
		}
		

		// 페이지 이동	noforwad
		if ( !cmd.equals("fileDown") && !cmd.equals("UpdateFileInsertPro") ) {
			RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
			rd.forward(request, response);
		}

	}

	protected List insertPage() throws ServletException, IOException {
		//
		BoardService boardService = new BoardService();
		List list = null;

		try {
			list = boardService.getByteCheck();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	protected HttpServletRequest select(HttpServletRequest request) throws ServletException, IOException {
		//
		String search_word = request.getParameter("search_word");
		String field = request.getParameter("field");
		String viewPage = request.getParameter("viewPage");
		
		System.out.println( "viewPage:"+viewPage );

		if (search_word == null) {
			search_word = "";
		}
		if (field == null) {
			field = "board_title";
		}
		if (viewPage == null || viewPage.equals("")) {
			viewPage = "1";
		}

		String pagingPath = request.getContextPath() + "/BoardAction";
		String styleTag = "class=a11y_hidden";

		ArrayList<BoardEntity> bList = new ArrayList<BoardEntity>();
		HashMap<String, String> selectMap = new HashMap<String, String>();
		selectMap.put("viewPage", viewPage);
		selectMap.put("pagingPath", pagingPath);
		selectMap.put("field", field);
		selectMap.put("search_word", search_word);

		BoardService boardService = new BoardService(selectMap);
		bList = boardService.getList();
		String getPaging = boardService.getPaging();

		request.setAttribute("field", field);
		request.setAttribute("search_word", search_word);
		request.setAttribute("bList", bList);
		request.setAttribute("getPaging", getPaging);
		request.setAttribute("viewPage", viewPage);

		return request;
	}

	protected BoardEntity update(HttpServletRequest request) throws ServletException, IOException {
		//
		String selNum = request.getParameter("selNum");
		String board_content = request.getParameter("board_content");

		BoardService boardService = new BoardService();
		HashMap<String, String> updatetMap = new HashMap<String, String>();
		updatetMap.put("selNum", selNum);
		updatetMap.put("board_content", board_content);
		boardService.setUpdateData(updatetMap);
		ArrayList flist = boardService.getUpdateFileNames(selNum);
		BoardEntity boardEntity = new BoardEntity();
		boardEntity = boardService.getDataPostPage(selNum); // 성공여부
		return boardEntity;
	}

	protected ArrayList updateGetFileName(HttpServletRequest request) throws ServletException, IOException {
		//
		String selNum = request.getParameter("selNum");

		System.out.println("selNum:" + selNum);

		BoardService boardService = new BoardService();
		ArrayList flist = boardService.getUpdateFileNames(selNum);
		return flist;
	}

	protected int delete(HttpServletRequest request) throws ServletException, IOException {
		//
		String selNum = request.getParameter("selNum");
		if (selNum == null) {
			selNum = "0";
		}
		// System.out.println( "selNum:"+selNum );
		BoardService boardService = new BoardService();
		int rsNum = boardService.setDelData(selNum); // 성공여부

		return rsNum;
	}

	protected BoardEntity detail(HttpServletRequest request) throws ServletException, IOException {
		//
		String selNum = request.getParameter("selNum");
		if (selNum == null) {
			selNum = "0";
		}
		BoardEntity boardEntity = new BoardEntity();
		ArrayList<BoardFileEntity> flist = new ArrayList<BoardFileEntity>();
		BoardFileEntity boardFileEntity = new BoardFileEntity();
		BoardService boardService = new BoardService();
		boardEntity = boardService.getDataPostPage(selNum);
		// flist = boardService.getUpdateFileNames(selNum);

		return boardEntity;
	}

	protected List GetByteCheck() throws ServletException, IOException {
		//
		BoardService boardService = new BoardService();
		List list = null;

		try {
			list = boardService.getByteCheck();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	protected String insertPro(HttpServletRequest request) throws ServletException, IOException {
		//
		//String uploadPath = request.getSession().getServletContext().getRealPath("/upload");
		String uploadPath = "c:" +File.separator + "Upload3";
        File dir = new File( uploadPath + File.separator );
        if(!dir.exists()) {//업로드 디렉토리가 존재하지 않으면 생성
            dir.mkdirs();
        }
		System.out.println(uploadPath);

		int size = 10 * 1024 * 1024;
		String name = "";
		String title = "";
		String content = "";
		String selFileCKCount = "";
		String cmd = null;
		MultipartRequest multi = null;
		
		try {
			multi = new MultipartRequest(request, uploadPath, size, "UTF-8", new DefaultFileRenamePolicy());

			cmd = multi.getParameter("cmd");
			name = multi.getParameter("name");
			title = multi.getParameter("title");
			content = multi.getParameter("content");
			selFileCKCount = multi.getParameter("selFileCKCount");

			System.out.println("selFileCKCount:" + selFileCKCount);

		} catch (Exception e) {
			e.printStackTrace();
		}

		/////
		String setNum = "0";
		BoardService boardService = new BoardService();
		
		if( cmd.equals("insertPro") ) {

			HashMap<String, String> insertMap = new HashMap<String, String>();
			insertMap.put("title", title);
			insertMap.put("name", name);
			insertMap.put("content", content);;

			setNum = Integer.toString(boardService.dataInsert(insertMap));
			
		}else if( cmd.equals("UpdateFileInsertPro") ) {
			
			setNum = multi.getParameter("parentSelNum");
			System.out.println("parentSelNum:" + setNum);
			//setNum = "-1";
			
		}else {
			
		}

		if (!setNum.equals("0")) {
			System.out.println("setNum:" + setNum);

			if (!selFileCKCount.equals("0")) {
				boardService.FileSave(multi, uploadPath, setNum);
				System.out.println("setNum:" + setNum);
			}

			// System.out.println(setNum);
			// System.out.println(selFileCKCount);UpdateFileInsertProSubmit(request);
		}
		
		if( cmd.equals("UpdateFileInsertPro") ) {
			setNum = "-1";
			System.out.println( "setNum:"+setNum );
		}
		System.out.println("setNum:" + setNum);
		
		return setNum;
	}

	public void fileDel(HttpServletRequest request, HttpServletResponse response) {

		String delNum = request.getParameter("fileNum");
		BoardService boardService = new BoardService();
		String fileName = boardService.getFileName(delNum);
		ServletContext cxt = null;
		String fileUrl = null;
		String file = null;
		
		try {
			//fileName = new String(request.getParameter("fileUrl").getBytes("ISO-8859-1"), "KSC5601");
			// TODO Auto-generated catch block
			
				//String uploadPath = request.getSession().getServletContext().getRealPath("/upload");
				
				String uploadPath = "c:" +File.separator + "Upload3";
		        File dir = new File( uploadPath + File.separator );
		        if(!dir.exists()) {//업로드 디렉토리가 존재하지 않으면 생성
		            dir.mkdirs();
		        }
			
				System.out.println("fileName:::"+fileName);
				//System.out.println("uploadPath:::"+uploadPath);
			
				//cxt = getServletConfig().getServletContext();
				//fileUrl = "WebContent/StyleUpload/" + fileName;
				
				file = uploadPath+"\\"+fileName;
				
				//System.out.println(file);
				
				if(uploadPath == null) return;
				//boolean fileexists = true;
				//
				System.out.println( "file:::"+file );
				boardService.deleteFile( file );	// 파일 한개 삭제
				boardService.delFileBoardListData( delNum );

		}catch(Exception e){
		    e.printStackTrace();
		}
		//boardService.deleteFile( delNum );
	}
	
	public void fileDown(HttpServletRequest request, HttpServletResponse response) {

		
		String uploadPath = "c:" +File.separator + "Upload3";
        File dir = new File( uploadPath + File.separator );
        if(!dir.exists()) {//업로드 디렉토리가 존재하지 않으면 생성
            dir.mkdirs();
        }
		
		BoardService boardService = new BoardService();
		boardService.fileDown(request, response, uploadPath);
	}

}
