package com.sample.controller;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import com.sample.entity.SampleEntity;
import com.sample.service.SampleService;

/**
 * Servlet implementation class SampleAction
 */
public class SampleAction2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SampleAction2() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String cmd = request.getParameter("cmd");
		
//		if( cmd == null ) {
//			cmd = "select";
//		}
		
		if( cmd == null ) {
			cmd = "insert";
		}
		
		if(cmd.equals("insert")) {
			// 등록
			String url = "/sample2/sampleFront2.jsp";
			System.out.println( "sampleFront" );
			RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
			rd.forward(request, response);
			
		}else if(cmd.equals("select")) {
			// search
			
			String deptCode = request.getParameter("deptCode");
			
			SampleService sSvc = new SampleService();
			ArrayList list = sSvc.getSampleList();
			
			request.setAttribute("list", list);
			
			String url = "/sample2/sampleList.jsp";
			System.out.println( "sampleList.jsp" );
			RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
			rd.forward(request, response);
			
			
		}else if(cmd.equals("selectOne")) {
			String deptCode = request.getParameter("deptCode");
			
			SampleEntity sampleEntity = new SampleEntity();
			sampleEntity.setDeptCode(deptCode);
			
			
			SampleService sSvc = new SampleService();
			//ArrayList list = sSvc.getSampleListOne( sampleEntity );
			
			HashMap<String,String> codeMap = new HashMap();
			codeMap.put("deptCode", deptCode);
			ArrayList list = sSvc.getSampleListOne( codeMap );
			
			
			request.setAttribute("list", list);
			
			String url = "/sample2/sampleList.jsp";
			RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
			rd.forward(request, response);
		}else if(cmd.equals("update")) {
			// 수정
			
		}else if(cmd.equals("delete")) {
			// 삭제
			
		}else if(cmd.equals("insertPro")) {
			// intro
			String deptName = request.getParameter("deptName");
			String deptCode = request.getParameter("deptCode");
			String deptEname = request.getParameter("deptEname");
			
			System.out.println("deptName:"+deptName);
			
			HashMap<String,String> insertMap = new HashMap();
			insertMap.put("deptName", deptName);
			insertMap.put("deptCode", deptCode);
			insertMap.put("deptEname", deptEname);
			
			SampleService sSvc = new SampleService();
			sSvc.SampleInsert(insertMap);
			
			String url = "/sample2/sampleFront2.jsp";
			RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
			rd.forward(request, response);
		}
		
		
	}

}



