package com.servletEx.controller;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import com.servletEx.entity.sample.SampleEntity;
import com.servletEx.service.SampleService;

/**
 * Servlet implementation class SampleAction
 */
public class SampleAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SampleAction() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String cmd = request.getParameter("cmd");
		cmd = "select";
		
		if(cmd.equals("insert")) {
				// 등록
			
			
		}else if(cmd.equals("select")) {
			// search
			
			String deptCode = request.getParameter("deptCode");
			
			SampleService sSvc = new SampleService();
			ArrayList list = sSvc.getSampleList();
			
			request.setAttribute("list", list);
			
			String url = "/sample/sampleList.jsp";
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
			
			String url = "/sample/sampleList.jsp";
			RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
			rd.forward(request, response);
		}else if(cmd.equals("update")) {
			// 수정
			
		}else if(cmd.equals("delete")) {
			// 삭제
		
		}
		
		
	}

}



