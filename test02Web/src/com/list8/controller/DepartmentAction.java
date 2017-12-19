package com.list8.controller;


import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.list.entity.DepartmentEntity;
import com.list.service.DepartmentService;

/**
 * Servlet implementation class SampleAction
 */
public class DepartmentAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DepartmentAction() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String cmd = null;
		String url = "/stj08/departmentList.jsp";
		DepartmentService sSvc = new DepartmentService();
		
		
		if( request.getParameter("cmd") == null || request.getParameter("cmd").equals("") ) {
			cmd = "select";
		}else {
			cmd = request.getParameter("cmd");
		}
		
		if(cmd.equals("insert")) {
			// 등록
			
			String deptCode = request.getParameter("deptCode");
			String deptName = request.getParameter("deptName");
			String deptEname = request.getParameter("deptEname");
			String CreateDate = request.getParameter("CreateDate");
			
			DepartmentEntity de = new DepartmentEntity();
			
			HashMap<String, String> dMap = new HashMap<String, String>();
			dMap.put("deptCode", deptCode);
			dMap.put("deptName", deptName);
			dMap.put("deptEname", deptEname);
			
			int rsNum = sSvc.setDepartmentInsert( dMap );
			//request.setAttribute("list", list);
			
			if( rsNum == 1 ) {
				ArrayList list = sSvc.getDepartmentList();
				request.setAttribute("list", list);
				url = "/stj08/departmentList.jsp";
			}else {
				url = "/stj08/deptInsert.jsp";
			}
			
		}else if(cmd.equals("insertPage")) {
			
			url = "/stj08/deptInsert.jsp";
			
			
		}else if(cmd.equals("select")) {
			// search
			//DepartmentService sSvc = new DepartmentService();
			ArrayList list = sSvc.getDepartmentList();
			
			request.setAttribute("list", list);
			
			url = "/stj08/departmentList.jsp";
			
			
		}else if(cmd.equals("selectOne")) {
			
			
		}else if(cmd.equals("update")) {
			// 수정
			
		}else if(cmd.equals("delete")) {
			// 삭제
		
		}
		
		
		RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
		rd.forward(request, response);
		
	}

}



