package com.list.controller;

import java.io.IOException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.list.service.StudentService;

/**
 * Servlet implementation class SampleAction
 */
public class StudentAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StudentAction() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
//		response.setContentType("text/html; charset=UTF-8");
//		request.setCharacterEncoding("UTF-8");
		
		String cmd = request.getParameter("cmd");
		
		//String cmd = "select";
		if(cmd.equals("insert")) {
				// 등록
			
			
		}else if(cmd.equals("select")) {
			// search
			
			String srch = request.getParameter("srch");
			if( srch == null )srch = "10";

			HashMap<String,String> SMap = new HashMap<String,String>();
			SMap.put("srch", srch);
			
			StudentService sSvc = new StudentService();
			ArrayList list = sSvc.getStudentList(SMap);
			
			request.setAttribute("list", list);
			
			String url = "/stj08/studentList.jsp";
			RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
			rd.forward(request, response);
			
			
		}else if(cmd.equals("selectOne")) {
			
			
		}else if(cmd.equals("update")) {
			// 수정
			
		}else if(cmd.equals("delete")) {
			// 삭제
		
		}
		
		
	}

}



