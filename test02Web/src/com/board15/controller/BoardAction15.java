package com.board15.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.PrintWriter;
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

import com.board15.entity.BoardEntity15;
import com.board15.entity.BoardFileEntity15;
import com.board15.service.BoardService15;
import com.google.gson.Gson;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

/**
 * Servlet implementation class BoardAction
 */
public class BoardAction15 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public BoardAction15() {
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
		String url = null;// "/stj15_ajax/table.jsp";
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
			url = "/stj15_ajax/writePage.jsp";

		} else if (cmd.equals("insertPro")) {
			System.out.println("insertPro");
			int setNum = Integer.parseInt(insertPro(request));

			if (!(setNum == 0)) {
				request = select(request);
				// request.setAttribute("cmd2", "select");
				System.out.println("insertPro:select");
				url = "/stj15_ajax/table.jsp";
			} else {
				System.out.println("insertPro:writePage");
				List list = GetByteCheck();
				request.setAttribute("list", list);
				request.setAttribute("errMsg", "fail");
				url = "/stj15_ajax/writePage.jsp";
			}

		} else if (cmd.equals("select")) {
			request = select(request);
			url = "/stj15_ajax/table.jsp";

		} else if (cmd.equals("update")) {
			System.out.println("update");

			BoardEntity15 boardEntity = new BoardEntity15();
			List list = null;
			boardEntity = update(request);
			list = GetByteCheck();
			ArrayList flist = updateGetFileName(request);

			request.setAttribute("flist", flist);
			request.setAttribute("list", list);
			request.setAttribute("boardEntity", boardEntity);
			url = "/stj15_ajax/postPage.jsp";

		} else if (cmd.equals("delete")) {
			int rsNum = delete(request);

			if (rsNum == 1) {
				request = select(request);
				url = "/stj15_ajax/table.jsp";
			} else {
				request.setAttribute("errMsg", "fail");
				url = "/stj15_ajax/postPage.jsp";
			}

		} else if (cmd.equals("detail")) {

			BoardEntity15 boardEntity = new BoardEntity15();
			List list = null;
			boardEntity = detail(request);
			list = GetByteCheck();
			ArrayList flist = updateGetFileName(request);

			request.setAttribute("flist", flist);
			request.setAttribute("list", list);
			request.setAttribute("boardEntity", boardEntity);
			url = "/stj15_ajax/postPage.jsp";

		} else if (cmd.equals("fileDown")) {

			fileDown(request, response);

		} else if (cmd.equals("UpdateFileInsertProSubmit")) {
			///UpdateFileInsertProSubmit(request, response);
			
		} else if (cmd.equals("ajaxListData")) {
			String listAjax = selectAjaxList(request);
			
			response.setContentType("text/html; charset=euc-kr");
			PrintWriter out = response.getWriter();
			out.write(listAjax);

		}
		
		// 페이지 이동
		if ( !cmd.equals("fileDown") && !cmd.equals("ajaxListData") ) {
			RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
			rd.forward(request, response);
		}

	}

	protected List insertPage() throws ServletException, IOException {
		//
		BoardService15 boardService = new BoardService15();
		List list = null;

		try {
			list = boardService.getByteCheck();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	protected HttpServletRequest select(HttpServletRequest request) throws ServletException, IOException {
		//
		String search_word = request.getParameter("search_word");
		String field = request.getParameter("field");
		String viewPage = request.getParameter("viewPage");

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

		ArrayList<BoardEntity15> bList = new ArrayList<BoardEntity15>();
		HashMap<String, String> selectMap = new HashMap<String, String>();
		selectMap.put("viewPage", viewPage);
		selectMap.put("pagingPath", pagingPath);
		selectMap.put("field", field);
		selectMap.put("search_word", search_word);

		BoardService15 boardService = new BoardService15(selectMap);
		bList = boardService.getList();
		String getPaging = boardService.getPaging();

		request.setAttribute("field", field);
		request.setAttribute("search_word", search_word);
		request.setAttribute("bList", bList);
		request.setAttribute("getPaging", getPaging);
		request.setAttribute("viewPage", viewPage);

		return request;
	}
	
	protected String selectAjaxList(HttpServletRequest request) throws ServletException, IOException {
		//
		String search_word = request.getParameter("search_word");
		String field = request.getParameter("field");
		String viewPage = request.getParameter("viewPage");
		
		System.out.println( "viewPage:"+viewPage );
		System.out.println( "field:"+field );
		System.out.println( "search_word:"+search_word );

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

		ArrayList<BoardEntity15> bList = new ArrayList<BoardEntity15>();
		HashMap<String, String> selectMap = new HashMap<String, String>();
		selectMap.put("viewPage", viewPage);
		selectMap.put("pagingPath", pagingPath);
		selectMap.put("field", field);
		selectMap.put("search_word", search_word);

		BoardService15 boardService = new BoardService15(selectMap);
		bList = boardService.getAjaxList();
		String getPaging = boardService.getPaging();
		
		Gson gson = new Gson();
		
		HashMap jsonMapData = new HashMap();
		jsonMapData.put("boardList",bList);
		jsonMapData.put("getPaging",getPaging);
		
		String jsonPlace = gson.toJson(jsonMapData);
		
		//System.out.println( "listAjax:"+jsonPlace );
		//System.out.println( "getPaging:"+getPaging );

		return jsonPlace;
	}

	protected BoardEntity15 update(HttpServletRequest request) throws ServletException, IOException {
		//
		String selNum = request.getParameter("selNum");
		String board_content = request.getParameter("board_content");

		BoardService15 boardService = new BoardService15();
		HashMap<String, String> updatetMap = new HashMap<String, String>();
		updatetMap.put("selNum", selNum);
		updatetMap.put("board_content", board_content);
		boardService.setUpdateData(updatetMap);
		ArrayList flist = boardService.getUpdateFileNames(selNum);
		BoardEntity15 boardEntity = new BoardEntity15();
		boardEntity = boardService.getDataPostPage(selNum); // 성공여부
		return boardEntity;
	}

	protected ArrayList updateGetFileName(HttpServletRequest request) throws ServletException, IOException {
		//
		String selNum = request.getParameter("selNum");

		System.out.println("selNum:" + selNum);

		BoardService15 boardService = new BoardService15();
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
		BoardService15 boardService = new BoardService15();
		int rsNum = boardService.setDelData(selNum); // 성공여부

		return rsNum;
	}

	protected BoardEntity15 detail(HttpServletRequest request) throws ServletException, IOException {
		//
		String selNum = request.getParameter("selNum");
		if (selNum == null) {
			selNum = "0";
		}
		BoardEntity15 boardEntity = new BoardEntity15();
		ArrayList<BoardFileEntity15> flist = new ArrayList<BoardFileEntity15>();
		BoardFileEntity15 boardFileEntity = new BoardFileEntity15();
		BoardService15 boardService = new BoardService15();
		boardEntity = boardService.getDataPostPage(selNum);
		// flist = boardService.getUpdateFileNames(selNum);

		return boardEntity;
	}

	protected List GetByteCheck() throws ServletException, IOException {
		//
		BoardService15 boardService = new BoardService15();
		List list = null;

		try {
			list = boardService.getByteCheck();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	protected String insertPro(HttpServletRequest request) throws ServletException, IOException {
		//
		String uploadPath = request.getSession().getServletContext().getRealPath("/upload");
		System.out.println(uploadPath);

		int size = 10 * 1024 * 1024;
		String name = "";
		String title = "";
		String content = "";
		String selFileCKCount = "";
		MultipartRequest multi = null;

		try {
			multi = new MultipartRequest(request, uploadPath, size, "UTF-8", new DefaultFileRenamePolicy());

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

		BoardService15 boardService = new BoardService15();
		HashMap<String, String> insertMap = new HashMap<String, String>();

		insertMap.put("title", title);
		insertMap.put("name", name);
		insertMap.put("content", content);

		setNum = Integer.toString(boardService.dataInsert(insertMap));

		if (!setNum.equals("0")) {
			System.out.println("setNum:" + setNum);

			if (!selFileCKCount.equals("0")) {
				boardService.FileSave(multi, uploadPath, setNum);
				System.out.println("setNum:" + setNum);
			}

			// System.out.println(setNum);
			// System.out.println(selFileCKCount);

		}

		return setNum;
	}

	protected String UpdateFileInsertProSubmit(HttpServletRequest request) throws ServletException, IOException {
		//
		String uploadPath = request.getSession().getServletContext().getRealPath("/upload");
		System.out.println(uploadPath);

		int size = 10 * 1024 * 1024;
		String selFileCKCount = "";
		MultipartRequest multi = null;
		String selNum = null;

		try {
			multi = new MultipartRequest(request, uploadPath, size, "UTF-8", new DefaultFileRenamePolicy());

			selFileCKCount = multi.getParameter("selFileCKCount");
			selNum = multi.getParameter("selNum");

			System.out.println("selFileCKCount:" + selFileCKCount);
			System.out.println("setNum:" + selNum);

		} catch (Exception e) {
			e.printStackTrace();
		}

		/////
		BoardService15 boardService = new BoardService15();

		if (!selFileCKCount.equals("0")) {
			//selNum = boardService.FileSave(multi, uploadPath, selNum);
		}
		
		return selNum;
		
	}

	public void fileDown(HttpServletRequest request, HttpServletResponse response) {

		BoardService15 boardService = new BoardService15();
		boardService.fileDown(request, response);
	}

}
